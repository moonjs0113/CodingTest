/*
  탕수육
  https://www.acmicpc.net/problem/13419
*/

(0..<Int(readLine()!)!).forEach { _ in
    var word = Array(readLine()!).map { "\($0)" }
    var s1 = ""
    var s2 = ""
    if word.count % 2 == 1 {
        word += word
    }
    for i in 0..<word.count {
        if i % 2 == 0 {
            s1 += word[i]
        } else {
            s2 += word[i]
        }
    }
    print(s1)
    print(s2)
}
