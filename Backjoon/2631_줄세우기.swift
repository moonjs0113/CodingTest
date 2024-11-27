/*
 줄세우기
 https://www.acmicpc.net/problem/2631
*/

let n = Int(readLine()!)!
let nums = (0..<n).map { _ in Int(readLine()!)! }
var lis: [Int] = []
for num in nums {
    if lis.isEmpty || lis.last! < num {
        lis.append(num)
    } else {
        var left = 0, right = lis.count - 1
        while left < right {
            let mid = (left + right) / 2
            if lis[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
        }
        lis[left] = num
    }
}
print(n - lis.count)
