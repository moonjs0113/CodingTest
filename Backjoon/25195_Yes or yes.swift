/*
 Yes or yes
 https://www.acmicpc.net/problem/25195
*/

let nm = readLine()!.split(separator: " ").map { Int("\($0)")! }
var graph: [[Int]] = Array(repeating: [], count: nm[0] + 1)
(0..<nm[1]).forEach { _ in
    let line = readLine()!.split(separator: " ").map { Int("\($0)")! }
    graph[line[0]].append(line[1])
}
_ = readLine()

let gomgom = Set(readLine()!.split(separator: " ").map { Int("\($0)")! })
var cache: [Bool] = Array(repeating: false, count: nm[0]+1)
cache[1] = true

func bfs() -> String {
    var q: [Int] = [1]
    var p = 0
    if gomgom.contains(1) {
        return "Yes"
    }
    while p < q.count {
        let point = q[p]
        p += 1
        if graph[point].isEmpty{
            return "yes"
        }
        for n in graph[point] {
            if !cache[n] && !gomgom.contains(n) {
                cache[n] = true
                q.append(n)
            }
        }
    }
    return "Yes"
}

print(bfs())
