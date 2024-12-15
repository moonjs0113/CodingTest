/*
 토마토
 https://www.acmicpc.net/problem/7569
*/

let mnh = readLine()!.split(separator: " ").map { Int("\($0)")! }
var box: [[[Int]]] = []
var matrix: [[Int]] = Array(
    repeating: Array(repeating: -1, count: mnh[0] * mnh[1]),
    count: mnh[2]
)

var queue: [Int] = []
for h in (0..<mnh[2]) {
    box.append([])
    for n in (0..<mnh[1]) {
        let input = readLine()!.split(separator: " ")
        box[h].append([])
        for m in (0..<mnh[0]) {
            let i = Int("\(input[m])")!
            box[h][n].append(i)
            if i == 1 {
                queue.append(h*mnh[0]*mnh[1] + n * mnh[0] + m)
            }
        }
    }
}

func bfs() -> Int {
    var count = 0
    let mn = mnh[0]*mnh[1]
    let adjacent = [
        [1,0,0], [-1,0,0], // 위,아래
        [0,1,0], [0,-1,0], // 앞,뒤
        [0,0,1], [0,0,-1], // 좌,우
    ]
    while !queue.isEmpty {
        var temp: [Int] = []
        for p in queue {
            let h = p / mn
            let n = p % mn / mnh[0]
            let m = p % mn % mnh[0]
            for a in adjacent {
                if (0..<mnh[2] ~= h + a[0]) && (0..<mnh[1] ~= n + a[1]) && (0..<mnh[0] ~= m + a[2]) {
                    let point = [h + a[0], n + a[1], m + a[2]]
                    if box[point[0]][point[1]][point[2]] == 0 {
                        temp.append(point[0]*mnh[0]*mnh[1] + point[1] * mnh[0] + point[2])
                        box[point[0]][point[1]][point[2]] = 1
                    }
                }
            }
        }
        queue = temp
        if !queue.isEmpty { count += 1 }
    }
    for h in (0..<mnh[2]) {
        for n in (0..<mnh[1]) {
            for m in (0..<mnh[0]) {
                if box[h][n][m] == 0 {
                    return -1
                }
            }
        }
    }
    return count
}
print(bfs())
