"""
1983. 조교의 성적 매기기
학기가 끝나고, 학생들의 점수로 학점을 계산중이다.
학점은 상대평가로 주어지는데, 총 10개의 평점이 있다.
A+, A0, A-, B+, B0, B-, C+, C0, C-, D0

학점은 학생들이 응시한 중간/기말고사 점수 결과 및 과제 점수가 반영한다.
각각 아래 비율로 반영된다.
총점 = 중간고사(35%) + 기말고사(45%) + 과제(20%)

학점을 알고싶은 K 번째 학생의 번호가 주어졌을 때, K 번째 학생의 학점을 출력하는 프로그램을 작성하라.

[제약사항]
1. N은 항상 10의 배수이며, 10이상 100이하의 정수이다. (10 ≤ N ≤ 100)
2. K는 1 이상 N 이하의 정수이다. (1 ≤ K ≤ N)
3. K 번째 학생의 총점과 다른 학생의 총점이 동일한 경우는 입력으로 주어지지 않는다.
"""
grade = ["A+", "A0", "A-", "B+", "B0", "B-", "C+", "C0", "C-", "D0"]
for case in range(int(input())):
  n, k = map(int,input().split())
  score = []
  kScore = 0
  for i in range(n):
    m, f, a = map(int,input().split())
    s = (m * 35 + f * 45 + a * 20)/100
    score.append(s)
    if i == k-1:
      kScore = s
  score.sort(reverse=True)
  print(f'#{case+1} {grade[int(score.index(kScore)/(n/10))]}')
