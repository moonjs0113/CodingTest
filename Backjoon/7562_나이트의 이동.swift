/*
 나이트의 이동
 https://www.acmicpc.net/problem/7562
*/

(0..<Int(readLine()!)!).forEach { _ in
    let i = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int("\($0)")! }
    let end = readLine()!.split(separator: " ").map { Int("\($0)")! }
    let movable: [(Int, Int)] = [
        (-2,-1), (-1,-2), (1,-2), (2,-1), (-2, 1), (-1, 2), (1, 2), (2, 1)
    ]
    var cache: [Int:Int] = [start[0] * i + start[1]:0]
    var q: [[Int]] = [[start[0], start[1]]]
    if start == end {
        print(0)
        return
    }
    var qp = 0
    while qp < q.count {
        let p = q[qp]
        let count = cache[p[0] * i + p[1]]!
        qp += 1
        for m in movable {
            let n = [m.0 + p[0], m.1 + p[1]]
            if 0 > n[0] || n[0] >= i || 0 > n[1] || n[1] >= i {
                continue
            }
            if n == end {
                print(count + 1)
                return
            }
            let key = n[0] * i + n[1]
            if cache[key] == nil {
                q.append(n)
                cache[key] = count + 1
            }
        }
    }
}
