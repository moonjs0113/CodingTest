"""
2063. 중간값 찾기
중간값은 통계 집단의 수치를 크기 순으로 배열 했을 때 전체의 중앙에 위치하는 수치를 뜻한다.
입력으로 N 개의 점수가 주어졌을 때, 중간값을 출력하라.

[제약 사항]
1. N은 항상 홀수로 주어진다.
2. N은 9이상 199 이하의 정수이다. (9 ≤ N ≤ 199)
"""
n = int(int(input())/2)
print(sorted(map(int,input().split()))[n])
