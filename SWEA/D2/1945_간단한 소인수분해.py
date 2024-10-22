"""
1945. 간단한 소인수분해
숫자 N은 아래와 같다.
N = 2^a * 3^b * 5^c * 7^d * 11^e
N이 주어질 때 a, b, c, d, e 를 출력하라.

[제약 사항]
N은 2 이상 10,000,000 이하이다.
"""
for case in range(0, int(input())):
  n = int(input())
  exp = {2:0, 3:0, 5:0, 7:0, 11:0}
  for key, value in exp.items():
    while n % key == 0:
      n /= key
      exp[key] += 1
  print(f"#{case+1} {' '.join(map(lambda x: str(x[1]),sorted(exp.items())))}")
