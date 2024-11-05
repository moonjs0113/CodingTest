"""
 나이트의 이동
 https://www.acmicpc.net/problem/7562
"""

for _ in range(int(input())):
  i = int(input())
  start = list(map(int,input().split()))
  end = list(map(int,input().split()))
  if start == end:
    print(0)
    continue
  movable = [
    [-2,-1], [-1,-2], [1,-2], [2,-1], [-2, 1], [-1, 2], [1, 2], [2, 1]
  ]
  cache = {start[0] * i + start[1]:0}
  q = [[start[0],start[1]]]
  qp = 0
  while qp < len(q):
    p = q[qp]
    count = cache[p[0] * i + p[1]]
    qp += 1
    for m in movable:
      n = [m[0]+ p[0], m[1] + p[1]]
      if 0 > n[0] or n[0] >= i or 0 > n[1] or n[1] >= i:
        continue
      if n == end:
        print(count + 1)
        qp = len(q)
        break
      key = n[0] * i + n[1]
      if not key in cache:
        q.append(n)
        cache[key] = count + 1
