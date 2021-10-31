module Day3 where

tplSum (a,b) (x,y)=(a+x,b+y)
wrappingFirst p li= fst p `mod` (length . head $ li)
getSum p s li
    | length li <= snd p = 0
    | otherwise = (li!!snd p)!!wrappingFirst p li + getSum (tplSum p s) s li
symbolToInt x
    | x=='#'=1
    | otherwise = 0

toInt :: [[Char]] -> [[Int]]
toInt= (map.map) symbolToInt
day3b s li= product [getSum (0,0) x li | x <- s]
day3 = do
    putStrLn "day3"
    contents <- readFile "../input/day3.txt"
    let input=toInt $ lines contents
    print $ getSum (0,0) (3,1) input
    print $ day3b [(1,1),(3,1),(5,1),(7,1),(1,2)] input