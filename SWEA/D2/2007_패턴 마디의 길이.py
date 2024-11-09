"""
2007. 패턴 마디의 길이
패턴에서 반복되는 부분을 마디라고 부른다. 문자열을 입력 받아 마디의 길이를 출력하는 프로그램을 작성하라.

[제약 사항]
각 문자열의 길이는 30이다. 마디의 최대 길이는 10이다.
"""
for case in range(int(input())):
  s = input()
  r = ""
  for i in range(len(s)):
    r += s[i]
    if r == s[i+1:2*(i+1)]:
      break
  print(f'#{case+1} {len(r)}')
