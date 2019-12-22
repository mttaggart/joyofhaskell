module Main where
import Data.Char

checkPasswordLength :: String -> Maybe String
checkPasswordLength p =
  case (length p > 20 || length p < 10) of
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

validatePassword :: String -> Maybe String
validatePassword pw = 
  case (cleanWhitespace pw) of
    Nothing -> Nothing
    Just pw2 ->
      case (requireAlphaNum pw2) of
        Nothing -> Nothing
        Just pw3 ->
          case (checkPasswordLength pw3) of
            Nothing -> Nothing
            Just pw4 -> Just pw4

main :: IO ()
main = do
  putStrLn "Please enter a password"
  password <- getLine
  print (validatePassword password)
