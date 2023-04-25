DROP TABLE IF EXISTS users;

CREATE TABLE users(
    user_id                     TEXT UNIQUE NOT NULL,
    user_email                  TEXT UNIQUE NOT NULL,
    user_name                   TEXT UNIQUE NOT NULL,
    user_password               TEXT NOT NULL,
    user_last_name              TEXT DEFAULT "",
    user_avatar                 TEXT UNIQUE, 
    user_created_at             TEXT NOT NULL,
    user_total_tweets           INTEGER DEFAULT 0,
    user_total_retweets         INTEGER DEFAULT 0,
    user_total_comments         INTEGER DEFAULT 0,
    user_total_likes            INTEGER DEFAULT 0,
    user_total_dislikes         INTEGER DEFAULT 0,
    user_total_followers        INTEGER DEFAULT 0,
    user_total_following        INTEGER DEFAULT 0,
    PRIMARY KEY(user_id)
) WITHOUT ROWID;

INSERT INTO users VALUES("c093125adf8047738152099cbae7e0bb", "elonmusk@live.com", "elonmusk", "Elon", "Musk", "1", "1676629975", "0", "0", "0", "0", "0", "0", "0");
INSERT INTO users VALUES("21a129059e3748f38c60e269c9d0fa68", "barackobama@live.com", "BarackObama", "Barack", "Obama", "2", "1682315159", "0", "0", "0", "0", "0", "0", "0");
INSERT INTO users VALUES("aec05f81c10346d486b4cea6ff8c43db", "rickygervais@live.com", "rickygervais", "Ricky", "Gervais", "3", "1682315210", "0", "0", "0", "0", "0", "0", "0");
INSERT INTO users VALUES("a89d52876fb64cd0bb8706932e5659bd", "ryanreynolds@live.com", "VancityReynolds", "Ryan", "Reynolds", "4", "1682315384", "0", "0", "0", "0", "0", "0", "0");
INSERT INTO users VALUES("f3db87694de049fcae0b0177290f9005", "gaga@live.com", "ladygaga", "Lady", "Gaga", "5", "1682315509", "0", "0", "0", "0", "0", "0", "0");

