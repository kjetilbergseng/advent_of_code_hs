import Day1

main :: IO ()
main = do
    putStrLn $ if 
        day1a [1721,979,366,299,675,1456] 2020 == 514579
        then "Day 1a: Ok"
        else "Day 1a: Failed"
    putStrLn $ if 
        day1b [1721,979,366,299,675,1456] 2020 == 241861950
        then "Day 1b: Ok"
        else "Day 1b: Failed"
    return()       

