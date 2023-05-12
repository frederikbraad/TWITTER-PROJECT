from bottle import default_app, get, post, run, request, response, static_file, template
import git
import sqlite3
import pathlib
import dbconnection
import os
 
@post('/secret_url_for_git_hook')
def git_update():
  repo = git.Repo('./TWITTER-PROJECT')
  origin = repo.remotes.origin
  repo.create_head('main', origin.refs.main).set_tracking_branch(origin.refs.main).checkout()
  origin.pull()
  return "Everything ok"
 
##############################
@get("/images/<filename:re:.*\.webp>")
def _(filename):
    return static_file(filename, root="./images")

@get("/images/<filename:re:.*\.png>")
def _(filename):
    return static_file(filename, root="./images")

@get("/images/<filename:re:.*\.jpg>")
def _(filename):
    return static_file(filename, root="./images")


@get("/")
def index():
  try:
    db = dbconnection.db()
    tweets = db.execute("SELECT * FROM tweets")
    trends = db.execute("SELECT * FROM trends")
    users = db.execute("SELECT * FROM users")
    users_and_tweets = db.execute("SELECT * FROM users_and_tweets")
    user_cookie = request.get_cookie("user")
   

    return template("index", title="Twitter", tweets=tweets, trends=trends, users=users, users_and_tweets=users_and_tweets, user_cookie=user_cookie)

  except Exception as ex:
    print(ex)
    response.status = 400
    return {"error index": str(ex)}

  finally:
    if "db" in locals(): db.close()

##############################

@get("/app.css")
def _():
    return static_file("app.css", root=".")

##############################

import routers.signup
import routers.login
import routers.logout
import routers.profile

##############################

try:
  import production
  application = default_app()
except Exception as ex:
  print("Running local server")
  run(host="127.0.0.1", port=3000, debug=True, reloader=True)