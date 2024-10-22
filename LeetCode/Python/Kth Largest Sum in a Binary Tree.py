"""
  Kth Largest Sum in a Binary Tree
  URL: https://leetcode.com/problems/kth-largest-sum-in-a-binary-tree
  Difficulty: Medium
  Topic : Tree, Breadth-First Search, Sorting, Binary Tree
"""

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthLargestLevelSum(self, root: Optional[TreeNode], k: int) -> int:
        result = []
        cur = [root]
        next = []
        while len(cur) > 0:
            s = 0
            for n in cur:
                s += n.val
                if n.left != None: next.append(n.left)
                if n.right != None: next.append(n.right)
            result.append(s)
            cur = next.copy()
            next = []
        return sorted(result)[-k] if len(result) >= k else -1
