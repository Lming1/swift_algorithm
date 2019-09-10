import Cocoa





/*
 * Linked List
 *
 * push()
 * pop()
 * peek()
 * isEmpty()
 * count
 *
 */


public struct LinkedList<T> {
    fileprivate var head: Node<T>? = nil
    private var _count: Int = 0
    public init() {}
    
    public mutating func push(element: T) {
        let node = Node<T>(data: element)
        node.next = head
        head = node
        _count += 1
    }
    
    public mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        
        let item = head?.data
        head = head?.next
        _count -= 1
        return item
    }
    
    public func peek() -> T? {
        return head?.data
    }
    
    
    public func isEmpty() -> Bool{
        return count == 0
    }
    
    public var count: Int {
        return _count
    }
}


public class Node<T> {
    fileprivate var next: Node<T>?
    fileprivate var data: T
    init(data: T) {
        next = nil
        self.data = data
    }
}




//protocol

extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var d = "["
        var lastNode = head
        while lastNode != nil {
            d = d + "\(lastNode?.data)"
            lastNode = lastNode?.next
            if lastNode != nil {
                d = d + ","
            }
        }
        d = d + "]"
        return d
    }
    
    public var debugDescription: String {
        var d = "["
        var lastNode = head
        while lastNode != nil {
            d = d + "\(lastNode?.data)"
            lastNode = lastNode?.next
            if lastNode != nil {
                d = d + ","
            }
        }
        d = d + "]"
        return d
    }
}

var linkedList = LinkedList<Int>()

//linkedList.pop()
linkedList.push(element: 20)
linkedList.push(element: 30)
linkedList.push(element: 40)

linkedList.pop()

extension LinkedList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        for el in elements {
            push(element: el)
        }
    }
}

public struct NodeIterator<T>: IteratorProtocol {
    public typealias Element = T
    private var head: Node<Element>?
    fileprivate init(head: Node<T>?) {
        self.head = head
    }
    
    public mutating func next() -> T? {
        if (head != nil) {
            let item = head!.data
            head = head!.next
            return item
        }
        return nil
    }
}


extension LinkedList: Sequence {
    public typealias Iterator = NodeIterator<T>
    
    public func makeIterator() -> NodeIterator<T> {
        return NodeIterator<T>(head: head)
    }
    
    public init<S: Sequence>(_ s: S) where S.Iterator.Element == T {
        for el in s {
            push(element: el)
        }
    }
}

var testLinkedList = [1,2,3,4]
// 값이 뭔가 이상한데..
var testList = LinkedList<Int>(testLinkedList)

testList.push(element: 55)
