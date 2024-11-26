/*
 상자넣기
 https://www.acmicpc.net/problem/1965
*/
_ = readLine()
let nums = readLine()!.split(separator: " ").map{ Int("\($0)")! }
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
print(lis.count)
