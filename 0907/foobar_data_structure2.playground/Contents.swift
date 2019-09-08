import Cocoa

//Queue

/*
 * enqueue()
 * dequeue()
 * peek()
 * clear()
 * count
 * isEmpty()
 * isFull()
 * capacity
 * insert(_:atIndex)
 * removeAtIndex(_)
 */



public struct Queue<T> {
    private var data = [T]()
    
    public init() {}
    
    
    
    mutating func enqueue(element: T) {
        data.append(element)
    }
    
    mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    public func peek() -> T? {
        return data.first
    }
    
    mutating func clear() {
        data.removeAll()
    }
    
    public var count: Int {
        return data.count
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
}



extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return data.description
    }
    
    
    public var debugDescription: String {
        return data.debugDescription
    }
}


var queue = Queue<Int>()

queue.enqueue(element: 100)
queue.enqueue(element: 150)
queue.enqueue(element: 200)
queue.enqueue(element: 300)

queue.dequeue()

queue.peek()

// Queue init시, 배열과 같은 기능을 수행할 수 있도록.
extension Queue: ExpressibleByArrayLiteral {
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T{
        data.append(contentsOf: elements)
    }
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

var testQueue:Queue<Int> = [1, 2, 3]

// Queue가 for..in 문을 수행할 수 있게

extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: data.lazy))
    }
    public func generate() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: data.lazy))
    }
}


// Queue의 값을 설정하거나 가져올 수 있는 프로토콜

extension Queue: MutableCollection {
    // index 범위 확인
    private func checkIndex(index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
    
    public var startIndex: Int  {
        return 0
    }
    
    public var endIndex: Int {
        return count - 1
    }
    
    //해당 인덱스의 다음 위치 값을 반환
    
    public func index(after i: Int) -> Int {
        return data.index(after: i)
    }
    
    public subscript(index: Int) -> T {
        get {
            checkIndex(index: index)
            return data[index]
        }
        set {
            checkIndex(index: index)
            data[index] = newValue
        }
    }
}


var testq: Queue<Int> = [1, 2, 3, 4, 5]

// SequenceType을 받는 init 메소드 활용

var testq2 = Queue<Int>(testq)

let q1 = testq.dequeue()

testq2.enqueue(element: 77)

for value in testq2 {
    print(value)
}
