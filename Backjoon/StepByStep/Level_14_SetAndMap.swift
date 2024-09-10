import Foundation

/*
 백준 단계 별로 풀어보기
 14단계 집합과 맵 https://www.acmicpc.net/step/49
 특정 원소가 속해 있는지 빠르게 찾거나, 각 원소에 대응되는 원소를 빠르게 찾는 자료구조를 배워 봅시다.
 */

/*
 숫자 카드
 https://www.acmicpc.net/problem/10815
 */
readLine()
let cards = Set(readLine()!.split(separator: " ").map { Int($0)! })
readLine()
print(readLine()!.split(separator: " ").map { cards.contains(Int($0)!) ? "1" : "0" }.joined(separator: " "))

/*
 문자열 집합
 https://www.acmicpc.net/problem/14425
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let set = Set((0..<nums[0]).map { _ in readLine()! })
print((0..<nums[1]).filter { _ in set.contains(readLine()!) }.count)

/*
 회사에 있는 사람
 https://www.acmicpc.net/problem/7785
 */
var people: Set<String> = []
(0..<Int(readLine()!)!).forEach { _ in
    let name = String(readLine()!.split(separator: " ")[0])
    if people.contains(name) {
        people.remove(name)
    } else {
        people.insert(name)
    }
}
people.sorted(by: >).forEach{ print($0) }

/*
 나는야 포켓몬 마스터 이다솜
 https://www.acmicpc.net/problem/1620
 */
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var pocketmonsDict: [String:Int] = [:]
let pocketmonsList = (0..<nums[0]).map { i -> String in
    let name = readLine()!
    pocketmonsDict[name] = i + 1
    return name
}
(0..<nums[1]).forEach { _ in
    let i = readLine()!
    if let index = Int(i) {
        print(pocketmonsList[index-1])
    } else {
        print(pocketmonsDict[i]!)
    }
}

/*
 숫자 카드 2
 https://www.acmicpc.net/problem/10816
 */
var cards: [Int: Int] = [:]
readLine()
readLine()!.split(separator: " ").forEach {
    cards[Int($0)!] = (cards[Int($0)!] ?? 0) + 1
}
readLine()
print(readLine()!.split(separator: " ").map { "\(cards[Int($0)!] ?? 0)" }.joined(separator: " "))

/*
 듣보잡
 https://www.acmicpc.net/problem/1764
 */
let nm = readLine()!.split(separator: " ").map { Int($0)! }
var people: Set<String> = []
(0..<nm[0]).forEach { _ in
    people.insert(readLine()!)
}
people = Set((0..<nm[1]).compactMap { _ -> String? in
    let name = readLine()!
    return people.contains(name) ? name : nil
})
print(people.count)
people.sorted(by: <).forEach{ print($0) }

/*
 대칭 차집합
 https://www.acmicpc.net/problem/1269
 */
readLine()!
let set0 = Set(readLine()!.split(separator: " ").map { Int($0)! })
let set1 = Set(readLine()!.split(separator: " ").map { Int($0)! })
print(set0.subtracting(set1).union(set1.subtracting(set0)).count)

/*
 서로 다른 부분 문자열의 개수
 https://www.acmicpc.net/problem/11478
 */
let word = Array(readLine()!)
var set: Set<String> = Set(word.map(String.init))
(0..<word.count).forEach { i in
    var subWord = ""
    (i..<word.count).forEach { j in
        subWord += "\(word[j])"
        set.insert(subWord)
    }
}
print(set.count)

