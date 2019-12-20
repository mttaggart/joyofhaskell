
safeHead :: [a] -> Maybe a
safeHead (x: xs) = Just x
safeHead [] = Nothing

safeTail :: [a] -> Maybe [a]
safeTail (x: xs) = Just xs
safeTail [] = Nothing