/*
  소수 찾기(Finding Prime Numbers)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42839
  Difficulty: Lv.2
  Topic : Exhaustive Search
*/

import Foundation

func solution(_ numbers:String) -> Int {
    
    var isPrime: (Int) -> Bool = { n in
        let prime: Set<Int> = [2, 3, 5, 7, 11, 13, 17, 19, 23]
        if prime.contains(n) { return true }
        if n < 2 || n % 2 == 0 || n % 3 == 0 || n % 5 == 0 { return false }
        for i in 4...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
        return true
    }

    var cache: [Int: Bool] = [:]
    var numbersArray = numbers.map(String.init)
    var result = 0
    
    func backtracking(num: String, set: Set<Int>) {
        if !num.isEmpty {
            if cache[Int(num)!] == nil {
                cache[Int(num)!] = isPrime(Int(num)!)
                if cache[Int(num)!]! { result += 1 }
            }
        }
        if num.count == numbers.count {  return }
        for i in 0..<numbers.count {
            var next = num
            if !set.contains(i) {
                next += numbersArray[i]
                backtracking(num: next, set: set.union([i]))
            }
        }
    }
    
    backtracking(num: "", set: [])
    
    return result
}
