data Song = Song {
    title  :: String,
    author :: Author,
    genre  :: String,
    album  :: String,
    length :: Int
  } deriving (Show, Eq)

data Author = Author {
    name        :: String,
    birthYear   :: Int,
    recordLabel :: String
} deriving (Show, Eq)

data Library = Library {
    songs  :: [Song],
    authors :: [Author]
} deriving (Show, Eq)

metallica = Author "Metallica" 1981 "Megaforce"
blur = Author "Blur" 1988 "Warner Bros"
song1 = Song "One" metallica "Metal" "... And Justice for All" 360
song2 = Song "Song2" blur "Alternative Pop" "Blur" 180 
song3 = Song "Nothing Else Matters" metallica "Metal" "Metallica" 400

library = Library [] []

fullLibrary = addAuthor (addAuthor (addSong (addSong (addSong library song1) song2) song3) metallica) blur

addAuthor :: Library -> Author -> Library
addAuthor library authorInfo = Library (songs library) (authorInfo : otherAuthors)
                               where otherAuthors = filter (\x -> x /= authorInfo) (authors library)


addSong :: Library -> Song -> Library
addSong library song = Library (song : otherSongs) (authors library)
                       where otherSongs = filter (\x -> x /= song) (songs library)

removeSong :: Library -> Song -> Library
removeSong library song = Library otherSongs (authors library)
                          where otherSongs = filter (\x -> x /= song) (songs library)

removeSongsByAuthor :: Library -> Author -> Library
removeSongsByAuthor library authorToRemove = Library songsByOtherAuthors (authors library)
                                             where songsByOtherAuthors = filter (\x -> (author x) /= authorToRemove) (songs library)

getSongsByTitle :: Library -> String -> [Song]
getSongsByTitle library songTitle = filter matchesSongTitle (songs library)
                                    where matchesSongTitle otherSong = title otherSong == songTitle

getSongsByAuthor :: Library -> Author -> [Song]
getSongsByAuthor library songAuthor = filter matchesSongAuthor (songs library)
                                      where matchesSongAuthor otherSong = author otherSong == songAuthor

getSongsByAlbum :: Library -> String -> [Song]
getSongsByAlbum library songAlbum = filter matchesSongAlbum (songs library)
                                    where matchesSongAlbum otherSong = album otherSong == songAlbum

getAuthorInformation :: Library -> String -> Author
getAuthorInformation library authorName =  head (filter matchesAuthor (authors library))    
                                          where matchesAuthor otherAuthor = name otherAuthor == authorName
