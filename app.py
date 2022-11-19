from flask import Flask, jsonify, make_response
from custom_exceptions import TodoNotFound
from dao import get_all_todos, get_todo_by_id

app = Flask(__name__)


@app.route('/todos')
def get_todos():
    return jsonify(get_all_todos())


@app.route('/todos/<int:id>')
def get_single_todo(id: int):
    try:
        todo = get_todo_by_id(id)
        return jsonify(todo)
    except TodoNotFound:
        response = make_response()
        response.status_code = 404
        return response
