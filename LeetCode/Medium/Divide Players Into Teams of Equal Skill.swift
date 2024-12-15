/*
  Divide Players Into Teams of Equal Skill
  URL: https://leetcode.com/problems/divide-players-into-teams-of-equal-skill
  Difficulty: Medium
  Topic: Array, Hash Table, Two Pointers, Sorting
*/

class Solution {
    func dividePlayers(_ skill: [Int]) -> Int {
        if skill.count == 2 { return skill.first! * skill.last! }
        let sortedSkill = skill.sorted()
        let teamSkill = sortedSkill.first! + sortedSkill.last!
        var result = 0
        for i in 0...(sortedSkill.count/2-1) {
            if sortedSkill[i] + sortedSkill[skill.count - 1 - i] != teamSkill {
                return -1    
            }
            result += (sortedSkill[i] * sortedSkill[skill.count - 1 - i])
        }
        return result
    }
}
