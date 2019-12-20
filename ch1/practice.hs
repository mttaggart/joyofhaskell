function :: Integer -> Integer -> Integer
function x y = case (x > y) of 
    False -> y
    True -> x + 10