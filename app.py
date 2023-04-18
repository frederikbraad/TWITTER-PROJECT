from bottle import default_app, get, post, run
import sqlite3

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
  return "Hello"


############ connecting to python anywhere or running locally

try:
  import production
  application = default_app()
except Exception as ex:
  print("Running local server")
  run(host="127.0.0.1", port=4756, debug=True, reloader=True)