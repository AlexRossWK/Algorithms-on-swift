import Foundation

//LinkedList - каждый элемент имеет связь со следующим объектом

//MARK:- single(односторонний)
struct LinkedList<T> {
    var head: LinkedListNode<T> // <- начало связноого списка
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

//Элемент связного списка
//inderect - внутри можем использовать сам класс
indirect enum LinkedListNode<T> {
    case value(element: T, nextElement: LinkedListNode<T>)
    case end
}

let elem4 = LinkedListNode.value(element: "1", nextElement: .end)
let elem3 = LinkedListNode.value(element: "1", nextElement: elem4)
let elem2 = LinkedListNode.value(element: "1", nextElement: elem3)
let elem1 = LinkedListNode.value(element: "1", nextElement: elem2)


let linkedList = LinkedList(head: elem1)


//MARK:- double(двусторонний)
public class LinkedListD<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}


//Сравнение Связного списка и Массива
let dLinkeList = LinkedListD<Int>()

dLinkeList.first
dLinkeList.isEmpty

for i in stride(from: 0, to: 1000, by: 1) {
    dLinkeList.append(value: i)
}
