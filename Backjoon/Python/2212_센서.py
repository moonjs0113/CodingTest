"""
 센서
 https://www.acmicpc.net/problem/2212
"""

n = int(input())
k = int(input())
sensor = list(map(int,input().split()))
if n <= k:
    print(0)
else:
    sensor.sort()
    gap = []
    for i in range(1,len(sensor)):
        gap.append(sensor[i] - sensor[i-1])
    gap.sort()
    gap = gap[:len(gap) - (k - 1)]
    print(sum(gap))
