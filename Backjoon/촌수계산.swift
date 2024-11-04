/*
 촌수계산
 https://www.acmicpc.net/problem/2644
*/

let n = Int(readLine()!)!
let persons = readLine()!.split(separator: " ").map { Int("\($0)")! }
var parents: [Int:Int] = [:]
for  _ in 0..<Int(readLine()!)! {
    let pc = readLine()!.split(separator: " ").map { Int("\($0)")! }
    parents[pc[1]] = pc[0]
}

var result = -1
var xParents: [Int] = [persons[0]]
var yParents: [Int] = [persons[1]]
var xParent: Int? = parents[persons[0]]
var yParent: Int? = parents[persons[1]]
while xParent != nil || yParent != nil {
    if let value = xParent {
        xParents.append(value)
        xParent = parents[value]
    }
    if let value = yParent {
        yParents.append(value)
        yParent = parents[value]
    }
    let t = Set(xParents).intersection(Set(yParents))
    if let value = t.first {
        result = xParents.firstIndex(of: value)! + yParents.firstIndex(of: value)!
        break
    }
}
print(result)
