/*
  Different Ways to Add Parentheses
  URL: https://leetcode.com/problems/different-ways-to-add-parentheses
  Difficulty: Medium
  Topic : Math, String, Dynamic Programming, Recursion, Memoization
*/

class Solution {
    let operators: Set<String> = ["+", "-", "*"]
    func diffWaysToCompute(_ expression: String) -> [Int] {
        if let num = Int(expression) {
            return [num]
        }
        let expressionArray = Array(expression).map(String.init)
        var result: [Int] = []
        for item in expressionArray.enumerated() {
            if operators.contains(item.element) {
                let lhs = diffWaysToCompute(expressionArray[0..<item.offset].joined())
                let rhs = diffWaysToCompute(expressionArray[(item.offset+1)..<expressionArray.count].joined())
                result += lhs.flatMap { l in
                    rhs.map{ r in
                        switch item.element {
                        case "+": return l + r
                        case "-": return l - r
                        default: return l * r
                        }
                    }
                }
            }
        }
        return result
    }
}
