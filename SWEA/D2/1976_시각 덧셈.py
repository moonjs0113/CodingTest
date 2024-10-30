"""
1976. 시각 덧셈
시 분으로 이루어진 시각을 2개 입력 받아, 더한 값을 시 분으로 출력하는 프로그램을 작성하라.
(시각은 12시간제로 표시한다. 즉, 시가 가질 수 있는 값은 1시부터 12시이다.)

[제약 사항]
시는 1 이상 12 이하의 정수이다. 분은 0 이상 59 이하의 정수이다.
"""
for case in range(0, int(input())):
  time = list(map(int,input().split()))
  time[0] += time[2]
  time[1] += time[3]
  if time[1] > 59:
    time[1] -= 60
    time[0] += 1
  if time[0] > 12:
    time[0] -= 12
  print(f'#{case+1} {time[0]} {time[1]}')
