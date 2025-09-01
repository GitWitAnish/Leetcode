class Solution:
    def isValidSudoku(self, board: list[list[str]]) -> bool:
        seen = set()

        for r in range(9):
            for c in range(9):
                val = board[r][c]
                if val == ".":
                    continue

                
                if (val, "row", r) in seen or (val, "col", c) in seen or (val, "box", r//3, c//3) in seen:
                    return False

                seen.add((val, "row", r))
                seen.add((val, "col", c))
                seen.add((val, "box", r//3, c//3))

        return True
    
