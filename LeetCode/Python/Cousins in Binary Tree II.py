"""
  Cousins in Binary Tree II
  URL: https://leetcode.com/problems/cousins-in-binary-tree-ii
  Difficulty: Medium
  Topic : Hash Table, Tree, Depth-First Search, Breadth-First Search, Binary Tree
"""

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def replaceValueInTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        depthSum = root.val
        nextSum = [root.val]
        cur = [[root]]
        next = []
        while len(cur) > 0:
            newDepthSum = 0
            newNextSum = []
            for i in range(len(cur)):
                for node in cur[i]:
                    node.val = depthSum - nextSum[i]
                    pair = []
                    pairSum = 0
                    if node.left != None:
                        pair.append(node.left)
                        pairSum += node.left.val
                    if node.right != None:
                        pair.append(node.right)
                        pairSum += node.right.val
                    next.append(pair)
                    newNextSum.append(pairSum)
                    newDepthSum += pairSum
            cur = next
            next = []
            nextSum = newNextSum
            depthSum = newDepthSum
        return root
