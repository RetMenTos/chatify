CREATE SCHEMA IF NOT EXISTS `chatify`;
USE chatify;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
	AlbumID int NOT NULL AUTO_INCREMENT,
    Title varchar(255) NOT NULL,
    Artist varchar(255) NOT NULL,
    CoverImgLink varchar(255),
    ReleaseDate datetime NOT NULL,
    Genre varchar(63) NOT NULL,
    PRIMARY KEY (AlbumID)
);
CREATE TABLE tracks (
    TrackID int NOT NULL AUTO_INCREMENT,
    Title varchar(255) NOT NULL,
    ReleaseDate datetime NOT NULL,
    Genre varchar(63) NOT NULL,
    AlbumID int,
    TrackNo int,
    PRIMARY KEY (TrackID),
    FOREIGN KEY (AlbumID) REFERENCES albums(AlbumID)
); 
INSERT INTO albums (Title, Artist, CoverImgLink, ReleaseDate, Genre) values 
('Something', 'John', 'https://images.unsplash.com/photo-1599693596422-48940f0b4880?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '2008-11-11 13:23:44', 'Jazz'),
('Drive', 'Bill', 'https://images.unsplash.com/photo-1659039590369-c66ee1d43c83?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', '2011-04-22 15:13:34', 'Spongecore'),
('Anything', 'Bob', 'https://images.unsplash.com/photo-1581970560075-c0f568d76d0f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXw3NjMyMzgwNnx8ZW58MHx8fHx8', '2009-01-21 11:26:47', 'Classical');
INSERT INTO tracks (Title, ReleaseDate, Genre, AlbumID, TrackNo) values
('Thing 1', '2008-11-11 13:23:44', 'Jazz', 1, 1),
('Thing 2', '2008-11-11 13:23:44', 'Jazz', 1, 2),
('Thing 3', '2008-11-11 13:23:44', 'Jazz', 1, 3),
('I Drive', '2011-04-22 15:13:34', 'Spongecore', 2, 1),
('I Cannot Drive', '2011-04-22 15:13:34', 'Spongecore', 2, 2),
('I Crashed', '2011-04-22 15:13:34', 'Spongecore', 2, 3);
SELECT * FROM albums;