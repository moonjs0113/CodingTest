"""
5607. [Professional] 조합
자연수 N와 R가 주어진다. 이 때의 N combination R의 값을 1234567891로 나눈 나머지를  출력하세요.
예를들면 N이 4, R이 2라면 4 combination 2는 (4 * 3) / (2 * 1) = 6이 된다.

[입력]
첫 줄에 테스트케이스의 개수 T가 주어진다. (1 ≤ T ≤ 20)
각 케이스의 첫 줄에 정수 N, R이 주어진다. (1 ≤ N ≤ 1000000, 0 ≤ R ≤ N)
"""
for case in range(int(input())):
  n, r = map(int,input().split())
  r = n - r if r > n/2 else r
  top = 1
  bottom = 1
  p = 1234567891
  for i in range(1,r+1):
    top = (top * (n - i + 1)) % p
    bottom = (bottom * i) % p
  result = 1
  tempP = p - 2
  while tempP > 0:
      if tempP % 2 == 1:
        result = (result * bottom) % p
      bottom = (bottom * bottom) % p
      tempP //= 2
  top = (top * result) % p
  print(f'#{case+1} {top}')
