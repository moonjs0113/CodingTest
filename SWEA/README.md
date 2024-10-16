# SWEA(SW Expert Academy) - Python

- sorted(), sort
``` python
arr = [3, 1, 4, 1, 5, 9]
sorted_arr_desc = sorted(arr, reverse=True)  # 내림차순 정렬 [9, 5, 4, 3, 1, 1]
arr.sort() # [1, 1, 3, 4, 5, 9]

# Key
arr = ['banana', 'apple', 'cherry', 'blueberry']
sorted_arr = sorted(arr, key=len)

arr = [(1, 3), (2, 2), (3, 1)]
sorted_arr = sorted(arr, key=lambda x: x[1])
```

- List Comprehension
``` python
[x for x in range(10) if x % 2 == 0]                 # [0, 2, 4, 6, 8]
[x * y for x in range(1, 4) for y in range(1, 4)]    # [1, 2, 3, 2, 4, 6, 3, 6, 9]
```

- String
``` python
print("string".upper())   # STRING
print("STRING".isupper()) # True
print("STRING".lower())   # string
print("STRING".islower()) # False
```

- Math
``` python
import math
x = 3
x ** 2 # 9

gcd(a, b) # 최대공약수
factorial(n) # n!
sqrt(n) # 제곱근
```

- filter
``` python
lst = [1,2,3]
filter(lambda x: x % 2 == 1, lst)
```

- map
``` python
lst = [1, 2, 3]
result = list(map(str, lst))
```

-reduce
``` python
from functools import reduce
reduce(lambda r, x: r + x, range(10),0) # r 반환 값, x 시퀀스 값
```

- join
``` python
lst = ['a', 'b', 'c']
result = ' '.join(lst)  # 'a b c'
```

- enumerate
``` python
lst = ['a', 'b', 'c']
for idx, value in enumerate(lst):
    print(idx, value)  # 0 a, 1 b, 2 c
```

- Itertools
``` python
from itertools import permutations, combinations

data = [1, 2, 3]
list(permutations(data, 2))  # (1, 2), (1, 3), (2, 1), ...
list(combinations(data, 2))  # (1, 2), (1, 3), (2, 3)
```

- Deque
``` python
from collections import deque

dq = deque([1, 2, 3, 1, 1, 4])    # deque([1, 2, 3], maxlen=5)
dq[-1]                            # 오른쪽 요소 반환                 
dq[0]                             # 왼쪽 요소 반환
dq.append(4)                      # 오른쪽 끝에 요소를 추가
dq.appendleft(5)	              # 왼쪽 끝에 요소를 추가
dq.pop()	                      # 오른쪽 끝의 요소를 제거하고 반환
dq.popleft()	                  # 왼쪽 끝의 요소를 제거하고 반환
dq.extend([9,8,7])	              # 오른쪽 끝에 iterable의 모든 요소 추가
dq.extendleft([9,8,7])	          # 왼쪽 끝에 iterable의 모든 요소 추가 (역순으로 추가됨) ex. [7,8,9,...]
dq.remove(3)	                  # 첫 번째로 등장하는 요소 x를 제거
dq.rotate(2)	                  # x만큼 회전 (양수: 오른쪽, 음수: 왼쪽)
dq.clear()	                      # 모든 요소 제거
dq.count(5)	                      # 요소의 개수 반환
dq.index(4, 2, 7)	              # 요소의 첫 번째 인덱스 반환 (start, stop으로 범위 지정) ex. 2~7
dq.maxlen	                      # deque의 최대 길이를 설정 (넘으면 자동으로 앞 요소 제거)
```
> Heap(Max): 요소를 음수 처리해서 사용가능

- Heap(Min)
``` python
import heapq

heap = []
heapq.heappush(heap, 1)
heapq.heappush(heap, 3)
heapq.heappush(heap, 5)
heapq.heappop(heap)           # 1
nums = [5, 3, 2, 8, 1]
heapq.heapify(nums)           # nums: [1, 3, 2, 8, 5]
heapq.heappushpop(heap, 2)    # 2, heap: [3,5] -> push 후 pop
heapq.heapreplace(heap, 2)    # 3, heap: [2,5] -> pop 후 push

nums = [5, 3, 8, 1, 2, 10]
heapq.nlargest(3, nums)       # [10, 8, 5]
nums = [5, 3, 8, 1, 2, 10]
heapq.nsmallest(3, nums)      # [1, 2, 3]
```
> Heap(Max): 요소를 음수 처리해서 사용가능

