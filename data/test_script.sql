DROP TABLE IF EXISTS users;
CREATE TABLE users(
    user_id                     TEXT UNIQUE NOT NULL,
    user_name                   TEXT UNIQUE NOT NULL,
    user_first_name             TEXT NOT NULL,
    user_last_name              TEXT DEFAULT "",
    user_email                  TEXT UNIQUE NOT NULL,
    user_password               TEXT NOT NULL,
    user_verified               INT DEFAULT 0,
    user_avatar                 TEXT DEFAULT "default.jpg",
    user_cover                  TEXT DEFAULT "default-cover.png",
    user_created_at             TEXT NOT NULL,
    user_total_tweets           TEXT DEFAULT 0,
    user_total_following        TEXT DEFAULT 0,
    user_total_followers        TEXT DEFAULT 0,
    PRIMARY KEY(user_id)
) WITHOUT ROWID;

-- INSERT INTO users VALUES("user_id", "user_name", "user_first_name", "user_last_name", "user_verified", "user_avatar.jpg", "user_cover.jpg", "user_created_at", "user_total_tweets", "user_total_following", "user_total_followers");
INSERT INTO users VALUES("a9890d6a78a344ec87401cdb85e38a14", "ladygaga", "Lady", "Gaga", "gaga@gakgak.dk", "123", "1", "046d38ab9a094b8fb4993d9e2f2131b6.jpg", "b7add1c2b384480bacfdc615c8a3e5aa.jpg", "1204326000", "9936", "116300", "84800000");
INSERT INTO users VALUES("ebb0d9d74d6c4825b3e1a1bcd73ff49a", "elonmusk", "Elon", "Musk", "elon@mail.dk", "123", "0", "0df4ab53a8b14dd0925f6f2d1689c2c6.jpg", "47939906fea84cd28d7c56ac30d63a02.jpg", "1243883319", "23300", "182", "130700000");
INSERT INTO users VALUES("7860393a03dc4c1e872dcdd2cbf946ab", "RSprachrohr", "Rammstein", "", "rsp@mail.dk", "123", "1", "0d9b9dd5bde54e338b6335ea0b8eb265.jpg", "c5fbc4cc1aa94940a67c07c873d86352.jpg", "1280689719", "313", "0", "536300");


CREATE INDEX idx_users_user_first_name ON users(user_first_name);
CREATE INDEX idx_users_user_last_name ON users(user_last_name);
CREATE INDEX idx_users_user_avatar ON users(user_avatar);
CREATE INDEX idx_users_user_cover ON users(user_cover);

SELECT name FROM sqlite_master WHERE type = 'index';
SELECT name FROM sqlite_master WHERE type = 'trigger';


-- ##############################
-- TWEETS
DROP TABLE IF EXISTS tweets;
CREATE TABLE tweets(
    tweet_id                    TEXT,
    tweet_message               TEXT,
    tweet_image                 TEXT,
    tweet_created_at            TEXT,
    tweet_user_fk               TEXT,
    tweet_total_comments        TEXT DEFAULT 0,
    tweet_total_retweets        TEXT DEFAULT 0,
    tweet_total_likes           TEXT DEFAULT 0,
    tweet_total_views           TEXT DEFAULT 0,
    PRIMARY KEY(tweet_id)
)WITHOUT ROWID;

