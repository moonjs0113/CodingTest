import Foundation

/*
 백준 단계 별로 풀어보기
 12단계 브루트 포스 https://www.acmicpc.net/step/22
 가장 간단한 알고리즘인, 모든 경우의 수를 검사하는 브루트 포스 알고리즘을 배워 봅시다.
 */

/*
 블랙잭
 https://www.acmicpc.net/problem/2798
 */
let target = readLine()!.split(separator: " ").map { Int($0)! }[1]
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
for i in (0..<nums.count-2) {
    if nums[i] > target { continue }
    for j in i+1..<nums.count-1 {
        if (nums[i] + nums[j]) > target { continue }
        for k in j+1..<nums.count {
            let num = nums[i] + nums[j] + nums[k]
            if num > target { continue }
            result = max(result, num)
        }
    }
}
print(result)

/*
 분해합
 https://www.acmicpc.net/problem/2231
 */


/*
 수학은 비대면강의입니다
 https://www.acmicpc.net/problem/19532
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
Loop: for x in (-999...999) {
    for y in (-999...999) {
        if (nums[0] * x) + (nums[1] * y) == nums[2] && (nums[3] * x) + (nums[4] * y) == nums[5] {
            print(x, y)
            break Loop
        }
    }
}

/*
 체스판 다시 칠하기
 https://www.acmicpc.net/problem/19532
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var ground: [String] = []
(0..<nums[0]).forEach { _ in
    ground.append(readLine()!)
}
var result = 32
let string = ["WBWBWBWB", "BWBWBWBW"]
Loop: for i in 0...(ground.count - 8) {
    for j in 0...(nums[1] - 8) {
        for isWhite in (0...1) {
            var count = 0
            for row in (0..<8) {
                for col in (0..<8) {
                    if !(Array(ground[i + row])[j + col] == Array(string[(row + isWhite) % 2])[col]) {
                        count += 1
                    }
                }
            }
            result = min(result, count)
        }
        if result == 0 {
            break Loop
        }
    }
}
print(result)

/*
 영화감독 숌
 https://www.acmicpc.net/problem/1436
 */
let target = Int(readLine()!)!
var (prev, num, len) = (0, 1, 3)
while target > prev + num {
    prev += num
    num = prev * 9 + 9 * Int(pow(10.0, Float(len - 3)))
    len += 1
}

if len > 3 {
    let s = (Int(pow(10.0, Float(len - 4))))
    let e = s * 10 - 1
    for i in Int("\(s)666")!...Int("\(e)666")! {
        if String(i).contains("666") {
            prev += 1
            if prev == target {
                print(i)
                break
            }
        }
    }
} else {
    print("666")
}

/*
 설탕 배달
 https://www.acmicpc.net/problem/2839
 */
var target = Int(readLine()!)!
let check = [1,2,4,7]

// 1
if target > 7 {
    target += 3
    print((target / 5) + (((target % 5) + 1) % 2))
} else {
    print(([1,-1,1,2,-1])[target-3])
}

// 2
if check.contains(target) {
    print(-1)
} else {
    var count = 0
    count += target / 5
    target = target % 5
    if check.contains(target) {
        while target % 3 > 0 {
            count -= 1
            target += 5
        }
        count += target / 3
    }
    print(count)
}
