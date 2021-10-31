module Day2 where
import Data.Bits (xor)

split sep ls
    | null ls = []
    | otherwise = takeWhile (/= sep) ls:split sep (drop 1 (dropWhile (/= sep) ls))
splitIntoBlocks n ls
    | n <= 0 ||null ls = []
    | otherwise = take n ls:splitIntoBlocks n (drop n ls)
remChar c li = [x | x <- li, x/=c]

removeOn :: Char -> [[Char]] -> [[Char]]
removeOn c = map (remChar c)

splitOn :: Char -> [[Char]] -> [[Char]]
splitOn sep = concatMap (split sep)
parseString = splitIntoBlocks 4 . removeOn ':' . splitOn '-' . splitOn ' '
toInt n li =  read (li!!n) :: Int
check2a li = [
        length (filter (==head (x!!2)) (x!!3)) >= toInt 0 x
        && length (filter (==head (x!!2)) (x!!3)) <= toInt 1 x      
        | x <- li]
check2b li = [
         ((x!!3) !! (toInt 0 x -1) == head (x!!2)) `xor`
         ((x!!3) !! (toInt 1 x -1) == head (x!!2)) 
        | x <- li]
solution check= length . filter (==True) . check . parseString
day2 = do
    putStrLn "day2"
    contents <- readFile "../input/day2.txt"
    print . solution check2a . lines $ contents
    print . solution check2b . lines $ contents

