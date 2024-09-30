/*
  Design a Stack With Increment Operation
  URL: https://leetcode.com/problems/design-a-stack-with-increment-operation
  Difficulty: Medium
  Topic : Array, Stack, Design
*/

class CustomStack {
    var data: [Int] = []
    var maxSize: Int
    init(_ maxSize: Int) {
        self.maxSize = maxSize
    }
    
    func push(_ x: Int) {
        if data.count < maxSize { data.append(x) }
    }
    
    func pop() -> Int { data.popLast() ?? -1 }
    
    func increment(_ k: Int, _ val: Int) {
        (0..<min(k, data.count)).forEach { i in
            data[i] += val
        }
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * let obj = CustomStack(maxSize)
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * obj.increment(k, val)
 */
