/*
 강의실
 https://www.acmicpc.net/problem/1374
*/

let n = Int(readLine()!)!
var lectures: [[Int]] = []
var rooms: [Int] = []
for i in 0..<n {
    lectures.append(readLine()!.split(separator: " ").map { Int("\($0)")! })
}
lectures.sort { $0[1] < $1[1] }
for l in lectures {
    var isBreak = false
    for i in 0..<rooms.count {
        if rooms[i] <= l[1] {
            rooms[i] = l[2]
            isBreak = true
            break
        }
    }
    if !isBreak {
        rooms.append(l[2])
    }
}
print(rooms.count)
