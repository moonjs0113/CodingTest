/*
  다리를 지나는 트럭(The Truck Crossing The Bridge)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42583
  Difficulty: Lv.2
  Topic : Stack/Queue
*/

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var weightCap = weight - truck_weights.first!
    var time = 1
    var pointer = 0
    var truckOnbridge: [(Int,Int)] = [(truck_weights.first!, bridge_length)]
    (1..<truck_weights.count).forEach { i in
        let t = truck_weights[i]
        (pointer..<truckOnbridge.count).forEach {
            truckOnbridge[$0].1 -= 1
        }
        if truckOnbridge[pointer].1 <= 0 {
            weightCap += truckOnbridge[pointer].0
            pointer += 1
        }
        while weightCap - t < 0 {
            let tempTime = truckOnbridge[pointer].1
            time += tempTime
            (pointer...truckOnbridge.count-1).forEach {
                truckOnbridge[$0].1 -= tempTime
            }
            weightCap += truckOnbridge[pointer].0
            pointer += 1
        }
        
        weightCap -= t
        truckOnbridge.append((t, bridge_length))
        time += 1
    }
    time += bridge_length
    return time
}
