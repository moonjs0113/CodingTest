/*
  Iterator for Combination
  URL: https://leetcode.com/problems/iterator-for-combination
  Difficulty: Medium
  Topic: String, Backtracking, Design, Iterator
*/

class CombinationIterator {
    var combination: [String]
    init(_ characters: String, _ combinationLength: Int) {
        let chars = Array(characters).map(String.init).sorted()
        var q: [(String, Int)] = [("", -1)]
        var step = 0
        while step < combinationLength {
            var buffer: [(String, Int)] = []
            for e in q {
                for i in (e.1 + 1)...(chars.count - combinationLength + step) {
                    buffer.append((e.0 + chars[i], i))
                }
            }
            q = buffer
            step += 1
        }
        self.combination = q.reversed().map { $0.0 }
    }
    
    func next() -> String {
        combination.removeLast()
    }
    
    func hasNext() -> Bool {
        !combination.isEmpty
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
