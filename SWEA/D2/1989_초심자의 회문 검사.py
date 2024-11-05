"""
1989. 초심자의 회문 검사
"level" 과 같이 거꾸로 읽어도 제대로 읽은 것과 같은 문장이나 낱말을 회문(回文, palindrome)이라 한다.
단어를 입력 받아 회문이면 1을 출력하고, 아니라면 0을 출력하는 프로그램을 작성하라.
[제약 사항]
각 단어의 길이는 3 이상 10 이하이다.
"""
for case in range(int(input())):
  r = 1
  s = input()
  for i in range(int(len(s)/2)):
    if s[i] != s[-i-1]:
      r = 0
      break
  print(f'#{case+1} {r}')
