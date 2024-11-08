"""
 토마토
 https://www.acmicpc.net/problem/7569
"""

m,n,h = map(int,input().split())
box = []
queue = []
for hi in range(h):
  box.append([])
  for ni in range(n):
    line = list(map(int,input().split()))
    box[hi].append(line)
    for mi in range(m):
      if line[mi] == 1:
        queue.append(hi*m*n + ni * m + mi)

def bfs(box, queue, h, n, m):
  count = 0
  mn = m * n
  adjacent = [
    [1,0,0], [-1,0,0], # 위,아래
    [0,1,0], [0,-1,0], # 앞,뒤
    [0,0,1], [0,0,-1], # 좌,우
  ]
  while queue:
    temp = []
    for p in queue:
      hv = p // mn
      nv = p % mn // m
      mv = p % mn % m
      for a in adjacent:
        if (0 <= hv + a[0] < h) and (0 <= nv + a[1] < n) and (0 <= mv + a[2] < m):
          point = [hv + a[0], nv + a[1], mv + a[2]]
          if box[point[0]][point[1]][point[2]] == 0:
            temp.append(point[0]*m*n + point[1] * m + point[2])
            box[point[0]][point[1]][point[2]] = 1
    queue = temp
    if queue:
      count += 1
  for hi in range(h):
    for ni in range(n):
      for mi in range(m):
        if box[hi][ni][mi] == 0:
          return -1
  return count
print(bfs(box, queue, h, n, m))
