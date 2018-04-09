//: Playground - noun: a place where people can play

import UIKit

public struct Queue<T> {
    fileprivate var queueArray = [T]()
    
    public var count: Int {
        return queueArray.count
    }
    
    public var isEmpty: Bool {
        return queueArray.isEmpty
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return queueArray.first
        }
    }
    
    public mutating func enqueue(_ element: T) {
        queueArray.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queueArray.removeFirst()
        }
    }
}
