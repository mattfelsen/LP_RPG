from flask import Flask, jsonify, render_template, request
from flask.ext.sqlalchemy import SQLAlchemy
from sqlalchemy import func

app = Flask(__name__)
app.debug = True
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost:8889/lp_rpg'

db = SQLAlchemy(app)


#############
### VIEWS ###
#############

@app.route('/')
def hello():
    return 'Sup'

@app.route('/admin', methods=['GET'])
def admin():
    return render_template('admin.html')

@app.route('/game', methods=['GET'])
def game():
    return render_template('game.html')

@app.route('/game/begin', methods=['GET'])
def game_begin():

    # Grab the number of questions per round from settings and fetch a random batch of questions
    limit = Setting.query.filter_by(key='questions_per_round').first().value
    results = Question.query.order_by(func.rand()).limit(limit).all()

    items = []
    for row in results:

        # Build a list of tokens (names, points, IDs, etc.) for the given question
        tokens = []
        for tv in row.tokens:
            token = {
                'token_id': tv.token.id,
                'token_value_id': tv.id,
                'name': tv.token.name,
                'yes_points': tv.yes_points,
                'no_points': tv.no_points
            }
            tokens.append(token)

        data = {
            'id': row.id,
            'question': row.question,
            'tokens': tokens
        }
        items.append(data)

    return jsonify(items=items)


################################
### RESOURCES & REST ROUTES ###
################################

### QUESTIONS ###

class Question(db.Model):
    __tablename__ = 'questions'
    id = db.Column(db.Integer, primary_key = True)
    question = db.Column(db.String(255))
    tokens = db.relationship('TokenValue')

@app.route('/questions', methods=['GET', 'POST', 'PUT', 'DELETE'])
def questions():
    if request.method == 'GET':
        results = Question.query.all()
        items = []

        for row in results:

            # Build a list of tokens (names, points, IDs, etc.) for the given question
            tokens = []
            for tv in row.tokens:
                token = {
                    'token_id': tv.token.id,
                    'token_value_id': tv.id,
                    'name': tv.token.name,
                    'yes_points': tv.yes_points,
                    'no_points': tv.no_points
                }
                tokens.append(token)

            data = {
                'id': row.id,
                'question': row.question,
                'tokens': tokens
            }
            items.append(data)

        return jsonify(items=items)

    if request.method == 'POST':
        return 'POST /questions'
    if request.method == 'PUT':
        return 'PUT /questions'
    if request.method == 'DELETE':
        return 'DELETE /questions'

@app.route('/questions/<int:id>', methods=['GET', 'POST', 'PUT', 'DELETE'])
def questions_id(id):
    if request.method == 'GET':
        return 'GET /questions/%d' %  id
    if request.method == 'POST':
        return 'POST /questions/%d' %  id
    if request.method == 'PUT':
        return 'PUT /questions/%d' %  id
    if request.method == 'DELETE':
        return 'DELETE /questions/%d' %  id



### TOKENS ###

class Token(db.Model):
    __tablename__ = 'tokens'
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(255))

@app.route('/tokens', methods=['GET', 'POST', 'PUT', 'DELETE'])
def tokens():
    if request.method == 'GET':
        results = Token.query.all()
        items = []

        for row in results:
            data = {
                'id': row.id,
                'name': row.name
            }
            items.append(data)

        return jsonify(items=items)



### TOKEN VALUES ###

class TokenValue(db.Model):
    __tablename__ = 'token_values'
    id = db.Column(db.Integer, primary_key = True)
    question_id = db.Column(db.Integer, db.ForeignKey('questions.id'), primary_key=True)
    token_id = db.Column(db.Integer, db.ForeignKey('tokens.id'), primary_key=True)
    yes_points = db.Column(db.Integer)
    no_points = db.Column(db.Integer)

    question = db.relationship('Question')
    token = db.relationship('Token', backref='token')

@app.route('/token_values', methods=['GET', 'POST', 'PUT', 'DELETE'])
def token_values():
    if request.method == 'GET':
        results = TokenValue.query.all()
        items = []

        for row in results:
            data = {
                'id': row.id,
                'question_id': row.question_id,
                'token_id': row.token_id,
                'yes_points': row.yes_points,
                'no_points': row.no_points
            }
            items.append(data)

        return jsonify(items=items)



### SETTINGS ###

class Setting(db.Model):
    __tablename__ = 'settings'
    id = db.Column(db.Integer, primary_key = True)
    key = db.Column(db.String(255))
    value = db.Column(db.Text)
    description = db.Column(db.String(255))

@app.route('/settings', methods=['GET', 'POST', 'PUT', 'DELETE'])
def settings():
    if request.method == 'GET':
        results = Setting.query.all()
        items = []

        for row in results:
            data = {
                'id': row.id,
                'key': row.key,
                'value': row.value,
                'description': row.description
            }
            items.append(data)

        return jsonify(items=items)


if __name__ == '__main__':
    app.run()
