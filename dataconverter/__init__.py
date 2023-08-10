
'''Nazwy obiektów spoza diagramu klas na razie robocze (nie mogę wygrzebać dokumentacji z nazwami)
'''

import sqlite3
import json
import datetime

json data = {
    "message":{
        "mode": "PUT",
        "timestamp": datetime.date.now(),
        "id": 1,
        "uder_id":1,
        "content": "Well I tell you what you fat little cunt"
    }
}

text = "Dobazy"

class DataConverter:
    def __init__(self):
        print("Witam")

    def __del__(self):
        print("No na razie")

    '''def deserialize(data):'''
    def sendToDatabase(text):
        con = sqlite3.connect("test.db")
        cur = con.cursor()
        cur.execute("""
            INSERT INTO dupa VALUES
            ('tak','nie',20),
            ('nie','tak',15)
        """)
        con.commit()

klasa1 = DataConverter()

klasa1.sendToDatabase()


