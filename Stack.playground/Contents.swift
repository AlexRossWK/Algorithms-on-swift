import Foundation
//Stack - LIFO or last-in first-out order.
//Стэк - массив с ограниченной функциональностю
//Стэк позволяет исключительно push, pop и peek (положить наверх, взять сверху и посмотреть, что наверху)

struct Stack<T> {
     var array: [T] = []
    
    //O(1) - кладем в конец массива
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    //O(1)
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}

//Additional
extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        let stackElements = array.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.peek()
stack.pop()
stack.pop()
stack.push(5)
stack.push(6)
print(stack)
