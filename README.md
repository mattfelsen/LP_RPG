## Software
- Storage: MySQL
- Backend: Python, Flask, SQLAlchemy
- Frontend: Bootstrap, Velocity.js, jQuery/Zepto

Notes

Install pip & virtualenv if the machine doesn't have them

	sudo easy_install pip
	sudo pip install virtualenv

Set up environment, install Flask & other modules
	
	mkdir project && cd project
	virtualenv venv
	. venv/bin/activate
	pip install flask
	pip install flask-sqlalchemy
	pip install pymysql

## Routes for Views

Endpoint | Request | Description
-|-|-
/admin | Browser | Admin interface
/game | Browser | Main game page for users
/game/begin | AJAX | Returns a random set of questions for a new round


## Resources & REST Routes

### Questions

- id
- question

Method | Route | Action
-|-|-
GET | /questions | list all questions
GET | /questions/<int:id> | list specifc question and its associated token values
POST | /questions | create a new question
PUT | /questions/<int:id> | edit an question
DELETE | /questions/<int:id> | delete a question

### Tokens

- id
- name

Method | Route | Action
-|-|-
GET | /tokens | list all tokens
GET | /tokens/<int:id> | list specifc token
POST | /tokens | create a new token
PUT | /tokens/<int:id> | edit a token
DELETE | /tokens/<int:id> | delete a token


### Token Values

- id
- token_id
- question_id
- yes_points
- no_points

Method | Route | Action
-|-|-
GET | /token_values | list all tokens
GET | /token_values/<int:id> | list points for a specifc question
POST | /token_values | create a new set of values
PUT | /token_values/<int:id> | edit a set of values
DELETE | /token_values/<int:id> | delete a set of values


### Settings

- id
- key
- value

Method | Route | Action
-|-|-
GET | /tokens | list all tokens
GET | /tokens/<int:id> | list specifc token
POST | /tokens | create a new token
PUT | /tokens/<int:id> | edit a token
DELETE | /tokens/<int:id> | delete a token
