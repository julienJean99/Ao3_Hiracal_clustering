module Model.ErrorMessage where

data ErrorMessages = InvalidArgument String

instance Show ErrorMessages where
  show = errorMessagesShow


errorMessagesShow :: ErrorMessages -> String
errorMessagesShow (InvalidArgument s) = "Invalid argument: "++s
