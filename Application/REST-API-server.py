from flask import Flask, render_template, request, flash, redirect, url_for, session
import mysql.connector
import random
from flask_wtf import FlaskForm
from wtforms import PasswordField, validators
import datetime

dbLogin = mysql.connector.connect(
        host="localhost",
        user="root",
        password="password",
        database="exitcode0",
)

mycursor = dbLogin.cursor()

app = Flask(__name__)
app.secret_key = 'exit_code_zero'

class SignupForm(FlaskForm):
    pword = PasswordField('password', [
        validators.Length(min=8, message="Password must be at least 8 characters long"),
        validators.Regexp(regex=".*[A-Z].*", message="Password must contain at least one uppercase letter"),
        validators.Regexp(regex=".*\d.*", message="Password must contain at least one digit"),
        validators.Regexp(regex=".*[!@#$%^&*()].*", message="Password must contain at least one special character")
    ])

@app.route("/")
def homePage():
    imageList = [
        "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt0c8e345c55387805/642f2be466181410a57330e1/UI_Features_1.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://images.metadata.sky.com/pd-image/0de42730-9615-487e-bc46-af8fc3e6f6f7/background/1300",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt6405572ccf724995/642f2bf42cf9c710750b57c4/UI_Features_2.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt38a3a6bfc37ad421/642f2c130c498f10e8dbd450/UI_Features_4.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/bltb3af87e54b3df659/63eced2e0841b256b996bb8d/Sky_F1_Template_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt5f086e55623a39eb/641309b52cd1b20faa95d55b/Sky_Golf_Drama_Awaits_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt5cae5cb3dc6fe2a3/63f8bf034d5a1946d3dd8210/332335_Complete_BYO_Desktop.jpg.jpg?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=600",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/bltea6e10734a7d2767/63e4dead28f76b08b0bad6e2/MYSKY_Cinema_TopGun.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=600",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt20b35b9d9227b62d/641316da881a4f095f7a44c1/Sky_atlantic_Succession_S4_Rail1_1_still_CarouselKeyArt_desktop_1400x788.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/bltd673a466ebabcfb7/63f4e673e8dab560ccbafe4a/TVPage_Rail1_ToPicks_A_Town_Called_Malice_CarouselKeyArt_Dekstop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt3ff6e3fcc227449e/6422b685167b14113bededad/SKYSTORE_RAIL06_Avatar2_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt02751ef90964d69e/6450ee98b7b7332b233e4e5d/Sky_Netflix_Rail4_The_Mother_CarouselKeyArt_desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blte946d9f4aa73034e/6448ea4ad0a4771107c6c47e/WTW_RAIL2_CoronationSeries_Paddington_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt4dc4a37db4c60ab0/603d7b5a8c3454716c325122/TVPage_Channels_SkyATLANTIC_CardKeyArt_Desktop_16x9.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt605adad1955b8193/603d7b6ca97214595a4a4a8e/TVPage_Channels_SkyARTS_CardKeyArt_Desktop_16x9.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt8f397354fd7d1db9/6399f5f9447ad711c23d99e6/TVPage_Rail1_ToPicks_Predators_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt5ab2ba7395fdac40/6332bfdaf709a318104f8be6/TVPage_Rail1_ToPicks_GOL_CarouselKeyArt_Desktop_(1).png?imageManager=true&impolicy=resize&width=1400",
    ]
    image = random.choice(imageList)
    return render_template("login", image = image)

@app.route("/login", methods=["POST"])
def login():
    uName = request.form["uName"]
    password = request.form["password"]
    sqlCheckQuery = "SELECT first_name FROM users2 WHERE user_name = %s AND password = %s"
    mycursor.execute(sqlCheckQuery, (uName, password))
    user = mycursor.fetchone()[0]
    if user:
        session["user_id"] = user[1]
        session["name"] = user[0]
        session["user"] = user
        return redirect(url_for("landingPage"))
    else:
        flash("Invalid username or password")
        return redirect(url_for("homePage"))

