/*
  택배 배달과 수거하기
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/150369
  Difficulty: Lv.2
  Topic : 2023 KAKAO BLIND RECRUITMENT
*/

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var dPoint = n - 1, pPoint = n - 1, result = 0
    var dCopy = deliveries, pCopy = pickups
    
    while dPoint > -1 && dCopy[dPoint] == 0 { dPoint -= 1 }
    while pPoint > -1 && pCopy[pPoint] == 0 { pPoint -= 1 }
    
    while pPoint > -1 || dPoint > -1 {
        var c = cap
        result += max(dPoint + 1, pPoint + 1) * 2
        
        while c > 0 && dPoint > -1 {
            let d = min(c, dCopy[dPoint])
            c -= d
            dCopy[dPoint] -= d
            while dPoint > -1 && dCopy[dPoint] == 0 {
                dPoint -= 1
            }
        } 
        
        c = cap
        while c > 0 && pPoint > -1 {
            let d = min(c, pCopy[pPoint])
            c -= d
            pCopy[pPoint] -= d
            while pPoint > -1 && pCopy[pPoint] == 0 {
                pPoint -= 1
            }
        }
    }
    return Int64(result)
}
