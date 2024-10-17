"""
2070. 큰 놈, 작은 놈, 같은 놈
2개의 수를 입력 받아 크기를 비교하여 등호 또는 부등호를 출력하는 프로그램을 작성하라.

[제약 사항]
각 수는 0 이상 10000 이하의 정수이다.
"""
for i in range(0,int(input())):
  a, b = map(int,input().split())
  print(f"#{i+1} {'=' if a == b else ('<' if a < b else '>')}")
