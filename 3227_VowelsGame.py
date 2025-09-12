class Solution:
    def doesAliceWin(self, s: str) -> bool:
       v = set('aeiou')
       for c in s:
        if c in v:
            return True
       return False     
        