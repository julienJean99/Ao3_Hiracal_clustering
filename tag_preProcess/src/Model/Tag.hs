module Model.Tag where

type ID = Integer

data Tag = Tag ID TagType String Bool Integer (Maybe ID) deriving (Show)

data TagType = ArchiveWarning
             | Fandom
             | RelationShip
             | Media
             | RawSettings
             | Category
             | Character
             | Freeform
             | UnsortedTag
             deriving (Read, Show)
