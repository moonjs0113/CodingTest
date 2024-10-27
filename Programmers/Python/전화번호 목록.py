"""
  전화번호 목록
  URL: https://school.programmers.co.kr/learn/courses/30/lessons/42577
  Difficulty: Lv.2
  Topic : Hash
"""

class TrieNode:
    def __init__(self, data=None):
        self.data = data
        self.children = {}

def solution(phone_book):
    root = TrieNode(None)
    for p in phone_book:
        current_node = root
        for char in p:
            if current_node.data != None:
                return False
            if char not in current_node.children:
                current_node.children[char] = TrieNode(None)
            current_node = current_node.children[char]
        current_node.data = p
        if len(current_node.children) > 0:
            return False
    return True
