/*
  Parsing A Boolean Expression
  URL: https://leetcode.com/problems/parsing-a-boolean-expression
  Difficulty: Hard
  Topic : String, Stack, Recursion
*/

class Solution {
    func parseBoolExpr(_ expression: String) -> Bool {
        func operate(o: String, v: [Bool]) -> Bool {
            if o == "&" {
                return v.reduce(true) { $0 && $1 }
            } else if o == "|" {
                return v.reduce(false) { $0 || $1 }
            } else {
                return !v.first!
            }
        }
        var operStack: [String] = []
        var boolStack: [[Bool]] = []
        for e in expression {
            if "\(e)" == "&" || "\(e)" == "|" || "\(e)" == "!" {
                operStack.append("\(e)")
            } else if "\(e)" == "(" {
                boolStack.append([])
            } else if "\(e)" == ")" {
                let oper = operStack.popLast()!
                let value = boolStack.popLast()!
                let r = operate(o: oper, v: value)
                if var last = boolStack.popLast() {
                    last.append(r)
                    boolStack.append(last)
                } else {
                    boolStack.append([r])
                }
            } else if "\(e)" == "f" || "\(e)" == "t" {
                if var last = boolStack.popLast() {
                    last.append("\(e)" == "t" ? true : false)
                    boolStack.append(last)
                }
            }
        }
        return boolStack.last?.last ?? true
    }
}
