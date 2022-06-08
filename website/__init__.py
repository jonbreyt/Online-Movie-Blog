from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy 
from website import secure


db = SQLAlchemy() 

def create_app():
    app = Flask(__name__) 
    app.config['SECRET_KEY'] = 'fasdfedfasfsdfsddfsds'
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://{0}:{1}@{2}/{3}".format(secure.user, secure.passwd, secure.host, secure.name)
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False 
    db = SQLAlchemy(app) 
    db.init_app(app) 

    from .views import views 
    from .auth import auth 

    app.register_blueprint(views, url_prefix = '/')
    app.register_blueprint(auth, url_prefix = '/')

    from .models import User, Contents

    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app) 

    @login_manager.user_loader
    def load_user(id):
        return User.query.get(int(id))
    return app 
