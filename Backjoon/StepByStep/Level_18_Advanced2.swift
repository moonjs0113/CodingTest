import Foundation

/*
 백준 단계 별로 풀어보기
 18단계 심화2 https://www.acmicpc.net/step/54
 경우의 수를 세어 봅시다.
 */

/*
 약수
 https://www.acmicpc.net/problem/1037
 */
readLine()
let nums = readLine()!.split(separator: " ").map { Int($0)! }
print(nums.min()! * nums.max()!)

/*
 인사성 밝은 곰곰이
 https://www.acmicpc.net/problem/25192
 */
var result = 0
var set: Set<String> = []
(0..<Int(readLine()!)!).forEach { _ in
    let chat = readLine()!
    if chat == "ENTER" {
        result += set.count
        set = []
    } else {
        set.insert(chat)
    }
}
print(result + set.count)

/*
 붙임성 좋은 총총이
 https://www.acmicpc.net/problem/26069
 */
var set: Set<String> = ["ChongChong"]
(0..<Int(readLine()!)!).forEach { _ in
    let p = readLine()!.split(separator: " ")
    if set.contains("\(p[0])") || set.contains("\(p[1])") {
        set.insert("\(p[0])")
        set.insert("\(p[1])")
    }
}
print(set.count)

/*
 통계학
 https://www.acmicpc.net/problem/2108
 */
let n = Int(readLine()!)!
var dic: [Int: Int] = [:]
let nums = (0..<n).map { _ -> Int in
    let num = Int(readLine()!)!
    dic[num] = (dic[num] == nil) ? 1 : dic[num]! + 1
    return num
}
print(Int(round(Double(nums.reduce(0, +)) / Double(nums.count))))
print(nums.sorted()[n/2])
if n == 1 {
    print(nums[0])
} else {
    let item = dic.max { $0.value < $1.value }
    dic = dic.filter { $0.value == item!.value }
    print(dic.count == 1 ? dic.first!.key : dic.sorted { $0.key < $1.key }[1].key)
}
print(nums.max()! - nums.min()!)

/*
 영단어 암기는 괴로워
 https://www.acmicpc.net/problem/20920
 */
let n = readLine()!.split(separator: " ").map{ Int($0)! }
var dic: [String: Int] = [:]
(0..<n[0]).forEach { _ in
    let word = readLine()!
    if word.count < n[1] { return }
    dic[word] = (dic[word] == nil) ? 1 : dic[word]! + 1
}
dic.sorted {
    if $0.value == $1.value {
        if $0.key.count == $1.key.count { return $0.key < $1.key }
        return $0.key.count > $1.key.count
    }
    return $0.value > $1.value
}.forEach {
    print($0.key)
}
