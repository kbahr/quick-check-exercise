module Exercise where

	import Data.List
	
	quicksort [] = []
	quicksort (x:xs) = quicksort [x0 | x0 <- xs, x0 < x] ++ [x] ++ quicksort [x0 | x0 <- xs, x0 >= x]
