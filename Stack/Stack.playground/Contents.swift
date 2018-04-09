//: Playground - noun: a place where people can play

import UIKit

// 数组作为栈的线性表，同时支持泛型
public struct Stack<T> {
    //Array
    fileprivate var stackArray = [T]()
    
    //count
    public var count: Int {
        return stackArray.count
    }
    
    //is empty
    public var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stackArray.append(element)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            print("stack is empty")
            return nil
        } else {
            return stackArray.removeLast()
        }
    }
    
    public mutating func printAllElements() {
        guard count > 0 else {
            print("stack is empty")
            return
        }
        
        for (index, value) in stackArray.enumerated() {
            print("[\(index)]\(value)]")
        }
        
    }
}
