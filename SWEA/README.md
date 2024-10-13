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

- String
``` python
print("string".upper())
print("STRING".isupper())
print("STRING".lower())
print("STRING".islower())
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

- map
``` python
lst = [1, 2, 3]
result = list(map(str, lst))
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

- Heap(Min)
``` python
import heapq

heap = []
heapq.heappush(heap, 3)
heapq.heappush(heap, 1)
heapq.heappush(heap, 2)

print(heapq.heappop(heap))  # 출력: 1 (최소값)
```
> Heap(Max): 요소를 음수 처리해서 사용가능

