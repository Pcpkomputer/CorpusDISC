from flask import jsonify

class Admin:
    def __init__(self, email, password):
        self.email = email
        self.password = password