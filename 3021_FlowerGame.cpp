class Solution:
    def flowerGame(self, n: int, m: int) -> int:
        odd_x = (n + 1) // 2  
        even_x = n // 2        
        odd_y = (m + 1) // 2   
        even_y = m // 2        
    
        return odd_x * even_y + even_x * odd_y