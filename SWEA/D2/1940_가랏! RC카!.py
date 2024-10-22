"""
1940. 가랏! RC카!
RC (Radio Control) 카의 이동거리를 계산하려고 한다.
입력으로 매 초마다 아래와 같은 command 가 정수로 주어진다.
0 : 현재 속도 유지.
1 : 가속
2 : 감속
위 command 중, 가속(1) 또는 감속(2) 의 경우 가속도의 값이 추가로 주어진다.
가속도의 단위는, m/s2 이며, 모두 양의 정수로 주어진다.
입력으로 주어진 N 개의 command 를 모두 수행했을 때, N 초 동안 이동한 거리를 계산하는 프로그램을 작성하라.
RC 카의 초기 속도는 0 m/s 이다.

[제약사항]
1. N은 2이상 30이하의 정수이다. (2 ≤ N ≤ 30)
2. 가속도의 값은 1 m/s2 혹은 2 m/s2 이다.
3. 현재 속도보다 감속할 속도가 더 클 경우, 속도는 0 m/s 가 된다.
"""
for case in range(0, int(input())):
  speed = 0
  distance = 0
  for _ in range(0, int(input())):
    command = input()
    if ' ' in command:
      t, v = map(int,command.split())
      if t == 1:
        speed += v
      else:
        speed = (speed - v) if (speed - v > 0) else 0
    distance += speed
  print(f"#{case+1} {distance}")
