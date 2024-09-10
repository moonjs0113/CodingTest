import Foundation

/*
 백준 단계 별로 풀어보기
 17단계 조합론 https://www.acmicpc.net/step/61
 경우의 수를 세어 봅시다.
 */

/*
 베라의 패션
 https://www.acmicpc.net/problem/15439
 */
let num = Int(readLine()!)!
print(num * (num - 1))

/*
 녹색거탑
 https://www.acmicpc.net/problem/24723
 */
let num = Int(readLine()!)!
print(Int(pow(Float(2), Float(num))))

/*
 팩토리얼
 https://www.acmicpc.net/problem/10872
 */
let num = Int(readLine()!)!
print(num == 0 ? 1 : (1...num).reduce(1, *))

/*
 이항 계수 1
 https://www.acmicpc.net/problem/11050
 */
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = 1
(0..<nums[1]).forEach { _ in
    result *= nums[0]
    nums[0] -= 1
}
result /= (nums[1] == 0 ? 1 : (1...nums[1]).reduce(1, *))
print(result)

/*
 다리 놓기
 https://www.acmicpc.net/problem/1010
 */
(0..<Int(readLine()!)!).forEach { _ in
    var nums = readLine()!.split(separator: " ").map { Int($0)! }
    if nums[0] > (nums[1] / 2) { nums[0] = nums[1] - nums[0] }
    var result = 1
    (0..<nums[0]).forEach { i in
        result *= nums[1]
        result /= (i + 1)
        nums[1] -= 1
    }
    print(result)
}
