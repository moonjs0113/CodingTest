"""
2071. 평균값 구하기
10개의 수를 입력 받아, 평균값을 출력하는 프로그램을 작성하라.
(소수점 첫째 자리에서 반올림한 정수를 출력한다.)

[제약 사항]
각 수는 0 이상 10000 이하의 정수이다.
"""
import statistics
for i in range(0,int(input())):
  print(f"#{i+1} {int(round(statistics.mean(map(int,input().split()))))}")
