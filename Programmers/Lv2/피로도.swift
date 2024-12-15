/*
  피로도
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/87946
  Difficulty: Lv.2
  Topic : 완전탐색
*/

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    permutations(
        data: dungeons, 
        count: dungeons.count
    )!.reduce(into: 0) { result, dungeons in
        var f = k
        var dungeonCount = 0
        var flag = true
        for dungeon in dungeons {
            if f >= dungeon.first! {
                f -= dungeon.last!
                dungeonCount += 1
            } else { break }
        }
        result = max(result, dungeonCount)
    }
}

func permutations<T>(data: [T], count: Int) -> [[T]]? {
    guard data.count >= count else { return nil }
    var result: [[T]] = []
    var buffer: [T] = []
    var visited = Array(repeating: false, count: data.count)

    func nextElement() {
        if buffer.count == count {
            result.append(buffer)
            return
        }
        for i in 0..<data.count {
            if !visited[i] {
                visited[i] = true
                buffer.append(data[i])
                nextElement()
                buffer.removeLast()
                visited[i] = false
            }
        }
    }
    nextElement()
    return result
}
