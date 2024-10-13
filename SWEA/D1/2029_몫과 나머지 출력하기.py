"""
2029. 몫과 나머지 출력하기
2개의 수 a, b를 입력 받아, a를 b로 나눈 몫과 나머지를 출력하는 프로그램을 작성하라.

[제약 사항]
각 수는 1이상 10000이하의 정수이다.
"""
for i in range(0,int(input())):
    a, b = map(int, input().split())
    print(f"#{i+1}",int(a/b), a%b)
