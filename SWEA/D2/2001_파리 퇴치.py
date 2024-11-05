"""
2001. 파리 퇴치
N x N 배열 안의 숫자는 해당 영역에 존재하는 파리의 개수를 의미한다.
M x M 크기의 파리채를 한 번 내리쳐 최대한 많은 파리를 죽이고자 한다.
죽은 파리의 개수를 구하라!

[제약 사항]
1. N 은 5 이상 15 이하이다.
2. M은 2 이상 N 이하이다.
3. 각 영역의 파리 갯수는 30 이하 이다.
"""
for case in range(int(input())):
  n, m = map(int,input().split())
  matrix = [list(map(int, input().split())) for _ in range(n)]
  r = []
  for i in range(n-m+1):
    for j in range(n-m+1):
      r.append(sum(sum(row[j:j+m]) for row in matrix[i:i+m]))
  print(f'#{case+1} {max(r)}')
