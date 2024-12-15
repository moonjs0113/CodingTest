/*
  Minimum Bit Flips to Convert Number
  URL: https://leetcode.com/problems/minimum-bit-flips-to-convert-number
  Difficulty: Easy
  Topic: Bit Manipulation
*/

class Solution {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        (start ^ goal).nonzeroBitCount
    }
}
