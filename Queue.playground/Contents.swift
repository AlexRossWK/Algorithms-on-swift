import Foundation
//Queue - FIFO
//Используя queue можем вставлять новый элемент в конец и удалить элемент сначала
public struct Queue<T> {
     var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    //O(1)
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    //O(n) тк все остальные двигаем влево
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var front: T? {
        return array.first
    }
}

var queue = Queue<String>()
queue.enqueue("1")
queue.enqueue("2")
queue.enqueue("3")
print(queue.array)
