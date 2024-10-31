/*
 알고리즘 수업 - 깊이 우선 탐색 1
 https://www.acmicpc.net/problem/24479
*/

let nmr = readLine()!.split(separator: " ").map{ Int("\($0)")! }
var graph: [[Int]] = Array(repeating: [], count: nmr[0]+1)
for _ in 0..<nmr[1] {
    let line = readLine()!.split(separator: " ").map{ Int("\($0)")! }
    graph[line[0]].append(line[1])
    graph[line[1]].append(line[0])
}
var visited: [Int] = Array(repeating: 0, count: nmr[0]+1)
var index = 1
func dfs(e: [Int], r: Int) {
    visited[r] = index
    index += 1
    for x in e.sorted() {
        if visited[x] == 0 {
            dfs(e: graph[x], r: x)
        }
    }
}
dfs(e: graph[nmr[2]], r: nmr[2])
(1..<visited.count).forEach {
    print(visited[$0])
}
