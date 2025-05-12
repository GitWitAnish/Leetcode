class Solution {
    public:
        bool isPalindrome(int x) {
            if (x < 0) return false;
            string s = to_string(x);
            string reversed_s = string(s.rbegin(), s.rend());
            return s == reversed_s; 
        }
    };