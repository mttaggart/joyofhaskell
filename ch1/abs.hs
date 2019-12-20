absVal :: (Num a, Ord a) => a -> a
absVal x = case (x < 0) of
    True -> negate x 
    False -> x