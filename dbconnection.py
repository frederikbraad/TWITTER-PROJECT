from bottle import request, response
import re
import sqlite3
import pathlib 

##############################
def dict_factory(cursor, row):
  col_names = [col[0] for col in cursor.description]
  return {key: value for key, value in zip(col_names, row)}

##############################
def db():
  try:
    db = sqlite3.connect(str(pathlib.Path(__file__).parent.resolve())+"/twitter.db") 
    db.row_factory = dict_factory
    return db
  except Exception as ex:
    print(ex)
  finally:
    pass

##############################
#Email Validation

EMAIL_MIN = 6
EMAIL_MAX = 100
EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

def validate_email():
  error = f"User email is not valid"
  email = request.forms.get("email", "")
  print(email)
  email = email.strip()
  if len(email) < EMAIL_MIN:
    response.status = 400 
    raise Exception(error)
  if len(email) > EMAIL_MAX: 
    response.status = 400
    raise Exception(400, error)
  if not re.match(EMAIL_REGEX, email): 
    response.status = 400
    raise Exception(error)
  return email

##############################
#Username Validation

USERNAME_MIN = 4
USERNAME_MAX = 15
USERNAME_REGEX = "^[a-z0-9_]{4,15}$"

def validate_username():
	error = f"Your username has to be at least {USERNAME_MIN} to {USERNAME_MAX} lowercased english letters"
	username = request.forms.get("username", "")
	username = username.strip()
	if not re.match(USERNAME_REGEX, username): raise Exception(400, error)
	return username

##############################
#Password Validation

PASSWORD_MIN = 10
PASSWORD_MAX = 128
PASSWORD_REGEX = "^[a-z0-9]{10,128}$"

def validate_password():
  error = f"Your password must be between {PASSWORD_MIN} to {PASSWORD_MAX} characters long"
  password = request.forms.get("password", "")
  password = password.strip()
  if len(password) < PASSWORD_MIN:
    response.status = 400
    raise Exception(error)
  if len(password) > PASSWORD_MAX: raise Exception(400, error)
  if not re.match(PASSWORD_REGEX, password): raise Exception(400, error)
  return password

##############################
#Confirm Password Validation

def validate_confirm_password():
  error = "Password does not match"
  password = request.forms.get("password")
  confirm_password = request.forms.get("confirm_password")
  password = password.strip()
  confirm_password = confirm_password.strip()
  if confirm_password != password:
    response.status = 400 
    raise Exception(error)
  return confirm_password

