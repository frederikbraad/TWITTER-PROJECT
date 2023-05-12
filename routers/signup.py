from bottle import post, request, response
import dbconnection
import bcrypt
import uuid
import time

@post("/signup")
def _():
  try:
    db = dbconnection.db()
    
    id = str(uuid.uuid4().hex)
    email = dbconnection.validate_email()
    username = dbconnection.validate_username()
    password = dbconnection.validate_password()
    dbconnection.validate_confirm_password()
    first_name = request.forms.get("first_name", "")
    last_name = request.forms.get("last_name", "")
    user_verified = request.forms.get("user_verified", "")
    user_avatar = request.forms.get("user_avatar", "default.jpg")
    user_cover = request.forms.get("user_cover", "default-cover.png")
    user_created_at = int(time.time())
    user_total_tweets = request.forms.get("user_total_tweets", "")
    user_total_following = request.forms.get("user_total_following", "")
    user_total_followers = request.forms.get("user_total_followers", "")

    salt = bcrypt.gensalt()

    user = {
      "id" : id,
      "username" : username,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password" : bcrypt.hashpw(password.encode('utf-8'), salt),
      "user_verified" : user_verified,
      "user_avatar" : user_avatar,
      "user_cover" : user_cover,
      "user_created_at" : user_created_at,
      "user_total_tweets" : user_total_tweets,
      "user_total_following" : user_total_following,
      "user_total_followers" : user_total_followers

    }

    values = ""
    for key in user:
        values = values + f":{key},"
    values = values.rstrip(",")
    print(values)

    db.execute(f"INSERT INTO users VALUES({values})", user).rowcount
    db.commit()

    return {"info": "Signup succesful!"}
  except Exception as e:
    print(e)
    return {"info":str(e)} # cast to string
  finally:
    if "db" in locals(): db.close()



