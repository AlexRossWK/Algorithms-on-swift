import Foundation

//Brute-Force String Search
extension String {
    func index(of pattern: String) -> Index? {
        //indices - все индексы
        for i in indices {
            
            var j = i
            var found = true
            for p in pattern.indices {
                guard j != endIndex && self[j] == pattern[p] else { found = false; break }
                j = index(after: j)
            }
            if found {
                return i
            }
        }
        return nil
    }
}

let start = CFAbsoluteTimeGetCurrent()
let text = "Hello World"
text.index(of: "or")
print(CFAbsoluteTimeGetCurrent() - start)

//Boyer Moore String Search
//Need a skip table

extension String {
    func indexBM(of pattern: String) -> Index? {
        //indices - все индексы
        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= count else { return nil }
        
        let skipTable = pattern.skipTable
        let lastChar = pattern.last!
        
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        while i < endIndex {
            let c = self[i]
            
            if c == lastChar {
                if let k = match(from: i, with: pattern) { return k }
                i = index(after: i)
            } else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        
        return nil
    }
    
    fileprivate var skipTable: [Character: Int] {
        var skipTable: [Character: Int] = [:]
        for (i, c) in enumerated() {
            skipTable[c] = count - i - 1
        }
        return skipTable
    }
    
    //recursive for backwards string matching
    fileprivate func match(from currentIndex: Index, with pattern: String) -> Index? {
        if currentIndex < startIndex { return nil }
        if currentIndex >= endIndex { return nil }
        if self[currentIndex] != pattern.last { return nil }
        if pattern.count == 1 && self[currentIndex] == pattern.last { return currentIndex }
        return match(from: index(before: currentIndex), with: "\(pattern.dropLast())")
    }
}



//let helloText = "Hello"
//helloText.skipTable.forEach { print($0) }


let start1 = CFAbsoluteTimeGetCurrent()
let sourceString = "Hello World!"
let pattern = "or"
sourceString.index(of: pattern)
print(CFAbsoluteTimeGetCurrent() - start1)
