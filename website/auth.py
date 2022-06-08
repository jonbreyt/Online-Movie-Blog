
from flask import Blueprint, request, render_template, flash, redirect, url_for, session 
from flask_login import current_user, login_required, logout_user, login_user
from werkzeug.security import check_password_hash, generate_password_hash
from .models import User, Contents, Science, News, Gaming, Other, Fav
from . import db
import datetime


auth = Blueprint('auth', __name__)

@auth.route('/sign_up', methods = ['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        first_name = request.form.get('firstName')
        last_name = request.form.get('lastName')
        email = request.form.get('email')
        username = request.form.get('username')
        password = request.form.get('password')
        confirm_password = request.form.get('confirmPassword')

        user = User.query.filter_by(email=email).first()
        if user:
            flash('Email already is used by another user. Please use another one.', category = 'error')
        elif password != confirm_password:
            flash('Passwords do not match.', category = 'error') 
        else:
            new_user = User(email=email, firstName = first_name, lastName = last_name, username = username, password = generate_password_hash(password, method = 'sha256'))
            db.session.add(new_user)
            db.session.commit()
            login_user(new_user, remember = True) 
            return render_template("home.html", user = current_user) 
    return render_template("sign_up.html", user = current_user)

@auth.route('/login', methods = ['GET', 'POST'])
def login(): 
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        user = User.query.filter_by(email=email).first()
        if user:
            if check_password_hash(user.password, password):
                login_user(user, remember=True) 
                return redirect(url_for('auth.user_dashboard', user=current_user))
            else: 
                flash("Wrong login credentials", category = 'error')
        else: 
            flash('Email is not registered with us.', category = 'error')
    return render_template("login.html", user = current_user)

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for("views.homepage"))

@auth.route('/content_page', methods = ['GET', 'POST'])
def content_page():
    contents = Contents.query.get(session.get('id', None))
    if session.get('type', None) == "Science":
        contents = Science.query.get(session.get('id', None))
    elif session.get('type', None) == "News":
        contents = News.query.get(session.get('id', None))
    elif session.get('type', None) == "Gaming":
        contents = Gaming.query.get(session.get('id', None))
    elif session.get('type', None) == "Other":
        contents = Other.query.get(session.get('id', None))
    elif session.get('type', None) == "Favorites":
        contents = Fav.query.get(session.get('id', None))
    return render_template("content_page.html", user = current_user, content = contents)

@auth.route('/content_page', methods = ['GET', 'POST'])
def fav_page():
    if News.query.get(session.get('id', None)):
        news_content = News.query.get(session.get('id', None)) 
    elif Science.query.get(session.get('id', None)):
        science_content = Science.query.get(session.get('id', None))
    elif Gaming.query.get(session.get('id', None)):
        gaming_content = Gaming.query.get(session.get('id', None))
    elif Other.query.get(session.get('id', None)):
        other_content = Other.query.get(session.get('id', None))
    return render_template("content_page.html", user = current_user, news = news_content, science = science_content, gaming = gaming_content, other = other_content)

@auth.route('/posting_page', methods = ['GET', 'POST'])
def posting_page():
    if request.method == 'POST':
        title = request.form.get('title')
        introduction = request.form.get('introduction')
        body = request.form.get('body')
        conclusion = request.form.get('conclusion')
        reference = request.form.get('reference')
        contenttype = request.form.get('category')
        time = datetime.date.today() 

        if title and introduction and body and conclusion and reference:
            if contenttype == 'News':
                new_content = News(id = current_user.id, title = title, intro = introduction, time = time, body = body, conclusion = conclusion, reference = reference, contenttype = contenttype)
            elif contenttype == 'Science':    
                new_content = Science(id = current_user.id, title = title, intro = introduction, time = time, body = body, conclusion = conclusion, reference = reference, contenttype = contenttype)
            elif contenttype == 'Gaming':
                new_content = Gaming(id = current_user.id, title = title, intro = introduction, time = time, body = body, conclusion = conclusion, reference = reference, contenttype = contenttype)
            else:
                new_content = Other(id = current_user.id, title = title, intro = introduction, time = time, body = body, conclusion = conclusion, reference = reference, contenttype = contenttype)
            db.session.add(new_content)
            db.session.commit()
            flash("Posted!", category = "success") 
            return render_template("posting_page.html", user = current_user)
        else:
            flash("Error! Fill in a blank", category = "error")
    return render_template("posting_page.html", user = current_user)

@auth.route('/user_dashboard', methods = ['GET', 'POST'])
def user_dashboard():
    if request.method == "POST":
        view_type = request.form.get("view")
        session['type1'] = view_type
        return redirect(url_for("auth.user_dashbaord_view"))
    return render_template("user_dashboard.html", user = current_user) 

@auth.route('/user_dashbaord_view', methods = ['GET', 'POST'])
def user_dashbaord_view():
    if session.get('type1', None) == "Science":
        content = Science.query.filter_by(id = current_user.id).all()
        session['type2'] = "Science"
    elif session.get('type1', None) == "News":
        content = News.query.filter_by(id = current_user.id).all()
        session['type2'] = "News"
    elif session.get('type1', None) == "Gaming":
        content = Gaming.query.filter_by(id = current_user.id).all()
        session['type2'] = "Gaming"
    elif session.get('type1', None) == "Other":
        content = Other.query.filter_by(id = current_user.id).all()
        session['type2'] = "Other"
    elif session.get('type1', None) == "Favorites":
        content = Fav.query.filter_by(id = current_user.id).all()
        session['type2'] = "Favorites"
    if request.method == "POST":
        delete_id = request.form.get("delete")
        update_posting = request.form.get("edit")
        if session.get('type2', None) == "Science":
            if delete_id: 
                delete_from = Science.query.get(delete_id)
                db.session.delete(delete_from) 
                db.session.commit()
                flash("Deleted!", category = "success") 
                return redirect(url_for('auth.user_dashboard'))
            if update_posting:
                session['edit_id'] = update_posting
                return redirect(url_for('auth.update_posting'))
        elif session.get('type2', None) == "News":
            if delete_id: 
                delete_from = News.query.get(delete_id)
                db.session.delete(delete_from) 
                db.session.commit()
                flash("Deleted!", category = "success") 
                return redirect(url_for('auth.user_dashboard'))
        elif session.get('type2', None) == "Gaming":
            if delete_id: 
                delete_from = Gaming.query.get(delete_id)
                db.session.delete(delete_from) 
                db.session.commit()
                flash("Deleted!", category = "success") 
                return redirect(url_for('auth.user_dashboard'))
        elif session.get('type2', None) == "Other":
            if delete_id: 
                delete_from = Other.query.get(delete_id)
                db.session.delete(delete_from) 
                db.session.commit()
                flash("Deleted!", category = "success") 
                return redirect(url_for('auth.user_dashboard'))
    return render_template("user_dashbaord_view.html", user = current_user, content = content)

@auth.route('/update_posting', methods = ['GET', 'POST'])
def update_posting():
    if session.get('type2', None) == "Science":
        content = Science.query.get(session.get('edit_id', None))
    elif session.get('type2', None) == "News":
        content = News.query.get(session.get('edit_id', None))
    elif session.get('type2', None) == "Gaming":
        content = Gaming.query.get(session.get('edit_id', None))
    elif session.get('type2', None) == "Other": 
        content = Other.query.get(session.get('edit_id', None))
    if request.method == 'POST':
        content.title = request.form.get('title')
        content.intro = request.form.get('introduction')
        content.body = request.form.get('body')
        content.conclusion = request.form.get('conclusion')
        content.reference = request.form.get('reference')
        content.time = datetime.date.today() 
        db.session.commit()
        return redirect(url_for('auth.user_dashboard'))
    return render_template("update_posting.html", user = current_user, content = content) 

@auth.route('/science', methods = ['GET', 'POST'])
def science():
    content = Science.query.all();
    if request.method == "POST":
        session['id'] = request.form.get("viewmore")
        session['type'] = "Science"
        return redirect(url_for("auth.content_page")) 
    return render_template("science.html", user = current_user, content = content)

@auth.route('/gaming', methods = ['GET', 'POST'])
def gaming():
    content = Gaming.query.all();
    if request.method == "POST":
        session['id'] = request.form.get("viewmore")
        session['type'] = "Gaming"
        return redirect(url_for("auth.content_page")) 
    return render_template("gaming.html", user = current_user, content = content)

@auth.route('/news', methods = ['GET', 'POST'])
def news():
    content = News.query.all();
    if request.method == "POST":
        session['id'] = request.form.get("viewmore")
        session['type'] = "News"
        return redirect(url_for("auth.content_page")) 
    return render_template("news.html", user = current_user, content = content)

@auth.route('/other', methods = ['GET', 'POST'])
def other():
    content = Other.query.all();
    if request.method == "POST":
        session['id'] = request.form.get("viewmore")
        session['type'] = "Other"
        return redirect(url_for("auth.content_page")) 
    return render_template("other.html", user = current_user, content = content)