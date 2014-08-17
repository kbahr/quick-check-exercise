import Test.QuickCheck
import Data.List
import Exercise
import Text.Printf

main = mapM_ (\(s,a) -> printf "%-25s: " s >> a) tests

prop_idempotent xs = quicksort (quicksort xs) == quicksort xs
					where _ = xs :: [Int]

prop_sorted xs = snd $ foldr (\curr (lst, b) -> (curr, lst >= curr)) (last sxs, True) sxs
				where sxs = quicksort xs :: [Int]

tests = [("idempotent sort", quickCheck prop_idempotent), ("list is sorted", quickCheck prop_sorted)]