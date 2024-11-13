/*
 밤양갱
 https://www.acmicpc.net/problem/31926
*/

let n = Int(readLine()!)!
var count = 0
while (1 << count) < n {
    count += 1
}
print(10 + count - ((1 << count) == n ? 0 : 1))
