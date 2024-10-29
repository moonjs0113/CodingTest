"""
1974. 스도쿠 검증
스도쿠는 숫자퍼즐로, 가로 9칸 세로 9칸으로 이루어져 있는 표에 1 부터 9 까지의 숫자를 채워넣는 퍼즐이다.
같은 줄에 1 에서 9 까지의 숫자를 한번씩만 넣고, 3 x 3 크기의 작은 격자 또한, 1 에서 9 까지의 숫자가 겹치지 않아야 한다.
입력으로 9 X 9 크기의 스도쿠 퍼즐의 숫자들이 주어졌을 때, 위와 같이 겹치는 숫자가 없을 경우, 1을 정답으로 출력하고 그렇지 않을 경우 0 을 출력한다.

[제약 사항]
1. 퍼즐은 모두 숫자로 채워진 상태로 주어진다.
2. 입력으로 주어지는 퍼즐의 모든 숫자는 1 이상 9 이하의 정수이다.
"""
for case in range(0, int(input())):
  sudoku = [list(map(int,input().split())) for _ in range(9)]
  result = 1
  for i in range(9):
    if len(set(sudoku[i])) < 9:
      result = 0
      break
    if len(set(map(lambda x: x[i], sudoku))) < 9:
      result = 0
      break
    if i % 3 == 0:
      for j in range(0,9,3):
        if len(set([item for r in sudoku[i:i+3] for item in r[j:j+3]])) < 9:
          result = 0
          break
    if result == 0:
      break
  print(f'#{case+1} {result}')
