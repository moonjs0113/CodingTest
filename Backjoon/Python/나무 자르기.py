"""
 나무 자르기
 https://www.acmicpc.net/problem/2805
"""

n, m = map(int,input().split())
tree = list(map(int,input().split()))
left, right = 0, max(tree)
result = 0
while left <= right:
  mid = (left + right) // 2
  sums = sum([t - mid if t > mid else 0 for t in tree])
  if sums >= m:
    result = mid
    left = mid + 1
    if sums == m:
      break
  else:
    right = mid - 1
print(result)
