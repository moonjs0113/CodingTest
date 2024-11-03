"""
1984. 중간 평균값 구하기
10개의 수를 입력 받아, 최대 수와 최소 수를 제외한 나머지의 평균값을 출력하는 프로그램을 작성하라.
(소수점 첫째 자리에서 반올림한 정수를 출력한다.)

[제약 사항]
각 수는 0 이상 10000 이하의 정수이다.
"""
import statistics
for case in range(int(input())):
  print(f'#{case+1} {round(statistics.mean(sorted(list(map(int,input().split())))[1:9]))}')
