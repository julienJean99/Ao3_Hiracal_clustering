module Model.BinArgs where

data PreprocessStage = Sort SortArgs
                     | MakeLookUp

data SortArgs = Files FilePath FilePath

instance Show PreprocessStage where
  show = showPropPro
instance Show SortArgs where
  show = showSortArgs

showPropPro :: PreprocessStage -> String
showPropPro (Sort _) = "Sort"
showPropPro MakeLookUp = "MakeLookUp"

showSortArgs :: SortArgs -> String
showSortArgs (Files _ _) = ""
