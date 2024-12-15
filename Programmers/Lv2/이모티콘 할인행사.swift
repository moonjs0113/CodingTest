/*
  이모티콘 할인행사
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/150368
  Difficulty: Lv.2
  Topic : 2023 KAKAO BLIND RECRUITMENT
*/

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let saleEmoticons: [[(Int,Int)]] = setSaleEmotions(emoticons)
    var result = [0,0]
    for s in saleEmoticons {
        var member = 0
        var cost = 0
        for user in users {
            var userCost = 0
            for emoticon in s {
                if emoticon.0 >= user[0] {
                    userCost += emoticon.1
                    if userCost >= user[1] {
                        userCost = 0
                        member += 1
                        break
                    }
                }
            }
            cost += userCost
        }
        if result[0] == member && result[1] < cost {
            result[1] = cost
        } else if result[0] < member {
            result[0] = member
            result[1] = cost
        }
    }
    return result
}

func setSaleEmotions(_ emoticons:[Int]) -> [[(Int,Int)]] {
    let salePercent = [90, 80, 70, 60]
    var result: [[(Int,Int)]] = []
    func backTracking(cost: [(Int,Int)], b: Int) {
        if cost.count == emoticons.count {
            result.append(cost)
            return
        }
        for p in salePercent {
            var temp = cost
            temp.append( (100 - p, emoticons[b] * p / 100) )
            backTracking(cost: temp, b: b + 1)
            temp.removeLast()
        }
    }
    
    backTracking(cost: [], b: 0)
    return result
}
