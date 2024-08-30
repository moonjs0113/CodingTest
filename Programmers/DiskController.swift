/*
  디스크 컨트롤러(Disk Controller)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42627
  Difficulty: Lv.3
  Topic : Heap
*/

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sortedJobs = jobs.sorted { $0[0] < $1[0]}
    var currentTime = 0
    var processTime: [Int] = []
    while !(sortedJobs.isEmpty) {
        let filter = sortedJobs.filter{ $0[0] <= currentTime }
        var job = filter.min {
            $0[1] + currentTime < $1[1] + currentTime
        }
        if filter.isEmpty {
            job = sortedJobs.min {
                $0[0] <= $1[0] && $0[1] < $1[1] 
            }
            currentTime = job![0]
        }
        currentTime += job![1]
        processTime.append(currentTime - job![0])
        let jobIndex = sortedJobs.firstIndex { $0[0] == job![0] && $0[1] == job![1] }  
        sortedJobs.remove(at: jobIndex!)
    }
    return processTime.reduce(0,+) / processTime.count
}
