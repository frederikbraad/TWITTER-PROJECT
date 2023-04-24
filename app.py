from bottle import default_app, get, post, run, template
import sqlite3
import git

# converts toggles in the terminal to json objects
def dict_factory(cursor, row):
  col_names = [col[0] for col in cursor.description]
  return {key: value for key, value in zip(col_names, row)}

@post('/secret_url_for_git_hook')
def git_update():
  repo = git.Repo('./TWITTER-PROJECT')
  origin = repo.remotes.origin
  repo.create_head('main', origin.refs.main).set_tracking_branch(origin.refs.main).checkout()
  origin.pull()
  return ""

@get('/')
def _():
    try:
        # connect to database
        db = sqlite3.connect("company.db")
        # to make toggles into dictionaries/json objects
        db.row_factory = dict_factory
        # selecting and fetching all users
        users = db.execute("SELECT * FROM users").fetchall()
        print(users)
        return template("index", users=users)
    except Exception as e:
        print(e)
    finally:
        if "db" in locals(): db.close()

@get('/')
def _():
  return "Hello"


import apis.api_delete_user
import apis.api_get_latest_tweets


############ connecting to python anywhere or running locally

try:
  import production
  application = default_app()
except Exception as ex:
  print("Running local server")
  run(host="127.0.0.1", port=4756, debug=True, reloader=True)