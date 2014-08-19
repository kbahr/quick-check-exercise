module QCTests where

import Distribution.TestSuite.QuickCheck
import Data.List
import Exercise
import Text.Printf

prop_idempotent xs = quicksort (quicksort xs) == quicksort xs
					where _ = xs :: [Int]

prop_sorted xs = snd $ foldr (\curr (lst, b) -> (curr, lst >= curr)) (last sxs, True) sxs
				where sxs = quicksort xs :: [Int]
			
prop_maintainSize xs = length xs == (length $ quicksort xs)
				where _ = xs :: [Int]

prop_fails xs = False
	where _ = xs :: [Int]

tests :: IO [Test]
tests = return [testProperty "Remove me for great justice!" prop_fails, testGroup "Here we go!" myTests]

myTests = [testProperty "idempotent sort" prop_idempotent, testProperty "list is sorted"  prop_sorted, testProperty "list maintains size"  prop_maintainSize]
