/*
  N으로 표현
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42895
  Difficulty: Lv.3
  Topic : 동적계획법(Dynamic Programming)
*/

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number { return 1 }
    var dp = Array(repeating: Set<Int>(), count: 8)
    dp[0].insert(N)
    var cache: Set<Int> = [N]
    for i in (1..<8) {
        var tempSet: Set<Int> = [Int(String(repeating: "\(N)", count: i+1))!]
        for j in 0..<i {
            for n0 in dp[j] {
                for n1 in dp[i-1-j] {
                    tempSet.insert(n0 + n1)
                    tempSet.insert(n0 - n1)
                    tempSet.insert(n1 - n0)
                    tempSet.insert(n0 * n1)
                    if n1 != 0 { tempSet.insert(n0 / n1) }
                    if n0 != 0 { tempSet.insert(n1 / n0) }
                }
            }
        }
        dp[i] = tempSet
        cache.formUnion(tempSet)
        if cache.contains(number) {
            return i + 1
        }
    }
    return -1
}
