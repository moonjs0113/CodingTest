"""
 촌수계산
 https://www.acmicpc.net/problem/2644
"""

input()
x,y = map(int,input().split())
parents = {}
for _ in range(int(input())):
  p, c = map(int,input().split())
  parents[c] = p

result = -1
xParents = [x]
yParents = [y]
xParent = parents[x] if x in parents else 0
yParent = parents[y] if y in parents else 0
while xParent != 0 or yParent != 0:
    if xParent != 0:
        xParents.append(xParent)
        xParent = parents[xParent] if xParent in parents else 0
    if yParent != 0:
        yParents.append(yParent)
        yParent = parents[yParent] if yParent in parents else 0
    i = set(xParents).intersection(set(yParents))
    if i:
        v = i.pop()
        result = xParents.index(v) + yParents.index(v)
        break
print(result)
