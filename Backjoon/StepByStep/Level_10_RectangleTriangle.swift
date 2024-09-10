import Foundation

/*
 백준 단계 별로 풀어보기
 10단계 기하: 직사각형과 삼각형 https://www.acmicpc.net/step/50
 간단한 도형으로 기하 문제풀이를 시작해 봅시다.
 */

/*
 직사각형
 https://www.acmicpc.net/problem/27323
 */
print(Int(readLine()!)! * Int(readLine()!)!)

/*
 직사각형에서 탈출
 https://www.acmicpc.net/problem/1085
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let minH = (nums[2] / 2) < nums[0] ? (nums[2] - nums[0]) : nums[0]
let minV = (nums[3] / 2) < nums[1] ? (nums[3] - nums[1]) : nums[1]
print(min(minH, minV))

/*
 네 번째 점
 https://www.acmicpc.net/problem/3009
 */
let position = (0..<3).map{ _ in readLine()!.split(separator: " ").map { Int($0)! } }
print((0...1).map { i in
    let array = position.map { $0[i] }
    if array[0] == array[1] {
        return "\(array[2])"
    } else {
        return "\(array[0] == array[2] ? array[1] : array[0])"
    }
}.joined(separator: " "))

/*
 수학은 체육과목 입니다
 https://www.acmicpc.net/problem/15894
 */
print(Int(readLine()!)! * 4)

/*
 대지
 https://www.acmicpc.net/problem/9063
 */
var leftBottom = (0, 0)
var rightTop = (0, 0)
(0..<Int(readLine()!)!).forEach {
    let position = readLine()!.split(separator: " ").map { Int($0)! }
    if $0 == 0 {
        leftBottom = (position[0],position[1])
        rightTop = (position[0],position[1])
    }
    rightTop.0 = max(rightTop.0,position[0])
    rightTop.1 = max(rightTop.1,position[1])
    leftBottom.0 = min(leftBottom.0,position[0])
    leftBottom.1 = min(leftBottom.1,position[1])
}
print((rightTop.0 - leftBottom.0) * (rightTop.1 - leftBottom.1))

/*
 삼각형 외우기
 https://www.acmicpc.net/problem/10101
 */
let angles = (0..<3).map{ _ in Int(readLine()!)! }
if angles.reduce(0,+) == 180 {
    if (angles[0] == 60) && (angles[1] == 60) {
        print("Equilateral")
    } else if (angles[0] != angles[1]) && (angles[1] != angles[2]) && (angles[0] != angles[2]) {
        print("Scalene")
    } else {
        print("Isosceles")
    }
} else {
    print("Error")
}

/*
 삼각형과 세 변
 https://www.acmicpc.net/problem/5073
 */
while true {
    let triangle = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    guard triangle.reduce(0, +) != 0 else {
        break
    }
    if triangle[2] >= triangle[0] + triangle[1] {
        print("Invalid")
    } else if triangle[0] == triangle[1] && triangle[0] == triangle[2] {
        print("Equilateral")
    } else if triangle[0] == triangle[1] || triangle[0] == triangle[2] || triangle[1] == triangle[2] {
        print("Isosceles")
    } else {
        print("Scalene")
    }
}

/*
 세 막대
 https://www.acmicpc.net/problem/14215
 */
var triangle = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
while triangle[2] >= triangle[0] + triangle[1] {
    triangle[2] -= 1
}
print(triangle.reduce(0,+))
