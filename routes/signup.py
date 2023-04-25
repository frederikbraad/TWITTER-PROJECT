from bottle import post, request, response
import dbconnection
import bcrypt
import uuid

@post("/signup")
def _():
  try:
    db = dbconnection.db()
    
    id = str(uuid.uuid4().hex)
    email = dbconnection.validate_email()
    username = dbconnection.validate_username()
    password = dbconnection.validate_password()
    dbconnection.validate_confirm_password()

    salt = bcrypt.gensalt()

    user = {
      "id" : id,
      "email": email,
      "username" : username,
      "password" : bcrypt.hashpw(password.encode('utf-8'), salt)
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




