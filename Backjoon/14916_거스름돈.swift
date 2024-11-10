/*
 거스름돈
 https://www.acmicpc.net/problem/14916
*/

let n = Int(readLine()!)!
var result = -1
if !(n == 1 || n == 3) {
    result = ((n % 5) % 2 == 0) ? (n / 5) + ((n % 5) / 2) : (n / 5) - 1 + ((n % 5) + 5) / 2
}
print(result)