@app.route("/landing")
def landingPage():
    imageList = [
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt0c8e345c55387805/642f2be466181410a57330e1/UI_Features_1.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://images.metadata.sky.com/pd-image/0de42730-9615-487e-bc46-af8fc3e6f6f7/background/1300",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt6405572ccf724995/642f2bf42cf9c710750b57c4/UI_Features_2.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt38a3a6bfc37ad421/642f2c130c498f10e8dbd450/UI_Features_4.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/bltb3af87e54b3df659/63eced2e0841b256b996bb8d/Sky_F1_Template_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt5f086e55623a39eb/641309b52cd1b20faa95d55b/Sky_Golf_Drama_Awaits_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt5cae5cb3dc6fe2a3/63f8bf034d5a1946d3dd8210/332335_Complete_BYO_Desktop.jpg.jpg?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=600",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/bltea6e10734a7d2767/63e4dead28f76b08b0bad6e2/MYSKY_Cinema_TopGun.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=600",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt20b35b9d9227b62d/641316da881a4f095f7a44c1/Sky_atlantic_Succession_S4_Rail1_1_still_CarouselKeyArt_desktop_1400x788.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/bltd673a466ebabcfb7/63f4e673e8dab560ccbafe4a/TVPage_Rail1_ToPicks_A_Town_Called_Malice_CarouselKeyArt_Dekstop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt3ff6e3fcc227449e/6422b685167b14113bededad/SKYSTORE_RAIL06_Avatar2_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt02751ef90964d69e/6450ee98b7b7332b233e4e5d/Sky_Netflix_Rail4_The_Mother_CarouselKeyArt_desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blte946d9f4aa73034e/6448ea4ad0a4771107c6c47e/WTW_RAIL2_CoronationSeries_Paddington_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt4dc4a37db4c60ab0/603d7b5a8c3454716c325122/TVPage_Channels_SkyATLANTIC_CardKeyArt_Desktop_16x9.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt605adad1955b8193/603d7b6ca97214595a4a4a8e/TVPage_Channels_SkyARTS_CardKeyArt_Desktop_16x9.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt8f397354fd7d1db9/6399f5f9447ad711c23d99e6/TVPage_Rail1_ToPicks_Predators_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt5ab2ba7395fdac40/6332bfdaf709a318104f8be6/TVPage_Rail1_ToPicks_GOL_CarouselKeyArt_Desktop_(1).png?imageManager=true&impolicy=resize&width=1400",
    ]
    image = random.choice(imageList)

    if "user_id" in session:
        user_id = session["user_id"]
        name = session["name"]
        user = session["user"]
        return render_template("landingPage", name = user, image=image, data = request.form)
    else:
        return redirect(url_for("homePage"))

@app.route("/logout")
def logout():
        session.clear()
        return redirect("/")
def logout():
    return render_template("login")

@app.route("/newuser", methods=["POST"])
def created_user():
    form = SignupForm()
    fname = request.form["firstname"]
    lname = request.form["lastname"]
    email = request.form["email"]
    password = request.form["pword"]
    if not form.pword.validate(password):
        flash(f'Invalid password: <br>' + ', '.join(form.pword.errors), 'error')
        return redirect(url_for("sign_up"))
    
    sqlAddUserQuery = "insert into users2 (first_name, last_name, email, password) values (%s, %s, %s, %s);"
    mycursor.execute(sqlAddUserQuery, (fname, lname, email, password))
    dbLogin.commit()
    sqlFindUserQuery = "SELECT user_name FROM users2 WHERE last_name = %s AND email = %s AND password = %s"
    mycursor.execute(sqlFindUserQuery, (lname, email, password))
    name = mycursor.fetchone()[0]
    
    flash(f'Account created successfully! Your user ID is: <b> {name} </b>', 'success')
    return redirect(url_for("homePage"))

