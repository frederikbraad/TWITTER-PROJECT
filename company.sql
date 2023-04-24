DROP TABLE IF EXISTS users;

CREATE TABLE users(
    user_id                     TEXT UNIQUE NOT NULL,
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

INSERT INTO users VALUES("c093125adf8047738152099cbae7e0bb", "elonmusk", "Elon", "Musk", "", "1676629975", "0", "0", "0", "0", "0", "0", "0");
