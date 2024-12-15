/*
  네트워크(Network)
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/43162
  Difficulty: Lv.3
  Topic : DFS/BFS
*/

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    if computers.flatMap{$0}.reduce(0,+) == n { return n }
    var network: [Int] = []
    
    func dfs(node: Int) {
        if network.contains(node) {
            return
        }
        network.append(node)
        var connectNodes: [Int] = []
        for (index, connectNode) in computers[node].enumerated() {
            if connectNode == 1 && index != node && !network.contains(index){
                connectNodes.append(index)
            }
        }
        
        if !connectNodes.isEmpty {
            for connectNode in connectNodes {
                dfs(node: connectNode)
            }
        }
    }
    
    var networks: [[Int]] = []
    for index in (0...computers.count-1) {
        if !networks.flatMap{$0}.contains(index) {
            network = []
            dfs(node: index)
            networks.append(network)
        }
    }
    return networks.count
}
