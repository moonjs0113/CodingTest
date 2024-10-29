/*
 징검다리
 https://www.acmicpc.net/problem/11561
*/

import Foundation
(0..<Int(readLine()!)!).forEach { _ in
    let n = Int(readLine()!)!
    var nx = Int(sqrt(Double(n*2)))
    var c = n*2 / (nx+1)
    while !(nx <= c && c <= (nx + 2)) {
        nx -= 1
        c = n*2 / (nx+1)
    }
    print(nx)
}
