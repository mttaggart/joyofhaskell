module Main where
import Data.Char

checkPasswordLength :: String -> Maybe String
checkPasswordLength p =
  case (length p > 20) of
    True -> Nothing
    False -> Just p

  
-- I strongly disagree with this implementation. 
-- Maybe is not helpful here, and in fact
-- confuses the recursion
cleanWhitespace :: String -> Maybe String
cleanWhitespace "" = Nothing
cleanWhitespace (x: xs) =
  case (isSpace x) of
    True -> cleanWhitespace xs
    False -> Just (x : xs)

-- Here's one implementation of a better cleanwhitespace 
cleanWhitespaceCorrectly :: String -> String
cleanWhitespaceCorrectly "" = ""
cleanWhiteSpaceCorrectly (x: xs)
    | isSpace x = cleanWhiteSpaceCorrectly xs
    | otherwise = [x] ++ cleanWhiteSpaceCorrectly xs

cleanWhitespaceElegant :: String -> String
cleanWhitespaceElegant s = 
  foldl (\a c -> if isSpace c then a else a ++ [c]) "" s

requireAlphaNum :: String -> Maybe String
requireAlphaNum pw =
  case (all isAlphaNum pw) of
    False -> Nothing
    True  -> Just pw

main :: IO ()
main = do
  putStrLn "Please enter a password"
  password <- getLine
  print (checkPasswordLength password)
