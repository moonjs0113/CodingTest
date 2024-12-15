/*
 고양이는 많을수록 좋다
 https://www.acmicpc.net/problem/27961
*/

let n = Int(readLine()!)!
var cat = 1
var magicCount = 1
while cat < n {
    cat *= 2
    magicCount += 1
}
print(n == 0 ? 0 : magicCount)
