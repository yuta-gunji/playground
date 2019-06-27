doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r


circumference' :: Double -> Double
circumference' r = 2 * pi * r

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName x = "Others"
