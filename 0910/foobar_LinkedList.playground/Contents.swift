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
}


public class Node<T> {
    init(data: T) {
        
    }
}
