module Exercise where

	import Data.List
	
	quicksort [] = []
	quicksort (x:xs) = quicksort smaller ++ [x] ++ larger where
						smaller = filter (< x) xs
						larger = filter (> x) xs
