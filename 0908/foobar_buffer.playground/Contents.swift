import Foundation
import Cocoa
//import AppKit

/*
 * Circular buffer
 * push()
 * pop()
 * peek()
 * clear()
 * isEmpty()
 * isFull()
 * count
 * capacity
 * insert(_:atIndex)
 * removeAtIndex(_)
 */

// default size
private struct Constants {
    fileprivate static let defaultBufferCapacity: Int = 16
}

public enum CircularBufferOperation {
    case Ignore, Overwrite
}

public struct CircularBuffer<T> {
    fileprivate var data: [T]
    fileprivate var head: Int = 0, tail: Int = 0
    
    private var internalCount: Int = 0
    private var overwriteOperation: CircularBufferOperation = CircularBufferOperation.Overwrite
    
    
    
    // 빈 CircularBuffer
    public init() {
        data = [T]()
        data.reserveCapacity(Constants.defaultBufferCapacity)
    }
    
    
    // 포인터 값을 1씩 증가시킴
    fileprivate func incrementPointer(pointer: Int) -> Int {
        return (pointer + 1) & (data.capacity - 1)
    }
    
    // 포인터 값을 1씩 감소 시킴
    fileprivate func decrementPointer(pointer: Int) -> Int {
        return (pointer - 1) & (data.capacity - 1)
    }
    
    
    // count 프로퍼티의 CircularBuffer 생성
    public init(_ count: Int, overwriteOperation: CircularBufferOperation = .Overwrite) {
        var capacity = count
        
        if (capacity < 1) {
            capacity = Constants.defaultBufferCapacity
        }
        
        // count만큼 2를 거듭제곱으로 함.
        
        if((capacity & (~capacity + 1)) != capacity) {
            var b = 1
            while (b < capacity) {
                b = b << 1
            }
            capacity = b
        }
        
        data = [T]()
        data.reserveCapacity(capacity)
        self.overwriteOperation = overwriteOperation
    }
    
    // Sequence에서 CircularBuffer 생성
    public init<S: Sequence>(_ elements: S, size: Int) where S.Iterator.Element == T {
        self.init(size)
        elements.forEach({push(element: $0)})
    }
    

    
    public mutating func push(element: T) {
        if (isFull()) {
            switch(overwriteOperation) {
            case .Ignore:
                return
            case .Overwrite:
                pop()
            }
        }
        
        if (data.endIndex < data.capacity) {
            data.append(element)
        } else {
            data[tail] = element
        }
        
        tail = incrementPointer(pointer: tail)
        internalCount += 1
    }
    
    
    
    public mutating func pop() -> T? {
        if (isEmpty()) {
            return nil
        }
        
        let el = data[head]
        head = incrementPointer(pointer: head)
        internalCount -= 1
        return el
    }
    
    public func peek() -> T? {
        if (isEmpty()) {
            return nil
        }
        return data[head]
    }
    
    public mutating func clear() {
        head = 0
        tail = 0
        internalCount = 0
        data.removeAll(keepingCapacity: true)
    }
    
    
    public func isEmpty() -> Bool {
        return (count < 1)
    }
    
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    public var count: Int  {
        return internalCount
    }
    
    public var capacity: Int {
        get {
            return data.capacity
        } set {
            data.reserveCapacity(newValue)
        }
    }
    
    // logicalIndex 값을 내부 배열 요소의 index 값으로 변환(서브스크립트 작성을 위해)
    fileprivate func convertLogicalToIndex(logicalIndex: Int) -> Int {
        return (head + logicalIndex) & (data.capacity - 1)
    }
    
    
    
    // index 범위 확인
    fileprivate func checkIndex(index: Int) {
        if (index < 0 || index > count ) {
            fatalError("Index out of range")
        }
    }
   
    
    
}

// 만들었으니 선언해서 사용해보자 (4는 동작이 잘되는데..)

//var circleBuffer = CircularBuffer<Int>(4)
//
//circleBuffer.push(element: 100)
//circleBuffer.push(element: 200)
//circleBuffer.push(element: 300)
//circleBuffer.push(element: 400)
//circleBuffer.push(element: 500)
//circleBuffer.push(element: 600)
//circleBuffer.push(element: 700)

extension CircularBuffer: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}






// 2, 4, 8.. 이런 사이즈만 인식함. 현재 옵션은 갱신되지 않게 무시.
var circleBuffer = CircularBuffer<Int>(8, overwriteOperation: CircularBufferOperation.Ignore)

circleBuffer.push(element: 100)
circleBuffer.push(element: 200)
circleBuffer.push(element: 300)
circleBuffer.push(element: 400)
circleBuffer.push(element: 500)

circleBuffer.push(element: 600)
circleBuffer.push(element: 600)
circleBuffer.push(element: 600)
circleBuffer.push(element: 600)
circleBuffer.push(element: 600)
let cnt = circleBuffer.count


// 배열 리터럴 문법 사용 추가

extension CircularBuffer: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init(elements, size: elements.count)
    }
    
}

var testBuffer: CircularBuffer<Int> = [1,2,3,4]
testBuffer.push(element: 100)




// for..in extention

extension CircularBuffer: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var newData = [T]()
        
        if count > 0 {
            newData = [T](repeating: data[head], count: count)
            if head > tail {
                // 처음 절반에 해당하는 요소의 수 복사
                let front = data.capacity - head
                newData[0..<front] = data[head..<data.capacity]
                
                if front < count {
                    newData[front + 1..<newData.capacity] = data[0..<count - front]
                }
            } else {
                newData[0..<tail - head] = data[head..<tail]
            }
        }
        return AnyIterator(IndexingIterator(_elements: newData.lazy))
    }
}



