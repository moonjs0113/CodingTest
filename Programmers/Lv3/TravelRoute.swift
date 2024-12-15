/*
  여행 경로(Travel Route)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/43164
  Difficulty: Lv.3
  Topic : DFS/BFS
*/

func solution(_ tickets:[[String]]) -> [String] {    
    var result: [String] = []
    var route: Set<Int> = []
    let sortedTickets = tickets.sorted { $0.last! < $1.last! }

    func dfs(cur: String) -> Bool {
        if result.count == tickets.count {
            result.append(cur)
            return true
        }
        for i in (0..<tickets.count) {
            if !route.contains(i) && cur == sortedTickets[i][0]{
                route.insert(i)
                result.append(sortedTickets[i][0] )
                if dfs(cur: sortedTickets[i][1]) { return true }
                result.removeLast()
                route.remove(i)
            }   
        }
        return false
    }
    
    dfs(cur: "ICN")
    return result
}
