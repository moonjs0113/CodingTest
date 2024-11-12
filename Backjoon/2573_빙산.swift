/*
 빙산
 https://www.acmicpc.net/problem/2573
*/

let nm = readLine()!.split(separator: " ").map { Int("\($0)")! }
let around = [[-1,0],[1,0],[0,-1],[0,1]] // 상하좌우
var iceberg: [[Int]] = []
var totalIce = 0
var start: [[Int]] = []
var result = 0

for i in 0..<nm[0] {
    let line = readLine()!.split(separator: " ").map { Int("\($0)")! }
    for j in 0..<nm[1] {
        if line[j] > 0 {
            totalIce += 1
            if start.isEmpty {
                start.append([i,j])
            }
        }
    }
    iceberg.append(line)
}

while totalIce > 0 {
    let prevIceberg = iceberg
    var queue: [[Int]] = [start[0]]
    var visited = Array(repeating: false, count: nm[0] * nm[1])
    var iceCount = 0
    var newTotalIce = 0
    
    visited[queue[0][0]*nm[1] + queue[0][1]] = true
    start = []
    
    while !queue.isEmpty {
        var tempQueue: [[Int]] = []
        for q in queue {
            iceCount += 1
            var water = 0
            for a in around {
                let i = q[0]+a[0], j = q[1]+a[1]
                let aIce = prevIceberg[i][j]
                if aIce <= 0 {
                    water += 1
                } else {
                    if !visited[i * nm[1] + j] {
                        tempQueue.append([i, j])
                        visited[i * nm[1] + j] = true
                    }
                }
            }
            iceberg[q[0]][q[1]] = prevIceberg[q[0]][q[1]] - water
            if iceberg[q[0]][q[1]] > 0 {
                newTotalIce += 1
                if start.isEmpty {
                    start.append([q[0],q[1]])
                }
            }
        }
        queue = tempQueue
    }
    if iceCount != totalIce {
        break
    }
    totalIce = newTotalIce
    result += 1
}

print(totalIce == 0 ? 0 : result)
