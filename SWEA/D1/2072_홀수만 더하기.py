"""
2072. 홀수만 더하기
10개의 수를 입력 받아, 그 중에서 홀수만 더한 값을 출력하는 프로그램을 작성하라.

[제약 사항]
각 수는 0 이상 10000 이하의 정수이다.
"""
for i in range(0,int(input())):
  print(f"#{i+1} {sum(filter(lambda x: x % 2 == 1,map(int,input().split())))}")