-- Lady Gaga
-- INSERT INTO tweets VALUES("tweet_id", "tweet_message", "tweet_image.jpg", "tweet_created_at", "tweet_user_fk", "tweet_total_comments", "tweet_total_retweets", "tweet_total_likes", "tweet_total_views");
INSERT INTO tweets VALUES("7d36ea9c18344874843823487d22c16c", "V MAGAZINE: CHROMATICA BALL DIARIES BY HEDI SLIMANE COVER 1", "76266667f54942d490a1ec2809d9ac2d.jpg", "1663084920", "a9890d6a78a344ec87401cdb85e38a14", "1,730", "9,033", "45,400", "");
INSERT INTO tweets VALUES("28106db01fdc496b8f8881e1d943a201", "V MAGAZINE: CHROMATICA BALL DIARIES BY HEDI SLIMANE COVER 2", "67ed34300fa640c38cfc5d01d4d8cca3.jpg", "1663099320", "a9890d6a78a344ec87401cdb85e38a14", "1,733", "9,034", "45,500", "");
INSERT INTO tweets VALUES("678b621fafbd4492ba9238454dd7c44c", "V MAGAZINE: CHROMATICA BALL DIARIES BY HEDI SLIMANE COVER 3", "a64b696daf5a408289ce85e46f9fc8f2.jpg", "1663423260", "a9890d6a78a344ec87401cdb85e38a14", "622", "3,850", "28,600", "");
INSERT INTO tweets VALUES("2ad7f04da0c2424588ed67b9b8e723fe", "V MAGAZINE: CHROMATICA BALL DIARIES BY HEDI SLIMANE COVER 4", "4b74287a2f83437d84b7c7a5e10dec7e.jpg", "1663437600", "a9890d6a78a344ec87401cdb85e38a14", "897", "4,178", "31,900", "");
INSERT INTO tweets VALUES("ea8b05752c1e41a6888b32bb018cca5f", "Folie à Deux 🃏", "46b856c87fa149208960c92430f29336.jpg", "1676888455", "a9890d6a78a344ec87401cdb85e38a14", "6,379", "71,300", "31,900", "16,1M");
INSERT INTO tweets VALUES("978f1366cacb44dd8b63205720ccadc5", "CHROMATICA BALL TOUR MERCH AVAILABLE NOW ⚔️💓 http://shop.ladygaga.com", "9befbd1fe2384bef98809599a3519d13.jpg", "1669187160", "a9890d6a78a344ec87401cdb85e38a14", "1,478", "3,438", "16,700", "");
INSERT INTO tweets VALUES("6ff7ca63bec0476699fe1c33dd2554b7", "I am so honored to be nominated for 2 Grammys for “Hold My Hand” and the Top Gun: Maverick Sountrack with my fellow composers.  It’s a real dream to be included in this celebration of music with a song and musical theme so close to my heart thank you ❤️", "", "1700075160", "a9890d6a78a344ec87401cdb85e38a14", "2,570", "7,112", "50,000", "");
INSERT INTO tweets VALUES("c15dcee2f0134df497fe0e14b81248da", "I love you little monsters, forever xoxo, Mother Monster #WeLoveYouGaga #ChromaticaBallMiami I’m sorry I used my best judgment, it wasn’t safe.", "", "1695028860", "a9890d6a78a344ec87401cdb85e38a14", "2,700", "5,863", "50,400", "");
INSERT INTO tweets VALUES("23167c94fd8047f49a6b849b3929fca1", "Joker: Folie à Deux 10.04.24", "dc64f45b25144a479d2013ef2f324a49.jpg", "1691172060", "a9890d6a78a344ec87401cdb85e38a14", "6,586", "81,800", "232,600", "6,8M");
INSERT INTO tweets VALUES("2e081c561ce84092aeb7a945fb8d2571", "", "ace24fd7594c4b9da451592cff2a5b0b.jpg", "1690808220", "a9890d6a78a344ec87401cdb85e38a14", "1,443", "4,787", "52,500", "");
INSERT INTO tweets VALUES("a39f6685b73c49cb874e6d8965ee1663", "That’s a wrap ❤️‍🔥 🎬🃏 X, Harleen", "5b3ebbafe0ce45f2ba29d180d9b1bd17.jpg", "1680748020", "a9890d6a78a344ec87401cdb85e38a14", "4,544", "47,500", "325,600", "");
INSERT INTO tweets VALUES("e5fe564feed0433bb22aa31f3ba692c4", "#Oscars 2023 🖤 @tiffanyandco @hauslabs", "45bafefb34eb445eab7fbdb7861bb9ca.jpg", "1678734420", "a9890d6a78a344ec87401cdb85e38a14", "1,871", "10,000", "72,300", "");

INSERT INTO tweets VALUES("2e081c561ce84092aeb7a945fb8d2572", "Elon tweet", "", "1690808220", "ebb0d9d74d6c4825b3e1a1bcd73ff49a", "1", "2", "3", "4");

CREATE INDEX idx_tweets_tweet_image ON tweets(tweet_image);




-- ##############################
-- TRENDS
DROP TABLE IF EXISTS trends;
CREATE TABLE trends(
    trend_id                    TEXT,
    trend_category              TEXT DEFAULT 0,
    trend_title                 TEXT NOT NULL,
    trend_total_tweets          TEXT DEFAULT 0,
    PRIMARY KEY(trend_id)
) WITHOUT ROWID;

-- Trend 1
INSERT INTO trends VALUES("d3ea0d1356f442cb9e053bb6bd11fc5d", "Trending", "Eurovision#2023", "3933");
INSERT INTO trends VALUES("4e28250936994e3aa3b44f9766b772a2", "Trending", "ChatGPT", "98300");
INSERT INTO trends VALUES("e82d45d90d3a43cfb43b3d5d09c42baf", "Entertainment · Trending", "#Oscars", "22800");
INSERT INTO trends VALUES("5d9ab494d3c541b39047f9672689ef06", "Entertainment · Trending", "Women Talking", "13100");
INSERT INTO trends VALUES("dd637547eb0e4ea5b2385f5894c72e06", "Trending in Denmark", "Danish", "6388");


-- ##############################
-- JOIN TABLES USERS & TWEETS
SELECT * FROM users JOIN tweets ON user_id = tweet_user_fk;

DROP VIEW IF EXISTS users_and_tweets;
CREATE VIEW users_and_tweets AS 
SELECT * FROM users JOIN tweets ON user_id = tweet_user_fk;

SELECT * FROM users_and_tweets;