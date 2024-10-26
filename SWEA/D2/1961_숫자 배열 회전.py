"""
1961. 숫자 배열 회전
N x N 행렬이 주어질 때,
시계 방향으로 90도, 180도, 270도 회전한 모양을 출력하라.

[제약 사항]
N은 3 이상 7 이하이다.
"""
for case in range(0, int(input())):
  print(f'#{case+1}')
  n = int(input())
  arr = []
  for _ in range(0, n):
    arr.append(list(map(int,input().split())))
  result = []
  line = ""
  for i in range(0, n):
    line += (''.join(map(lambda x: str(x[i]), reversed(arr))) + " ")
    line += (''.join(map(str, arr[n-i-1]))[::-1] + " ")
    line += ''.join(map(lambda x: str(x[n-i-1]), arr))
    result.append(line)
    line = ""
  print('\n'.join(result))
