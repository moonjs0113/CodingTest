"""
2056. 연월일 달력
연월일 순으로 구성된 8자리의 날짜가 입력으로 주어진다.
해당 날짜의 유효성을 판단한 후, 날짜가 유효하다면 "YYYY/MM/DD"형식으로 출력하고,
날짜가 유효하지 않을 경우, -1 을 출력하는 프로그램을 작성하라.

연월일로 구성된 입력에서 월은 1~12 사이 값을 가져야 하며
일은 윤년을 고려하지 않는 날짜까지의 값을 가질 수 있다.
"""
dateDict = {1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31}
for i in range(0,int(input())):
  date = input()
  mm = int(date[4:6])
  dd = int(date[6:8])
  if mm > 12 or mm == 0:
    print(f"#{i+1} -1")
  else :
    if dd > dateDict[mm] or dd == 0:
      print(f"#{i+1} -1")
    else:
      print(f"#{i+1} {date[0:4]}/{mm:02}/{dd:02}")
