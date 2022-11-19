import json
from typing import List, Dict


def load_data() -> List[Dict[str, str]]:
    with open('data.json', 'r') as f:
        contents = f.read()
        data = json.loads(contents)
    return data
