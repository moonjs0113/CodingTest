/*
 센서
 https://www.acmicpc.net/problem/2212
*/

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var sensor = readLine()!.split(separator: " ").map { Int("\($0)")! }
if n <= k {
    print(0)
} else {
    sensor.sort()
    var gap: [Int] = []
    for i in 1..<sensor.count {
        gap.append(sensor[i] - sensor[i-1])
    }
    gap.sort()
    gap.removeLast(k-1)
    print(gap.reduce(0,+))
}
