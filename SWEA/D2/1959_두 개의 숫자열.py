"""
1959. 두 개의 숫자열
N 개의 숫자로 구성된 숫자열 Ai (i=1~N) 와 M 개의 숫자로 구성된 숫자열 Bj (j=1~M) 가 있다.
서로 마주보는 숫자들을 곱한 뒤 모두 더할 때 최댓값을 구하라.

[제약 사항]
N 과 M은 3 이상 20 이하이다.
"""
from functools import reduce
for case in range(0, int(input())):
  input()
  a = list(map(int,input().split()))
  b = list(map(int,input().split()))
  if len(b) > len(a):
    a, b = b, a
  result = []
  for i in range(0,len(a)-len(b)+1):
    result.append(reduce(lambda x, y: x + (b[y] * a[y+i]), range(0,len(b)),0))
  print(f'#{case+1} {max(result)}')
