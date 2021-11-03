module SortTags where

import Model.Tag
import Model.ErrorMessage (ErrorMessages (CouldNotReadField))
import Text.Read (readEither, readMaybe)
import Data.Bifunctor (first)
import qualified Data.Char as Char
import Data.List (sortOn)


sortTags :: String -> Either ErrorMessages [Tag]
sortTags file = sortOn (\ (Tag _ _ _ _ use _) -> use) <$> mapM parseTag ((tail . lines) file)

infixl 3 ==>
(==>) :: (Either ErrorMessages (a -> b), (String, String)) -> (String -> Either ErrorMessages a) -> (Either ErrorMessages b, (String, String))
(constructor, (current, next)) ==> f = (constructor <*> f current, (span separator . tail) next)

separator :: Char -> Bool
separator = (',' /=)

parseTag :: String -> Either ErrorMessages Tag
parseTag line = fst $ (pure Tag, span separator line)
  ==> readValue
  ==> readValue
  ==> return
  ==> readValue . capitalized
  ==> readValue
  ==> return . readMaybe

readValue :: Read a => String -> Either ErrorMessages a
readValue s = first (\_ -> CouldNotReadField s) $ readEither s

capitalized :: String -> String
capitalized (car:cdr) = Char.toUpper car : cdr
capitalized [] = []
