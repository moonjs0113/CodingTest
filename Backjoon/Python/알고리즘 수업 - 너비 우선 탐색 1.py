"""
 알고리즘 수업 - 너비 우선 탐색 1
 https://www.acmicpc.net/problem/24444
"""

import sys
import queue
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

q = queue.Queue()
visited = [0 for _ in range(n+1)]

def bfs(graph, visited, start):
  q.put(start)
  visited[start] = 1
  index = 2
  while q.qsize() > 0:
    point = q.get()
    for i in sorted(graph[point]):
      if visited[i] == 0:
        visited[i] = index
        index += 1
        q.put(i)

bfs(graph, visited, r)
print("\n".join(map(str, visited[1:])))
