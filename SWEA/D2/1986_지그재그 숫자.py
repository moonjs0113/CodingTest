"""
1986. 지그재그 숫자
1부터 N까지의 숫자에서 홀수는 더하고 짝수는 뺐을 때 최종 누적된 값을 구해보자.

[제약사항]
N은 1 이상 10 이하의 정수이다. (1 ≤ N ≤ 10)
"""
for case in range(int(input())):
  n = int(input())
  print(f'#{case+1} {int((n+1) / 2) * (1 if n % 2 == 1 else -1)}')
