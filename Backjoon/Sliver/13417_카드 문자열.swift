/*
 카드 문자열
 https://www.acmicpc.net/problem/13417
*/

import Foundation

(0..<Int(readLine()!)!).forEach { _ in
    let n = Int(readLine()!)!
    var input = readLine()!.components(separatedBy: " ")
    var result = input.first!
    for i in 1..<n {
        result = input[i] <= "\(result.first!)" ? input[i] + result : result + input[i]
    }
    print(result)
}

