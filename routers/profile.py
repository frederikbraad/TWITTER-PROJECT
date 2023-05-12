from bottle import post, request, response, get, template
from dotenv import load_dotenv
import os
import dbconnection


# @get("/<id>")
# def index(id):
#   db = dbconnection.db()
#   load_dotenv('.env')
#   user = request.get_cookie("user", secret=os.getenv('MY_SECRET'))
#   user_id = user["id"]

#   userProfile = db.execute("SELECT * FROM users WHERE id = ? LIMIT 1", (user_id,)).fetchone()
#   print("Is it the right profile?", userProfile)
#   return template("profile", userProfile=userProfile)


@get("/<username>")
# @view("profile")
def _(username):
  try:
    db = dbconnection.db()
    user = db.execute("SELECT * FROM users WHERE user_name=? COLLATE NOCASE",(username,)).fetchall()[0]
    username = user["user_name"]
    print(username)
    users_and_tweets = db.execute("SELECT * FROM users_and_tweets")
    users = db.execute("SELECT * FROM users")
    trends = db.execute("SELECT * FROM trends")

    # tweets = db.execute("SELECT * FROM tweets WHERE user_fk=?", (user_id,)).fetchall()
  
    return template("profile", title="profile", user=user, users_and_tweets=users_and_tweets, users=users, trends=trends)
  except Exception as ex:
    print(ex)
    return "error"
  finally:
    if "db" in locals(): db.close()

