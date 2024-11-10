"""
21425. +=
C, C++, Python, Java 등의 언어에는 += 연산자가 있다.
정수형 변수 x, y가 있을 때 “x += y”를 하면 x에 저장된 값이 (기존에 x에 저장되어 있던 값) + (기존에 y에 저장되어 있던 값)으로 바뀐다.
현재 x에 저장된 값은 A, y에 저장된 값은 B이다.
당신은 “x += y” 또는 “y += x” 연산을 원하는 순서대로 원하는 만큼 수행하여, x나 y 둘 중 하나 이상에 저장된 값이 N 초과가 되게 하려고 한다.
연산을 합쳐서 최소 몇 번 수행해야 하는지 계산하는 프로그램을 작성하라.
"""
for case in range(int(input())):
  a,b,n = map(int,input().split())
  arr = [b,a] if a > b else [a,b]
  i = 0
  while arr[-1] <= n:
    v = arr[i] + arr[i+1]
    arr.append(v)
    i += 1
  print(i)
