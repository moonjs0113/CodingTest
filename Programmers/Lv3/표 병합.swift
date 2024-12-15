/*
  표 병합
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/150366
  Difficulty: Lv.3
  Topic : 2023 KAKAO BLIND RECRUITMENT
*/

class Cell {
    var r: Int
    var c: Int
    var mergeTo: [Cell] = []
    var mergeFrom: Cell?
    var value: String = ""
    init(r: Int, c: Int) {
        self.r = r
        self.c = c
    }
}

func solution(_ commands:[String]) -> [String] {
    var table = (0...50).map { i in (0...50).map { j in Cell(r: i, c: j) } }
    var valueCache: [String: Set<Int>] = [:]
    
    func update(r: Int, c: Int, value: String) {
        var cell = table[r][c]
        while cell.mergeFrom != nil {
            cell = cell.mergeFrom!
        }
        valueCache[cell.value]?.remove(cell.c + 51 * cell.r)
        valueCache[value, default: []].insert(cell.c + 51 * cell.r)
        cell.value = value
    }
    
    func update(from: String, to: String) {
        valueCache[from]?.forEach { index in
            update(r: index / 51, c: index % 51, value: to)
        }
    }
    
    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
        if r1 == r2 && c1 == c2 { return }
        var cell1 = table[r1][c1]
        while cell1.mergeFrom != nil {
            cell1 = cell1.mergeFrom!
        }
        var cell2 = table[r2][c2]
        while cell2.mergeFrom != nil {
            cell2 = cell2.mergeFrom!
        }
        if cell1 === cell2 { return }
        if cell1.value.isEmpty {
            update(r: cell1.r, c: cell1.c, value: cell2.value)
        }
        update(r: cell2.r, c: cell2.c, value: "")
        cell1.mergeTo.append(cell2)
        cell2.mergeFrom = cell1
    }
    
    func unmerge(r: Int, c: Int) {
        var head = table[r][c]
        while head.mergeFrom != nil {
            head = head.mergeFrom!
        }
        let temp = head.value
        func dfs(cell: Cell) {
            cell.mergeTo.forEach {
                dfs(cell: $0)
            }
            cell.mergeFrom = nil
            cell.mergeTo = []
            update(r: cell.r, c: cell.c, value: "")
        }
        dfs(cell: head)
        if !temp.isEmpty {
            update(r: r, c: c, value: temp)
        }
    }
    
    func printValue(r: Int, c: Int) -> String {
        var head = table[r][c]
        while head.mergeFrom != nil {
            head = head.mergeFrom!
        }
        return head.value.isEmpty ? "EMPTY" : head.value
    }
    
    var result: [String] = []
    for command in commands {
        let cArgs = command.components(separatedBy: " ")
        switch cArgs[0] {
        case "UPDATE":
            if cArgs.count == 3 {
                update(from: cArgs[1], to: cArgs[2])
            } else {
                update(r: Int(cArgs[1])!, c: Int(cArgs[2])!, value: cArgs[3])
            }
        case "MERGE":
            merge(r1: Int(cArgs[1])!, c1: Int(cArgs[2])!, r2: Int(cArgs[3])!, c2: Int(cArgs[4])!)
        case "UNMERGE":
            unmerge(r: Int(cArgs[1])!, c: Int(cArgs[2])!)
        case "PRINT":
            result.append(printValue(r: Int(cArgs[1])!, c: Int(cArgs[2])!))
        default:
            break
        }
    }
    return result
}
