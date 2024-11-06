/*
 특정 거리의 도시 찾기
 https://www.acmicpc.net/problem/18352
*/

let nmkx = readLine()!.split(separator: " ").map { Int("\($0)")! }
var graph: [Int:[Int]] = [:]
for _ in 0..<nmkx[1] {
    let road = readLine()!.split(separator: " ").map { Int("\($0)")! }
    if let _ = graph[road[0]] {
        graph[road[0]]!.append(road[1])
    } else {
        graph[road[0]] = [road[1]]
    }
}
var cache: [Bool] = Array(repeating: false, count: nmkx[0] + 1)
var q: [Int] = [nmkx[3]]
var count = 0
while !q.isEmpty {
    var temp: [Int] = []
    count += 1
    if count > nmkx[2] { break }
    for num in q where !cache[num] {
        cache[num] = true
        temp.append(contentsOf: graph[num] ?? [])
    }
    if count == nmkx[2] {
        let tempSet = Array(Set(temp).filter { !cache[$0] })
        print(tempSet.count == 0 ? -1 : tempSet.sorted(by: <).map(String.init).joined(separator: "\n"))
        break
    }
    q = temp
}
if count != nmkx[2] {
    print(-1)
}
