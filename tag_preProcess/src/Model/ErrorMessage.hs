module Model.ErrorMessage where

import Control.Exception (Exception)

data ErrorMessages = InvalidArgument String
                   | FileDoesNotExist String
                   | CouldNotWrightToFile String
                   | Help
                   | HelpSort

instance Exception ErrorMessages

instance Show ErrorMessages where
  show = errorMessagesShow


errorMessagesShow :: ErrorMessages -> String
errorMessagesShow (InvalidArgument s) = "Invalid argument: "++s
errorMessagesShow (FileDoesNotExist s) = "File does not exist: "++s
errorMessagesShow (CouldNotWrightToFile s) = "Could not wright to file: "++s
errorMessagesShow Help = "Help:\n this bin is seperated in diffrent stages\n\
\\tsort: sort the tag in use order\n\t\
\lookup: makes a lookup table to generate the hierarchical clustering"
errorMessagesShow HelpSort = "Sort Stage:\n\t\
\this stage take 2 argument \n\t\
\\t[row data file path] [output file path]"
