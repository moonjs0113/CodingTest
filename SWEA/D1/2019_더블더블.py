""" 
2019. 더블더블
1부터 주어진 횟수까지 2를 곱한 값(들)을 출력하시오.
주어질 숫자는 30을 넘지 않는다.
""" 
print(" ".join(map(lambda x: str(2 ** x), range(0, int(input())+1))))
