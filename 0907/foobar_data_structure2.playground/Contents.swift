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


