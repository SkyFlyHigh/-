//: Playground - noun: a place where people can play

import UIKit

public class TreeNode {
    public var value: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ value: Int) {
        self.value = value
    }
}

// 计算树的最大深度
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    let maxLeftDepth = maxDepth(root.left)
    let maxRightDepth = maxDepth(root.right)
    return max(maxLeftDepth, maxRightDepth) + 1
}

// 二叉查找树：左子树中节点的值都小于根节点的值，右子树中节点的值都大于根节点的值
// 如何判断是否是二叉查找树
func isValidBST(_ root: TreeNode?) -> Bool {
    return helper(root, nil, nil)
}

private func helper(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
    guard let node = node else {
        return true
    }
    // 所有右子节点都必须大于根节点
    if let min = min, node.value <= min {
        return false
    }
    // 所有左子节点都必须小于根节点
    if let max = max, node.value >= max {
        return false
    }
    
    return helper(node.left, min, node.value) && helper(node.right, node.value, max)
}

// 遍历：前序、中序、后序遍历。三种写法相似，无非是递归的顺序略有不同。面试的时候可能考察非递归的方法写这三种遍历：用栈实现。
func preorderTraversal(root: TreeNode?) -> [Int] {
    var res = [Int]()
    var stack = [TreeNode]()
    var node = root
    
    while !stack.isEmpty || node != nil {
        if node != nil {
            res.append(node!.value)
            stack.append(node!)
            node = node!.left
        } else {
            node = stack.removeLast().right
        }
    }
}

// 层级遍历(广度优先遍历)
/*
 如果构建一棵树，那么至少知道中序遍历和前序/后序遍历中的一种，也就是至少要知道两种遍历方式；但是层级遍历自己便可以唯一确定一棵树
 */
// 苹果面试题: Given a binary tree, please design an iOS app to demo it.
// 使用UITableView来显示层级信息
// 如何得到二叉树的层级遍历？其实层级遍历就是图的广度优先遍历，而广度优先遍历很自然就会用到队列，所以我们不妨用队列来帮助实现树的层级遍历：
func levelOrder(root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()
    // 用数组来实现队列
    var queue = [TreeNode]()
    
    if let root = root {
        queue.append(root)
    }
    
    while queue.count > 0 {
        var size = queue.count
        var level = [Int]()
        
        for _ in 0..<size {
            let node = queue.removeFirst()
            level.append(node.value)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        res.append(level)
    }
}

/*
 翻转二叉树
 */
// 非递归实现
func invertTreeNonRecursive(root: TreeNode?) {
    var nodes = [TreeNode]()
    if let root = root {
        nodes.append(root)
    }
    
    while !nodes.isEmpty {
        let node = nodes.removeFirst()
        
        let temp = node.left
        node.left = node.right
        node.right = temp
        
        if let left = node.left {
            nodes.append(left)
        }
        
        if let right = node.right {
            nodes.append(right)
        }
    }
}

// 递归实现
func invertBinaryTreeWithRecursive(root: TreeNode?) {
    guard let root = root else {
        return
    }
    let temp = root.left
    root.left = root.right
    root.right = temp
    
    if let left = root.left {
        invertBinaryTreeWithRecursive(root: left)
    }
    if let right = root.right {
        invertBinaryTreeWithRecursive(root: right)
    }
}
