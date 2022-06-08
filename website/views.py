from flask import Blueprint, render_template, request, flash
from flask_login import current_user

from .models import User, Contents, Science, News, Gaming, Other
from . import db 

views = Blueprint('views', __name__) 

@views.route('/', methods = ['GET', 'POST'])
def homepage():
    data = Contents.query.order_by(Contents.content_id).all()
    science = Science.query.order_by(Science.content_id).all() 
    news = News.query.order_by(News.content_id).all()
    gaming = Gaming.query.order_by(Gaming.content_id).all() 
    other = Other.query.order_by(Other.content_id).all()
    if request.method == 'POST': 
        flash("Please login to view content :)", category = "error") 
    return render_template("homepage.html", user = current_user, data = data, science = science, news = news, gaming = gaming, other = other) 
