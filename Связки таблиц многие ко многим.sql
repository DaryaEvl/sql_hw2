
CREATE TABLE IF NOT EXISTS track (
id_track SERIAL PRIMARY KEY, 
track_name varchar(60) NOT NULL,
track_duration varchar(20) NOT null, 
id_album integer references album(id_album));

CREATE TABLE IF NOT EXISTS album (
id_album SERIAL PRIMARY KEY,
track_album varchar(60) NOT NULL,
release_year varchar(10) NOT null
);

CREATE TABLE IF NOT EXISTS list_of_artists (
id_artists SERIAL PRIMARY KEY,
artists_name varchar(60) NOT NULL);

CREATE TABLE IF NOT EXISTS genre (
id_genre SERIAL PRIMARY KEY,
genre_name varchar(60) NOT NULL);

CREATE TABLE IF NOT EXISTS GenreArtists (
	id_genre INTEGER REFERENCES genre(id_genre),
	id_artists INTEGER REFERENCES list_of_artists(id_artists),
	CONSTRAINT pk PRIMARY KEY (id_genre, id_artists)
);

CREATE TABLE IF NOT EXISTS AlbumArtists (
	id_album INTEGER REFERENCES album(id_album),
	id_artists INTEGER REFERENCES list_of_artists(id_artists),
	CONSTRAINT pk2 PRIMARY KEY (id_album, id_artists)
);

CREATE TABLE IF NOT EXISTS collection (
id_collection SERIAL PRIMARY KEY,
name_collection varchar(60) NOT NULL,
release_year_collection varchar(10) NOT null);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	id_collection INTEGER REFERENCES collection(id_collection),
	id_track  INTEGER REFERENCES track(id_track ),
	CONSTRAINT pk3 PRIMARY KEY (id_collection, id_track)
);