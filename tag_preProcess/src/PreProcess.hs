module PreProcess (preProcess) where

import System.Environment (getArgs)
import Model.BinArgs (PreprocessStage (..), SortArgs(..))
import Model.ErrorMessage (ErrorMessages (..))
import Model.Tag
import SortTags (sortTags)
import Control.Exception (try)
import Control.Monad.Trans.Except (ExceptT(..), runExceptT, withExceptT, throwE)

preProcess :: IO ()
preProcess = runExceptT pipeline >>= handleResult

pipeline :: ExceptT ErrorMessages IO ()
pipeline = ExceptT (processArgs <$> getArgs) >>= startStage

startStage :: PreprocessStage -> ExceptT ErrorMessages IO ()
startStage (Sort args) = startSort args
startStage MakeLookUp = return ()

startSort :: SortArgs -> ExceptT ErrorMessages IO ()
startSort (Files raw dest) = ExceptT (try $ readFile raw) >>= (writeSortedTags dest . sortTags)

writeSortedTags :: FilePath -> Either ErrorMessages [Tag] -> ExceptT ErrorMessages IO ()
writeSortedTags dest (Right tags) = ExceptT $ try $ writeFile dest $ show tags
writeSortedTags _    (Left e)     = throwE e

handleResult :: Either ErrorMessages () -> IO ()
handleResult (Right _) = return ()
handleResult (Left b) = print b

processArgs :: [String] -> Either ErrorMessages PreprocessStage
processArgs ("help":_) = Left Help
processArgs ("--help":_) = Left Help
processArgs ("-h":_) = Left Help
processArgs [] = Left Help
processArgs ("sort":cdr) = sortArgs cdr
processArgs ("makeLookUp":_) = return MakeLookUp
processArgs (car:_) = Left (InvalidArgument car)

sortArgs :: [String] -> Either ErrorMessages PreprocessStage
sortArgs [dataFile, destinationFile] = return $ Sort $ Files dataFile destinationFile
sortArgs _ = Left HelpSort
