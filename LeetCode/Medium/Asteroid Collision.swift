/*
  Asteroid Collision
  URL: https://leetcode.com/problems/asteroid-collision
  Difficulty: Medium
  Topic : Array, Stack, Simulation
*/

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var result: [Int] = []
        for i in 0..<asteroids.count {
            if asteroids[i] > 0 {
                result.append(asteroids[i])
                continue
            }
            if result.isEmpty {
                result.append(asteroids[i])
                continue
            }
            let len = result.count
            for j in 0..<len {
                if result[len-1-j] < 0 {
                    result.append(asteroids[i])
                    break
                }
                if result[len-1-j] < abs(asteroids[i]) {
                    _ = result.popLast()
                    if result.isEmpty {
                        result.append(asteroids[i])
                    }
                } else if result[len-1-j] > abs(asteroids[i]) {
                    break
                } else {
                    _ = result.popLast()
                    break
                }
            }
        }
        return result
    }
}
