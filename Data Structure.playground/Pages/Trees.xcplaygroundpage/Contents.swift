//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class TreeNode {
    let data: Int
    var children: [TreeNode]
    
    init(data: Int, children: [TreeNode] = [TreeNode]()) {
        self.data = data
        self.children = children
    }
    
    func add(data: Int) {
        self.children.append(TreeNode(data: data))
    }
    
    func remove(data: Int) {
        self.children.removeAll(where: {$0.data == data})
    }
}


let firstNode = TreeNode(data: 1)
firstNode.add(data: 2)
firstNode.add(data: 3)
firstNode.add(data: 5)
firstNode.remove(data: 3)

print("firstNode children:")
for node in firstNode.children {
    print(node.data)
}

class Tree {
    var root: TreeNode
    
    init(rootNode: TreeNode) {
        self.root = rootNode
    }
    
    func traverseBF(completion: (TreeNode) -> ()) {
        var traversingArray = [self.root]
        
        while !traversingArray.isEmpty {
            if let node = traversingArray.first {
                traversingArray.remove(at: 0)
                node.children.forEach(){ traversingArray.append($0) }
                completion(node)
            }
        }
    }
    
    func traverseDF(completion: (TreeNode) -> ()) {
        var traversingArray = [self.root]
        
        while !traversingArray.isEmpty {
            if let node = traversingArray.first {
                traversingArray.remove(at: 0)
                node.children.forEach() { traversingArray.insert($0, at: 0) }
                completion(node)
            }
        }
    }
}

let tree = Tree(rootNode: firstNode)
print("\nTraversing the Tree using Breadth first algorithm:")
tree.traverseBF() { node in
    print(node.data)
}

print("\nTraversing the Tree using Deapth first algorithm:")
tree.traverseDF() { node in
    print(node.data)
}
