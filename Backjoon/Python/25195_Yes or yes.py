"""
 Yes or yes
 https://www.acmicpc.net/problem/25195
"""

n, m = map(int,input().split())
graph = [[] for i in range(n + 1)]
for _ in range(m):
  s, e = map(int,input().split())
  graph[s].append(e)
input()
gomgom = set(map(int,input().split()))
cache = [False] * (n + 1)
cache[1] = True

def bfs(graph, gomgom, cache):
    q = [1]
    p = 0
    if 1 in gomgom:
        return "Yes"
    while p < len(q):
        point = q[p]
        p += 1
        if not graph[point]:
            return "yes"
        for n in graph[point]:
            if not cache[n] and not n in gomgom:
                cache[n] = True
                q.append(n)
    return "Yes"

print(bfs(graph, gomgom, cache))
