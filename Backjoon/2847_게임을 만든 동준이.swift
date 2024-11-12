/*
 게임을 만든 동준이
 https://www.acmicpc.net/problem/2847
*/

var result = 0
let n = Int(readLine()!)!
let nums = Array((0..<n).map { _ in Int(readLine()!)! }.reversed())
var prev = nums[0]
for i in 1..<n {
    if nums[i] >= prev {
        result += nums[i] - prev + 1
        prev = prev - 1
    } else {
        prev = nums[i]
    }
}
print(result)
