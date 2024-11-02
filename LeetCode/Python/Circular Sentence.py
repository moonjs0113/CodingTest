"""
  Circular Sentence
  URL: https://leetcode.com/problems/circular-sentence
  Difficulty: Easy
  Topic : String
"""

class Solution:
    def isCircularSentence(self, sentence: str) -> bool:
        words = sentence.split()
        stack = [words[0][0],words[0][-1]]
        for i in range(len(words)-1):
            if stack[-1] != words[i+1][0]:
                return False
            stack.pop()
            stack.append(words[i+1][-1])
        return stack[0] == stack[-1]
