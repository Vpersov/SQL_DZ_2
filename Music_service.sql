CREATE TABLE IF NOT EXISTS Genres (
	Genres_id SERIAL PRIMARY KEY,
	Name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer (
	Performer_id SERIAL PRIMARY KEY,
	Name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresPerformer (
	GenresPerformer_id SERIAL PRIMARY KEY,
	Genres_id INTEGER NOT NULL REFERENCES Genres(Genres_id),
	Performer_id INTEGER NOT NULL REFERENCES Performer(Performer_id) 
);

CREATE TABLE IF NOT EXISTS Album (
	Album_id SERIAL PRIMARY KEY,
	Name VARCHAR NOT NULL,
	Year_of_issue DATE NOT NULL 
);

CREATE TABLE IF NOT EXISTS PerformerAlbum (
	PerformerAlbum_id SERIAL PRIMARY KEY,
	Performer_id INTEGER NOT NULL REFERENCES Performer(Performer_id),
	Album_id INTEGER NOT NULL REFERENCES Album(Album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	Track_id SERIAL PRIMARY KEY,
	Name VARCHAR NOT NULL,
	Duration TIME NOT NULL,
	Album_id INTEGER NOT NULL REFERENCES Album(Album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	Collection_id SERIAL PRIMARY KEY,
	Name VARCHAR NOT NULL,
	Year_of_issue DATE NOT NULL
);

CREATE TABLE CollectionTrack (
	CollectionTrack_id SERIAL PRIMARY KEY,
	Collection_id INTEGER NOT NULL REFERENCES Collection(Collection_id),
	Track_id INTEGER NOT NULL REFERENCES Track(Track_id)
);