"""
2005. 파스칼의 삼각형
크기가 N인 파스칼의 삼각형을 만들어야 한다.
파스칼의 삼각형이란 아래와 같은 규칙을 따른다.
1. 첫 번째 줄은 항상 숫자 1이다.
2. 두 번째 줄부터 각 숫자들은 자신의 왼쪽과 오른쪽 위의 숫자의 합으로 구성된다.
N을 입력 받아 크기 N인 파스칼의 삼각형을 출력하는 프로그램을 작성하시오.

[제약 사항]
파스칼의 삼각형의 크기 N은 1 이상 10 이하의 정수이다. (1 ≤ N ≤ 10)
"""
for case in range(int(input())):
  n = int(input())
  arr = []
  for i in range(n):
    if i == 0 or i == 1:
      arr.append([1] * (i+1))
    else:
      sub = []
      for j in range(len(arr[i-1])+1):
        if j == 0 or j == len(arr[i-1]):
          sub.append(1)
        else:
          sub.append(sum(arr[i-1][j-1:j+1]))
      arr.append(sub)
  print(f'#{case+1}')
  for a in arr:
    print(f"{' '.join(map(str,a))}")
