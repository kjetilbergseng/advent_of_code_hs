module Day1 where

--day1
day1a target li= head [x*y | x <- li, y <- li, x+y==target];
day1b target li= head [x*y*z | x <- li, y <- li, z <- li, x+y+z==target];
toInt x =  read x :: Int
day1 = do
    putStrLn "day1"
    contents <- readFile "../input/day1.txt"
    print . day1a 2020 $ map toInt (lines contents)
    print . day1b 2020 $ map toInt (lines contents)