//import Foundation
//import AppKit
import Cocoa






// Stack

public struct Stack<T> {
    private var elements = [T]()
    public init() {}
    
    mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    //push
    mutating func push(element: T) {
        self.elements.append(element)
    }
    
    //peek
    public func peek() -> T? {
        return self.elements.last
    }
    
    //isEmpty
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int{
        return self.elements.count
    }
}






// 타입 값을 출력할 때 이해하기 쉬운 이름을 반환하기 위해
extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return self.elements.description
    }
    
    public var debugDescription: String {
        return self.elements.debugDescription
    }
}

// 스택 초기화시 배열처럼 동작하게


public struct ArrayIterator<T> : IteratorProtocol {
    var currentElement: [T]
    init(elements: [T]) {
        self.currentElement = elements
    }
    
    mutating public func next() -> T? {
        if (!self.currentElement.isEmpty) {
            return self.currentElement.popLast()
        }
        return nil
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: self.elements.reversed()))
    }
    
    public init<S : Sequence> (_ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
    
}


var testStack = [4,5,6,7]

var testStackFromStack = Stack<Int>(testStack)
