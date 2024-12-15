/*
  단어 변환(Word Conversion)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/43163
  Difficulty: Lv.3
  Topic : DFS/BFS
*/

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    let allWords = Set(words)
    func recursion(_ begin:String,_ stepWords: Set<String>) -> Int? {
        if begin == target { return stepWords.count }
        var setWords = allWords.subtracting(stepWords)
        if setWords.isEmpty { return nil }
        setWords = setWords.filter { word in
            (zip(begin, word).filter { $0.0 != $0.1 }.count == 1)
        }
        return setWords.compactMap { recursion($0, stepWords.union([$0])) }.min()
    }
    return recursion(begin, []) ?? 0
}
