/*
  Maximum Number of K-Divisible Components
  URL: https://leetcode.com/problems/maximum-number-of-k-divisible-components
  Difficulty: Hard
  Topic : Tree, Depth-First Search
*/

class Solution {
    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        var result = 0
        var tree = Array(repeating: [Int](), count: n)
        for e in edges {
            tree[e[0]].append(e[1])
            tree[e[1]].append(e[0])
        }
        func dfs(p: Int, i: Int) -> Int {
            var v = values[i]
            for n in tree[i] {
                if n == p { continue }
                let child = dfs(p: i, i: n)
                if child % k == 0 {
                    result += 1
                } else {
                    v += child
                }
            }
            return v
        }
        _ = dfs(p: 0, i: 0)
        return result + 1
    }
}
