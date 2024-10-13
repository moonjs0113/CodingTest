""" 
1933. 간단한 N 의 약수
입력으로 1개의 정수 N 이 주어진다.
정수 N 의 약수를 오름차순으로 출력하는 프로그램을 작성하라.

[제약사항]
N은 1이상 1,000이하의 정수이다. (1 ≤ N ≤ 1,000)
"""
import math
T = int(input())
a = [[],[]]
for i in range(1,int(math.sqrt(T))):
    if T % i == 0:
        a[0].append(i)
        a[1].append(int(T / i))
print(" ".join(map(str,a[0])) + " " + " ".join(map(str,reversed(a[1]))))
