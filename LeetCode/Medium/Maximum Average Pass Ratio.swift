/*
  Maximum Average Pass Ratio
  URL: https://leetcode.com/problems/maximum-average-pass-ratio
  Difficulty: Medium
  Topic : Array, Greedy, Heap (Priority Queue)
*/

import Collections

struct Class: Comparable {
    var pass: Int
    var total: Int
    
    var gain: Double {
        let (pass, total) = (Double(pass), Double(total))
        return (pass + 1) / (total + 1) - pass / total
    }
    
    static func < (lhs: Class, rhs: Class) -> Bool {
        lhs.gain < rhs.gain
    }
}

extension Int {
    var d: Double {
        Double(self)
    }
}

class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        var c = Heap(classes.map { Class(pass: $0[0], total: $0[1])} )

        for _ in 0..<extraStudents {
            if var m = c.popMax() {
                m.pass += 1
                m.total += 1
                c.insert(m)
            }
        }

        return c.unordered.reduce(into: 0.0) { $0 += $1.pass.d / $1.total.d } / classes.count.d
    }
}
