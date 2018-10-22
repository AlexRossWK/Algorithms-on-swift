//O(log n) complexity
//A binary tree is a tree where each node has 0, 1, or 2 children (root, node, leaf)

//Перечисления могут иметь рекурсивную структуру, то есть они могут иметь кейсы со связными значениями, которые являются экземплярами самого типа перечисления. Тем не менее, экземпляры типов перечисления имеют семантику значений, что означает, что они имеют фиксированное место в памяти. Для поддержки рекурсии, компилятор должен ввести индиректный слой.
enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    //Insertion
    //If the current node is empty, you insert the new node here.
    //If the new value is smaller, you go down the left branch.
    //If the new value is greater, you go down the right branch.

    //O(n) тк проходим все узлы дерева, создаем копию изаменяем предыдущеее
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    //Алгоритмы трассировки (O(n), т - кол-во узлов)
    //1
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    //2
    func traversePreOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    //3
    func traversePostOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    
    //Searching(O(log n))
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
}


// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let node6 = BinaryTree.node(.empty, "6", .empty)
let node7 = BinaryTree.node(.empty, "7", .empty)

//Binary Search Trees
//ключевая особенность: справа значения больше корня, слева меньше
//Insertions
var binaryTree: BinaryTree<Int> = .empty
binaryTree.insert(newValue: 3)


//Алгоритмы трассировки(обхода)
//1-в порядке возрастания значения
var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 9)

tree.traverseInOrder { print($0) }

//2- сначала проход через все узлы текущего узла
tree.traversePreOrder{ print($0) }

//3- посещение узлов только после прохода левых и правых детей
tree.traversePostOrder{ print($0) }


//Searching
tree.search(searchValue: 5)
