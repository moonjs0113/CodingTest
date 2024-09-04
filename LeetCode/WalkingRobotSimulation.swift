/*
  Walking Robot Simulation
  URL: https://leetcode.com/problems/walking-robot-simulation/
  Difficulty: Medium
  Topic : Array, Hash Table, Simulation
*/

import Foundation

class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var direction = (1, 1) // (x(0) or y(1), +1 or -1)
        var coordinate = [0, 0]
        var result = 0
        commands.forEach { command in
            if command < 0 {
                direction = (
                    (direction.0 + 1) % 2,
                    direction.1 * Int(pow(Float(-1), Float((direction.0 + command) % 2)))
                )
            } else {
                let obstaclesFilter = obstacles.filter { obstacle in
                    let isX = (direction.0 == 0)
                    if coordinate[isX ? 1 : 0] != obstacle[isX ? 1 : 0] { return false }
                    let p = coordinate[direction.0]
                    let set = (direction.1 == 1)
                    ? Set((p+1)...(p + (direction.1 * command)))
                    : Set((p + (direction.1 * command))...(p-1))
                    return set.contains(obstacle[direction.0])
                }
                if obstaclesFilter.count == 0 {
                    coordinate[direction.0] += (direction.1 * command)
                } else {
                    let l = obstaclesFilter.map{ $0[direction.0] }.sorted()
                    coordinate[direction.0] = (direction.1 == 1 ? l.first! - 1 : l.last! + 1)
                }
                result = max(result, (coordinate[0] * coordinate[0]) + (coordinate[1] * coordinate[1]))
            }
        }
        return result
    }
}
