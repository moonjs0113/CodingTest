/*
  Decode String
  URL: https://leetcode.com/problems/decode-string
  Difficulty: Medium
  Topic : String, Stack, Recursion
*/

class Solution {
    func decodeString(_ s: String) -> String {
        var result = ""
        var iStack: [Int] = []
        var buffer: [String] = []
        var intBuffer = 0
        for c in Array(s) {
            var str = "\(c)"
            if let int = Int(str) {
                intBuffer *= 10
                intBuffer += int
                continue
            }
            if str == "]" {
                str = String(repeating: buffer.popLast() ?? "", count: iStack.popLast() ?? 0)
            }
            if str == "[" {
                iStack.append(intBuffer)
                buffer.append("")
                intBuffer = 0
            } else {
                if buffer.isEmpty {
                    result += str
                } else {
                    buffer[buffer.count-1] += str
                }
            }
        }
        return result
    }
}
