from data import load_data
from custom_exceptions import TodoNotFound

data = load_data()


def get_all_todos():
    return data


def get_todo_by_id(id: int):
    it = filter(lambda todo: id == todo["id"], data)
    try:
        return next(it)
    except StopIteration:
        raise TodoNotFound()
