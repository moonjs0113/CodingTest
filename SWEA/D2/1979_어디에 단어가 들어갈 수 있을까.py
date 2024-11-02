"""
1979. 어디에 단어가 들어갈 수 있을까
N X N 크기의 단어 퍼즐을 만들려고 한다. 입력으로 단어 퍼즐의 모양이 주어진다.
주어진 퍼즐 모양에서 특정 길이 K를 갖는 단어가 들어갈 수 있는 자리의 수를 출력하는 프로그램을 작성하라.

[제약 사항]
1. N은 5 이상 15 이하의 정수이다. (5 ≤ N ≤ 15)
2. K는 2 이상 N 이하의 정수이다. (2 ≤ K ≤ N)
"""
for case in range(int(input())):
  n, k = map(int,input().split())
  board = []
  for _ in range(n):
    board.append(''.join(input().split()))
  count = 0
  if n == k:
    for i in range(n):
      count += 1 if board[i] == ("1" * n) else 0
      count += 1 if ''.join(map(lambda x: x[i], board)) == ("1" * n) else 0
  else:
    for r in range(n):
      count += 1 if board[r][0:k+1] == ("1" * k + "0") else 0
      count += 1 if board[r][-(k+1):] == ("0" + "1" * k) else 0
      rotate = ''.join(map(lambda x: x[r], board))
      count += 1 if rotate[0:k+1] == ("1" * k + "0") else 0
      count += 1 if rotate[-(k+1):] == ("0" + "1" * k) else 0
      for i in range(n-k-1):
        count += 1 if board[r][i:i+k+2] == (f"0{'1' * k}0") else 0
        count += 1 if rotate[i:i+k+2] == (f"0{'1' * k}0") else 0
  print(f'#{case+1} {count}')
