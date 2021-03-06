module TestUtil where

import qualified Data.ByteString as BS
import Data.Maybe (fromJust)
import Test.QuickCheck

instance Arbitrary BS.ByteString where
    arbitrary = fmap BS.pack arbitrary

justAndRight :: Maybe (Either a b) -> Bool
justAndRight = either (const False) (const True) . maybe (Left undefined) id

fromJustAndRight :: (Show a) => Maybe (Either a b) -> b
fromJustAndRight = fromRight . fromJust

fromRight :: (Show a) => Either a b -> b
fromRight = either (\e -> error $ "not right: " ++ show e) id

fromLeft :: Either e a -> e
fromLeft (Left e) = e
fromLeft _        = error "is not left"

isLeft :: Either a b -> Bool
isLeft (Right _) = False
isLeft (Left _)  = True
