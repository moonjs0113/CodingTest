"""
 특정 거리의 도시 찾기
 https://www.acmicpc.net/problem/18352
"""

from collections import deque
import sys
sysInput = sys.stdin.readline

n,m,k,x = map(int,sysInput().split())
graph = [[] for _ in range(n + 1)]
for _ in range(m):
  s,e = map(int,sysInput().split())
  graph[s].append(e)

cache = [-1] * (n + 1)
cache[x] = 0
q = deque([x])
result = []

while q:
  num = q.popleft()
  if cache[num] == k:
    result.append(num)
    continue
        
  for next in graph[num]:
    if cache[next] == -1:
      cache[next] = cache[num] + 1
      q.append(next)

print("\n".join(map(str, sorted(result))) if result else -1)
