"""
  Remove Sub-Folders from the Filesystem
  URL: https://leetcode.com/problems/remove-sub-folders-from-the-filesystem
  Difficulty: Medium
  Topic : Array, String, Depth-First Search, Trie
"""

class Solution:
    def removeSubfolders(self, folder: List[str]) -> List[str]:
        r = []
        for f in sorted(folder, key=len):
            for n in r:
                if f.startswith(f"{n}/"):
                    break
            else:
                r.append(f)
        return r
