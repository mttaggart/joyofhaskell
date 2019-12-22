reverseLine :: IO()
reverseLine = do
    line <- getLine
    print (reverse line)