"""
  전력망을 둘로 나누기
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/86971
  Difficulty: Lv.2
  Topic : 완전탐색
"""

def solution(n, wires):
    adjNode = [[] for _ in range(n+1)]
    visited = [False for _ in range(n+1)]
    nodeSize = [0 for _ in range(n+1)]
    for w in wires:
        adjNode[w[0]].append(w[1])
        adjNode[w[1]].append(w[0])
        
    def DFSforChildCount(visited, nodeSize, adjNode, index):
        visited[index] = True
        count = 1
        for i in adjNode[index]:
            if visited[i]: continue
            count += DFSforChildCount(visited, nodeSize, adjNode, i)
        nodeSize[index] = count
        return count
    
    nodeSize[1] = DFSforChildCount(visited, nodeSize, adjNode, 1)
    
    result = 100
    visited = [False for _ in range(n+1)]
    
    def DFS(visited, nodeSize, adjNode, index, parentSize):
        nonlocal result
        visited[index] = True
        for i in adjNode[index]:
            if visited[i]: continue
            cutSize = nodeSize[index] - nodeSize[i] + parentSize
            result = min(result, abs(cutSize - nodeSize[i]))
            DFS(visited, nodeSize, adjNode, i, cutSize)

    DFS(visited, nodeSize, adjNode, 1, 0)
    return result
