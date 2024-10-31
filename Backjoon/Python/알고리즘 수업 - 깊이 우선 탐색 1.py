"""
 알고리즘 수업 - 깊이 우선 탐색 1
 https://www.acmicpc.net/problem/24479
"""

import sys
sys.setrecursionlimit(10 ** 6)
input = sys.stdin.read
data = input().split()
index = 3
n,m,r = map(int, data[:index])
graph = [[] for _ in range(n+1)]
for _ in range(m):
  s, e = map(int, data[index:index+2])
  graph[s].append(e)
  graph[e].append(s)
  index += 2
for edges in graph:
  edges.sort()
visited = [0 for _ in range(n+1)]
index = 1
def dfs(graph, visited, r):
  global index
  visited[r] = index
  index += 1
  for x in graph[r]:
    if visited[x] == 0:
      dfs(graph, visited, x)
dfs(graph, visited, r)
print("\n".join(map(str, visited[1:])))
