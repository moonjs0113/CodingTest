/*
  Circular Sentence
  URL: https://leetcode.com/problems/circular-sentence
  Difficulty: Easy
  Topic : String
*/

class Solution {
    func isCircularSentence(_ sentence: String) -> Bool {
        var words = sentence.components(separatedBy: " ")
        var stack = [words[0].first!, words[0].last!]
        for i in 1..<words.count {
            if stack.last! != words[i].first!{
                return false
            }
            stack.popLast()
            stack.append(words[i].last!)
        }
        return stack.first! == stack.last!
    }
}
