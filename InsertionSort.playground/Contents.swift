import Foundation

//Insertion Sort - берем элементы из массива, вставляем в новый массив в нужное местоп
//O(n^2) в худшем случае
var array = [Int]()
for _ in stride(from: 0, to: 200, by: 1) {
    array.append(Int.random(in: 0...9))
}

//В данном случае новый массив не создаем, сортируем висходном
func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

let startTime = CFAbsoluteTimeGetCurrent()
insertionSort(array)
print("\(CFAbsoluteTimeGetCurrent() - startTime)")
//Более быстрый (при большом размере массива) алгоритм без swap-a на каждом шагу
func insertionSort2(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && temp < a[y - 1] {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

let startTime2 = CFAbsoluteTimeGetCurrent()
insertionSort2(array)
print("\(CFAbsoluteTimeGetCurrent() - startTime2)")


//O(n log n)
let startTime3 = CFAbsoluteTimeGetCurrent()
array.sort()
print("\(CFAbsoluteTimeGetCurrent() - startTime3)")
