//: [Previous](@previous)

import Foundation

//: [Next](@next)

import UIKit

var str = "Stacks & Linked Lists"


class Stack {
    
    var ll: LinkedList
    
    init(top: Node?) {
        self.ll = LinkedList(head: top)
    }
    
    // add a node to the top of the stack
    func push(_ node: Node) {
        ll.insertNode(node, at: 1)
    }
    
    // remove and return the topmost node from the stack
    func pop() -> Node? {
        if let item = ll.getNode(atPosition: 1) {
            ll.deleteNode(withValue: item.value)
            return item
        }
        return nil
    }
}

class Node {
    
    var value: Int
    var next: Node?
    
    init(value: Int, nextNode: Node? = nil) {
        self.value = value
        self.next = nextNode
    }
}

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else {
            return nil
        }
        
        var counter = 1
        var current = head
        
        while current != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        return nil
    }
    
    func insertNode(_ node: Node, at position: Int) {
        guard position > 0 else {
            return
        }
        
        var counter = 1
        var current = head
        
        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    func deleteNode(withValue value: Int) {
        var current = head
        var previous: Node?
        
        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }
        
        if current?.value == value {
            if previous != nil {
                previous?.next = current?.next
            } else {
                head = current?.next
            }
        }
    }
    
    func getMidPoint() -> Node? {
        var slow = self.getNode(atPosition: 0)
        var fast = slow
        
        while (fast?.next?.next != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
    func isCircular() -> Bool {
        var isCircular = false
        var slow = self.getNode(atPosition: 0)
        var fast = slow
        
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast === slow {
                isCircular = true
            }
        }
        
        return isCircular
    }
    
    func findNodeFromLast(at position: Int) -> Node? {
        var slow = self.getNode(atPosition: 0)
        var fast = slow
        var counter = position
        
        while counter > 0 {
            fast = fast?.next
            counter -= 1
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}

// Test cases
// Set up some nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a Stack
let stack = Stack(top: n1)

// Test stack functionality

stack.push(n2)
stack.push(n3)
print(stack.pop()!.value) // Should be 3
print(stack.pop()!.value) // Should be 2
print(stack.pop()!.value) // Should be 1
print(stack.pop()?.value) // Should be nil
stack.push(n4)
print(stack.pop()!.value) // Should be 4


