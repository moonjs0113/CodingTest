/*
  [1차] 추석 트래픽
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/17676
  Difficulty: Lv.3
  Topic : 2018 KAKAO BLIND RECRUITMENT
*/

import Foundation 

func solution(_ lines:[String]) -> Int {
    if lines.count == 1 { return 1 }
    else {
        var result = 1
        let logs = lines.map(Log.init(line:))
        for item in logs.enumerated() {
            let endTime = item.element.response + 999
            var temp = 1
            if item.offset < logs.count-1 {
                for i in (item.offset+1)...logs.count-1 {
                    if logs[i].response > (endTime + 3001) { break }
                    if logs[i].request <= endTime {
                        temp += 1
                    }
                }
            }
            result = max(result, temp)
        }
        return result
    }
}

struct Log {
    let response: Int
    let request: Int
    let pTime: Int
    init(line: String) {
        let lineParse = line.components(separatedBy: " ")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let date = formatter.date(from: "\(lineParse[0]) \(lineParse[1])")!
        self.response = Int(date.timeIntervalSince1970 * 1000)
        self.pTime = Int(Double("\("\(lineParse[2])".dropLast(1))")! * 1000) 
        self.request = (self.response - self.pTime + 1)
    }
}

