"""
5642. [Professional] 합
N개의 정수가 입력으로 주어진다.
이때 연속하여 몇 개의 정수를 골라 합을 구할 수 있다.
예를 들어, 1 3 -8 18 -8 이 있다고 하자.
그럼 2번부터 4번까지의 수를 골라 합을 구하면, 3+(-8)+18 = 13이다.
이렇게 연속해서 정수를 골라 합을 구할 때, 그 합의 최대가 몇인지 구하는 프로그램을 작성하세요.
"""
for case in range(int(input())):
  input()
  nums = list(map(int, input().split()))
  r = nums[0]
  maxE = nums[0]
  for i in range(1,len(nums)):
    maxE = max(maxE + nums[i], nums[i])
    r = max(r, maxE)
  print(f'#{case+1} {r}')
