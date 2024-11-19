/*
  소수 찾기(Finding Prime Numbers)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42839
  Difficulty: Lv.2
  Topic : 완전탐색
*/

import Foundation

func solution(_ numbers:String) -> Int {
    var cache: Set<Int> = []
    var numbersArray = numbers.map(String.init)
    var result = 0
    for l in 1...numbers.count {
        for p in permutations(data: Array(0...numbers.count-1), count: l)! {
            var temp = ""
            for i in p {
                temp += numbersArray[i]
            }
            let tempNum = Int(temp)!
            if cache.contains(tempNum) {
                continue
            }
            result += isPrime(n: tempNum) ? 1 : 0
            cache.insert(tempNum)
        }
    }
    
    return result
}

func isPrime(n: Int) -> Bool {
    let prime: Set<Int> = [2, 3, 5, 7, 11, 13, 17, 19, 23]
    if prime.contains(n) {
        return true
    }
    if n < 2 || n % 2 == 0 || n % 3 == 0 || n % 5 == 0 {
        return false
    }
    for i in 4...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func permutations<T>(data: [T], count: Int) -> [[T]]? {
    guard data.count >= count else { return nil }
    var result: [[T]] = []
    var buffer: [T] = []
    var visited = Array(repeating: false, count: data.count)
    
    func nextElement() {
        if buffer.count == count {
            result.append(buffer)
            return
        }
        for i in 0..<data.count {
            if !visited[i] {
                visited[i] = true
                buffer.append(data[i])
                nextElement()
                buffer.removeLast()
                visited[i] = false
            }
        }
    }
    nextElement()
    return result
}
