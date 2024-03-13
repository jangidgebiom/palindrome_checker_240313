import 'package:flutter_test/flutter_test.dart';
/*
* Palindrome Checker:
Explanation: A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and leYer casing). Examples include "level," "radar," and "A man, a plan, a canal, Panama!"
Step 1: Create a funtion to check if a string is a palindrome. Compare characters from the start and end of the string.
Step 2: Improve the funtion to handle cases with spaces and punctuation. Ignore them while checking for palindromes.
Step 3: Extend the funtion to work with phrases. Check if a sentence reads the same backward and forward, considering spaces and case.
Step 4: Handle empty strings. If the input is an empty string, consider it a valid palindrome. Step 5: Introduce an op4on to consider or ignore leYer casing. Allow users to choose whether 'level' and 'Level' should be considered the same.
* */
void main(){
  PalindromeChecker palindromeChecker = PalindromeChecker();

  //Step 1
  group("Palindrome check", () {
    test("WHEN entered string is \"RADAR\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("RADAR");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"BURO\", EXPECT false",(){
      final isPalindrome = palindromeChecker.isPalindrome("BURO");
      expect(isPalindrome, isFalse);
    });

    test("WHEN entered string is \"A\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("A");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"1234\", EXPECT false",(){
      final isPalindrome = palindromeChecker.isPalindrome("1234");
      expect(isPalindrome, isFalse);
    });

    test("WHEN entered string is \"121\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("121");
      expect(isPalindrome, isTrue);
    });
  });

  //Step 2.1
  group("Validate palindrome if input has space", () {
    test("WHEN entered string is \" DEIFIED\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome(" DEIFIED");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED \", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED ");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \" DEIFIED \", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome(" DEIFIED ");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \" D E I F I E D \", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome(" D E I F I E D ");
      expect(isPalindrome, isTrue);
    });
  });

  //Step 2.2
  group("Validate palindrome if input has punctuation", () {
    test("WHEN entered string is \"RADAR!\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("RADAR!");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED?\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED?");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED,\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED,");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED.\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED.");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED:\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED:");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"DEIFIED;\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("DEIFIED;");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \":DEIFIED;\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome(":DEIFIED;");
      expect(isPalindrome, isTrue);
    });
  });

  //Step 2.3
  group("Validate palindrome if input has space and punctuation", () {
    test("WHEN entered string is \" RADAR!\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome(" RADAR!");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \" R? A: D A R !\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome(" R,ADAR!");
      expect(isPalindrome, isTrue);
    });

  });

  //Step 3
  group("Validate palindrome phrases", () {
    test("WHEN entered string is \"able was I, ere I saw elba!\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("able was I, ere I saw elba!");
      expect(isPalindrome, isTrue);
    });

    test("WHEN entered string is \"CHANDRA! WHAT ARE YOU DOING?\", EXPECT false",(){
      final isPalindrome = palindromeChecker.isPalindrome("CHANDRA! WHAT ARE YOU DOING?");
      expect(isPalindrome, isFalse);
    });

    test("WHEN entered string is \"a man, a plan, a canal, panama!\", EXPECT true",(){
      final isPalindrome = palindromeChecker.isPalindrome("a man, a plan, a canal, panama!");
      expect(isPalindrome, isTrue);
    });

  });
}

class PalindromeChecker{
  bool isPalindrome(String input){
    String formattedInput = formatInput(input);
    return reversedInput(formattedInput) == formattedInput;
  }

  String formatInput(String input) => input.replaceAll(RegExp(r'[^\w\s]+|\s+'), "");
  String reversedInput(String input) => input.split("").reversed.join();
}