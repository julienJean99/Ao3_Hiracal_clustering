module SortTags where

import Model.Tag
import Model.ErrorMessage (ErrorMessages)

sortTags :: String -> Either ErrorMessages [Tag]
sortTags _ = return []
