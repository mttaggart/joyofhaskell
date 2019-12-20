import Data.Char

isPalindrome :: String -> Bool
isPalindrome word =
    (reverse $ map toLower word) == (map toLower word)

palResult :: Bool -> String
palResult res =
    case res of
        True -> "It's a palindrome!"
        False -> "Not a palindrome"

main :: IO()
main = 
    do
        putStr "Enter a word\n"
        word <- getLine
        putStrLn (palResult $ isPalindrome word)
        