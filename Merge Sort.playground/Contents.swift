import Foundation

//Divide and conquer
// O(n log n)

var array = [Int]()
for _ in stride(from: 0, to: 50, by: 1) {
    array.append(Int.random(in: 0...30))
}

func mergeSort(_ array: [Int]) -> [Int] {
    //Divide (recursively)
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)

}


//Split
private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    
    return orderedArray
}


let start2 = CFAbsoluteTimeGetCurrent()
mergeSort(array)
print(CFAbsoluteTimeGetCurrent() - start2)

let start1 = CFAbsoluteTimeGetCurrent()
array.sort()
print(CFAbsoluteTimeGetCurrent() - start1)
