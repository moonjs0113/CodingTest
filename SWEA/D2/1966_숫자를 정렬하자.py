"""
1966. 숫자를 정렬하자
주어진 N 길이의 숫자열을 오름차순으로 정렬하여 출력하라.

[제약 사항]
N 은 5 이상 50 이하이다.
"""
for case in range(0, int(input())):
  input()
  print(f'#{case+1} {" ".join(map(str,sorted(map(int,input().split()))))}')
