from bottle import delete, request, response
import sqlite3


# @post("/user") id comes in the form
# @get("/user/3")
# @delete("/user") id comes in the form
# @put("/user") id, name, lastname comes in the form

@delete('/user/<user_id>')
def _(user_id):
    try:
        db = sqlite3.connect('company.db')
        print(user_id)
        db.execute(f'DELETE FROM users WHERE user_id = ?', (user_id,)).rowcount
        db.commit()
        print(f"User {user_id} deleted successfully")
        return "All ok, deleted this one: " + user_id
    except Exception as ex:
        if 'db' in locals(): db.rollback()
        print(ex)
    finally:
        if "db" in locals(): db.close()