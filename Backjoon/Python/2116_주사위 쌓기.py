"""
 주사위 쌓기
 https://www.acmicpc.net/problem/2116
"""

n = int(input())
opposite = {
    0:5, 1:3, 2:4,
    5:0, 3:1, 4:2
}
dices = [list(map(int,input().split())) for _ in range(n)]
result = 10001
for i in range(1,7):
    prev = i
    temp = 0
    for d in dices:
        next = d[opposite[d.index(prev)]]
        if (prev == 6 and next == 5) or (prev == 5 and next == 6):
            temp += 2
        elif prev == 6 or next == 6:
            temp += 1
        prev = next
        if temp > result + 2: break
    result = min(temp, result)
    if result == 0: break
print((6 * n) - (0 if n <= 1 else result))
