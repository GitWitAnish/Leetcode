class Solution {
    public:
        bool isPalindrome(string& text, int left, int right) {
            if (left >= right) {
                return true;
            }
    
            if (!isalnum(text[left])) {
                return isPalindrome(text, left + 1, right);
            }
    
            if (!isalnum(text[right])) {
                return isPalindrome(text, left, right - 1);
            }
    
            if (tolower(text[left]) != tolower(text[right])) {
                return false;
            }
    
            return isPalindrome(text, left + 1, right - 1);
        }
    
        bool isPalindrome(string text) {
            return isPalindrome(text, 0, text.length() - 1);
        }
    };