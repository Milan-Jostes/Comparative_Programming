--Initialize the recursion loop
binarySearch :: (Ord a) => [a] -> a -> Maybe Int
binarySearch arr target = binarySearchHelper arr target 0 (length arr - 1)

binarySearchHelper :: (Ord a) => [a] -> a -> Int -> Int -> Maybe Int
--Create the binary search function that will return the location IF it exists
binarySearchHelper arr target left right
    | left > right = Nothing --If the "small" side is greater than the "large" side, the value doesn't exist
    | midVal == target = Just mid --If the value is in the middle, return the middle value
    | midVal < target = binarySearchHelper arr target (mid + 1) right --If the target is in the larger bounds, call the function and input the larger value array
    | otherwise = binarySearchHelper arr target left (mid - 1)  --If the target is in the smaller bounds, call the function and input the smaller value array
    where
    --Define what the new values are for the decision
        mid = left + (right - left) `div` 2
        midVal = arr !! mid

--Define Main function
main :: IO ()
main = do
    --Create the array of values
    let arr = [1,2..10]
    --Define the target value
        target = 7

    --Create a case value, check whether the index is returned, output the location if it is, Target Not Found if it isn't
    case binarySearch arr target of
        Just index -> putStrLn $ "Location of " ++ show target ++ " is " ++ show index ++ "."
        Nothing    -> putStrLn $ "Target Not Found"