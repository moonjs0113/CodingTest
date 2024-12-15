/*
  Convert 1D Array Into 2D Array
  URL: https://leetcode.com/problems/convert-1d-array-into-2d-array
  Difficulty: Easy
  Topic : Array, Matrix, Simulation
*/

class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        (original.count != m * n) ? [] : (0..<m).map { i in Array(original[i*n..<(i+1)*n]) }
    }
}
