module Model.BinArgs where

data PreprocessStage = Help
                     | Sort
                     | MakeLookUp

instance Show PreprocessStage where
  show = showPropPro

showPropPro :: PreprocessStage -> String
showPropPro Sort = "Sort"
showPropPro MakeLookUp = "MakeLookUp"
showPropPro Help = "Help:\n this bin is seperated in diffrent stages\n\t\
\sort: sort the tag in use order\n\t\
\lookup: makes a lookup table to generate the hierarchical clustering"
