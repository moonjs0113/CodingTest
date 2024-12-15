/*
  Container With Most Water
  URL: https://leetcode.com/problems/container-with-most-water/
  Difficulty: Medium
  Topic : Array, Two Pointers, Greedy
*/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        
        var area = 0, left = 0, right = height.count - 1
        while left < right {
            let tmpArea = (right - left) * (min(height[left], height[right]))
            if tmpArea > area {
                area = tmpArea
            }

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return area
    }
}
