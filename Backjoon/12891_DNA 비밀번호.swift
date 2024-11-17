/*
 DNA 비밀번호
 https://www.acmicpc.net/problem/12891
*/

let ns = readLine()!.split(separator: " ").map { Int("\($0)")! }
let DNA = Array(readLine()!)
let acgt = readLine()!.split(separator: " ").map { Int("\($0)")! }
var count = [0, 0, 0, 0]
var index = ["A":0, "C":1, "G":2, "T":3]
var result = 0

for i in 0..<ns[0] {
    if i < ns[1] {
        count[index["\(DNA[i])"]!] += 1
    } else {
        count[index["\(DNA[i-ns[1]])"]!] -= 1
        count[index["\(DNA[i])"]!] += 1
    }
    if i >= ns[1] - 1 {
        var flag = true
        for j in 0..<acgt.count {
            if acgt[j] > count[j] {
                flag = false
                break
            }
        }
        if flag {
            result += 1
        }
    }
}
print(result)
