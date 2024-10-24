"""
1954. 달팽이 숫자
달팽이는 1부터 N*N까지의 숫자가 시계방향으로 이루어져 있다.
다음과 같이 정수 N을 입력 받아 N크기의 달팽이를 출력하시오.

[제약사항]
달팽이의 크기 N은 1 이상 10 이하의 정수이다. (1 ≤ N ≤ 10)
"""
for case in range(0, int(input())):
  n = int(input())
  d = [1,0]
  p = [0,0]
  arr = [[0] * n for _ in range(n)]
  for i in range(0,n*n):
    arr[p[1]][p[0]] = i + 1
    if d[0] == 1:
      p[0] += 1
      if (p[0] == n) or (p[0] < n and arr[p[1]][p[0]] != 0):
        d = [0,1]
        p = [p[0]-1,p[1]+1]
    elif d[0] == -1:
      p[0] -= 1
      if (p[0] == -1) or (p[0] > -1 and arr[p[1]][p[0]] != 0):
        d = [0,-1]
        p = [p[0]+1,p[1]-1]
    else:
      if d[1] == 1:
        p[1] += 1
        if p[1] == n or (p[1] < n and arr[p[1]][p[0]] != 0):
          d = [-1,0]
          p = [p[0]-1,p[1]-1]
      else:
        p[1] -= 1
        if arr[p[1]][p[0]] != 0:
          d = [1,0]
          p = [p[0]+1,p[1]+1]
  result = '\n'.join(map(lambda x: ' '.join(map(str,x)), arr))
  print(f'#{case+1}\n{result}')
