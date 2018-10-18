import Foundation
//Big-O notation gives you a rough indication of the running time of an algorithm and the amount of memory it uses


//O(1) Accessing an array index.
let array = [1,2,3,4,5,6,7,8,9,10,11]
let value = array[4]
print("-----------------")

//O(log n) Instead of simply incrementing, 'j' is increased by 2 times itself in each run.
var j = 1
var n = 10
while j < n {
    print(j)
    j *= 2
}
print("-----------------")

//O(n) Linear Search
for i in stride(from: 0, to: n, by: 1) {
    print(i)
}
print("-----------------")

for i in stride(from: 0, through: 10, by: 1) {
    print(i)
}
print("-----------------")

//O(n log n)

for i in stride(from: 0, to: n, by: 1) {
    var j = 1
    while j < n {
        j *= 2
        print(i)
    }
}
print("-----------------")

//O(n^2)
for i  in stride(from: 0, to: n, by: 1) {
    for j in stride(from: 1, to: n, by: 1) {
        print (i,j)
    }
}
print("-----------------")

//O(n^3)
for i in stride(from: 0, to: n, by: 1) {
    for j in stride(from: 1, to: n, by: 1) {
        for k in stride(from: 1, to: n, by: 1) {
        
        }
    }
}

//O(2^n)exponential Towers of Hanoi
//reqursion
func solveHanoi(n: Int, from: String, to: String, spare: String) {
    guard n >= 1 else { return }
    if n > 1 {
        solveHanoi(n: n - 1, from: from, to: spare, spare: to)
    } else {
        solveHanoi(n: n - 1, from: spare, to: to, spare: from)
    }
}

//O(n!)
func nFactFunc(n: Int) {
    for i in stride(from: 0, to: n, by: 1) {
        nFactFunc(n: n - 1)
        print (i)
        
    }
}


//Its the way to measure time of completion
let start = CFAbsoluteTimeGetCurrent()

nFactFunc(n: 5)

let diff = CFAbsoluteTimeGetCurrent() - start
print("Took \(diff) seconds")
