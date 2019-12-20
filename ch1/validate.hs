validateUsernamePassword :: String -> String -> String
validateUsernamePassword user pass =
    case (null user, null pass) of
        (False, False)  -> "Okay"
        (True, False)   -> "Empty username"
        (False, True)   -> "Empty password"
        (True, True)    -> "Empty username and password"