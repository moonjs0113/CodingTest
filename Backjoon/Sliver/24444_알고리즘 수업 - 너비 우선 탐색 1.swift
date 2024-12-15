/*
 알고리즘 수업 - 너비 우선 탐색 1
 https://www.acmicpc.net/problem/24444
*/ 

let nmr = readLine()!.split(separator: " ").map{ Int("\($0)")! }
var graph: [[Int]] = Array(repeating: [], count: nmr[0]+1)
for io in 0..<nmr[1] {
    let line = readLine()!.split(separator: " ").map{ Int("\($0)")! }
    graph[line[0]].append(line[1])
    graph[line[1]].append(line[0])
}
var q: [Int] = []
var qp: Int = 0
var visited: [Int] = Array(repeating: 0, count: nmr[0]+1)
var index = 2
func bfs(_ start: Int) {
    q.append(start)
    visited[start] = 1
    while qp < q.count {
        let point = q[qp]
        qp += 1
        for i in graph[point].sorted() {
            if visited[i] == 0 {
                visited[i] = index
                index += 1
                q.append(i)
            }
        }
    }
}
bfs(nmr[2])
(1..<visited.count).forEach {
    print(visited[$0])
}
