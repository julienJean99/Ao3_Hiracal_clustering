module PreProcess (preProcess) where

import Model.BinArgs (PreprocessStage (..))
import Model.ErrorMessage (ErrorMessages (InvalidArgument))

preProcess :: [String] -> IO ()
preProcess args = handleResult $ print <$> processArgs args

handleResult :: Either ErrorMessages (IO ()) -> IO ()
handleResult (Right a) = a
handleResult (Left b) = print b

processArgs :: [String] -> Either ErrorMessages PreprocessStage
processArgs ("help":_) = return Help
processArgs ("--help":_) = return Help
processArgs ("-h":_) = return Help
processArgs [] = return Help
processArgs ("sort":_) = return  Sort
processArgs ("makeLookUp":_) = return MakeLookUp
processArgs (car:_) = Left (InvalidArgument car)
