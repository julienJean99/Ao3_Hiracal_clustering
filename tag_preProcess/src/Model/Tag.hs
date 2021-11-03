module Model.Tag where

type ID = Integer

data Tag = Tag ID TagType String Bool Integer (Maybe ID) deriving (Show)

data TagType = ArchiveWarning
             | Fandom
             | Relationship
             | Media
             | RawSettings
             | Category
             | Character
             | Freeform
             | UnsortedTag
             | Rating
             deriving (Read, Show)
