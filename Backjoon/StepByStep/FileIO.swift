/*
 백준
 빠른 입출력 클래스

 Reference
 - https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88

 readLine()보다 input을 더 빠르게 읽기 위해 FileHandle 사용
 
 @inline(__always) 
 - 컴파일러 최적화와 상관없이 함수를 항상 인라인 처리한다.
 - 함수 호출로 인한 Function Call Stack Frame 생성, 함수 진입 및 종료 등의 과정을 생략

 ex)
 @inline(__always)
 func add(_ a: Int, _ b: Int) -> Int {
     return a + b
 }
 
 // add함수가 평가되는 시점에 함수 호출 대신 3 + 5 로 대체
 let result = add(3, 5) 
 */

import Foundation

// Ascii Value 가독성을 위한 Extension
extension UInt8 {
    static let LF: Self = 10
    static let SP: Self = 32
    static let minus: Self = 45
    static let zeroValue: Self = 48
    static let nineValue: Self = 57
}

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
        // + [UInt8(0)]: 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }
  
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        // 공백과 줄바꿈 무시
        while now == .LF || now == .SP {
            now = read()
        }
        // 음수 처리
        if now == .minus { 
            isPositive.toggle()
            now = read()
        }
        while now >= .zeroValue && now <= .nineValue {
            sum = sum * 10 + Int(now - .zeroValue)
            now = read()
        }
        return sum * (isPositive ? 1 : -1)
    }
}