@app.route("/newuser")
def sign_up():
    imageList = [
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt0c8e345c55387805/642f2be466181410a57330e1/UI_Features_1.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://images.metadata.sky.com/pd-image/0de42730-9615-487e-bc46-af8fc3e6f6f7/background/1300",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt6405572ccf724995/642f2bf42cf9c710750b57c4/UI_Features_2.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt38a3a6bfc37ad421/642f2c130c498f10e8dbd450/UI_Features_4.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/bltb3af87e54b3df659/63eced2e0841b256b996bb8d/Sky_F1_Template_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt5f086e55623a39eb/641309b52cd1b20faa95d55b/Sky_Golf_Drama_Awaits_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/blt5cae5cb3dc6fe2a3/63f8bf034d5a1946d3dd8210/332335_Complete_BYO_Desktop.jpg.jpg?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=600",
    "https://static.skyassets.com/contentstack/assets/bltff3fe8a60eb589eb/bltea6e10734a7d2767/63e4dead28f76b08b0bad6e2/MYSKY_Cinema_TopGun.png?access_token=cs5bad98cfc77384c6e0789f74&environment=production&imageManager=true&impolicy=resize&width=600",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt20b35b9d9227b62d/641316da881a4f095f7a44c1/Sky_atlantic_Succession_S4_Rail1_1_still_CarouselKeyArt_desktop_1400x788.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/bltd673a466ebabcfb7/63f4e673e8dab560ccbafe4a/TVPage_Rail1_ToPicks_A_Town_Called_Malice_CarouselKeyArt_Dekstop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt3ff6e3fcc227449e/6422b685167b14113bededad/SKYSTORE_RAIL06_Avatar2_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt02751ef90964d69e/6450ee98b7b7332b233e4e5d/Sky_Netflix_Rail4_The_Mother_CarouselKeyArt_desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blte946d9f4aa73034e/6448ea4ad0a4771107c6c47e/WTW_RAIL2_CoronationSeries_Paddington_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt4dc4a37db4c60ab0/603d7b5a8c3454716c325122/TVPage_Channels_SkyATLANTIC_CardKeyArt_Desktop_16x9.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt605adad1955b8193/603d7b6ca97214595a4a4a8e/TVPage_Channels_SkyARTS_CardKeyArt_Desktop_16x9.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt8f397354fd7d1db9/6399f5f9447ad711c23d99e6/TVPage_Rail1_ToPicks_Predators_CarouselKeyArt_Desktop.png?imageManager=true&impolicy=resize&width=1400",
    "https://static.skyassets.com/contentstack/assets/blt292fe19f56d1a1a8/blt5ab2ba7395fdac40/6332bfdaf709a318104f8be6/TVPage_Rail1_ToPicks_GOL_CarouselKeyArt_Desktop_(1).png?imageManager=true&impolicy=resize&width=1400",
    ]
    image = random.choice(imageList)
    return render_template("newUser", image = image)

@app.route("/jobsummary/<date>", methods=["GET","POST"])
def job_list(date):
    if request.method == "POST":
        date = request.form['date']
    else:
        date = datetime.date.today().strftime("%Y-%m-%d")

    sqlFindDetailsQuery = "SELECT * from jobs where date = %s"
    mycursor.execute(sqlFindDetailsQuery, (date,))
    jobs = mycursor.fetchall()

    return render_template("jobsummary", date=date, jobs=jobs)

@app.route("/jobdetail/<jobref>", methods=["GET","POST"])
def job_detail(jobref):
    sqlFindJobDetailsQuery = "SELECT * from jobs where jobref = %s"
    mycursor.execute(sqlFindJobDetailsQuery, (jobref,))
    jobs = mycursor.fetchall()
    return render_template("jobdetail", jobs=jobs)

@app.route("/startjob/<job>", methods=["GET","POST"])
def start_job(job):
    sqlGetJobDetailsQuery = "SELECT * from jobs where jobref = %s"
    mycursor.execute(sqlGetJobDetailsQuery, (job,))
    this_job = mycursor.fetchall()
    return render_template("jobinprog", this_job=this_job)

@app.route("/complete/<job>", methods=["GET","POST"])
def job_completed(job):
    sqlCompleteJobQuery = "UPDATE jobs SET completed = 'Yes' WHERE jobref = %s"
    mycursor.execute(sqlCompleteJobQuery, (job,))
    dbLogin.commit()
    return redirect(url_for("start_job", job=job))

@app.route("/bandwidth")
def bwidth_calc():
    custbwidth = request.args.get('custbwidth')
    return render_template("bandwidth", custbwidth=custbwidth)

@app.route("/knowledgebase", methods=["GET","POST"])
def knowledge_base():
    return render_template("knowledgebase")

app.run(debug=True)