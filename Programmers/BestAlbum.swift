/*
  베스트앨범(BestAlbum)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42579
  Difficulty: Lv.3
  Topic : Hash
*/

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let dict = Dictionary(
        grouping: zip(genres,plays.enumerated()).map{($0.0,$0.1.element,$0.1.offset)},
        by: { $0.0 }
    )
    let sortedDict = dict.sorted { 
        $0.value.reduce(0) {$0 + $1.1} > $1.value.reduce(0) {$0 + $1.1} 
    }
    let playsSortedDict = sortedDict.map { song in
        song.value.sorted(by:{$0.1 > $1.1})
    }
    return playsSortedDict.flatMap { genreSet in 
        genreSet.count == 1 ? [genreSet[0].2] : [genreSet[0].2,genreSet[1].2] 
    }
}
