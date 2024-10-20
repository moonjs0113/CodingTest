"""
  Parsing A Boolean Expression
  URL: https://leetcode.com/problems/parsing-a-boolean-expression
  Difficulty: Hard
  Topic : String, Stack, Recursion
"""

from functools import reduce
class Solution:
    def parseBoolExpr(self, expression: str) -> bool:
        def operate(o, v: list[bool]) -> bool:
            if o == "&":
                return reduce(lambda x, r: x and r, v, True)
            elif o == "|":
                return reduce(lambda x, r: x or r, v, False)
            else:
                return not v[0]
        
        operStack = []
        boolStack: list[bool] = []
        for e in expression:
            if e in "&|!":
                operStack.append(e)
            elif e == "(":
                boolStack.append([])
            elif e == ")":
                r = operate(operStack.pop(), boolStack.pop())
                print(r)
                if len(boolStack) > 0:
                    last = boolStack.pop()
                    last.append(r)
                    boolStack.append(last)
                else:
                    boolStack.append([r])
            elif e in "ft":
                if len(boolStack) > 0:
                    last = boolStack.pop()
                    last.append(e == "t")
                    boolStack.append(last)
        return boolStack[-1][-1]
