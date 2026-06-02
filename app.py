from flask import Flask, render_template, request, redirect, url_for, flash, session
import mysql.connector
import os
import pandas as pd

app = Flask(__name__)
app.secret_key = "YOUR_OWN_API_KEY"

# MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",  # Use your MySQL username
    password="",  # Use your MySQL password
    database="ai_agent"
)
cursor = db.cursor()

# Directory to store knowledge base files
UPLOAD_FOLDER = 'knowledge_base'
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


@app.route('/', methods=['GET', 'POST'])
def index():
    response = None
    user_query = None

    if request.method == 'POST':
        user_query = request.form['query']
        
        # Search the knowledge base in the database
        cursor.execute("SELECT answer FROM knowledge_base WHERE question LIKE %s", (f"%{user_query}%",))
        result = cursor.fetchone()
        
        if result:
            response = result[0]
        else:
            cursor.execute("SELECT error_message FROM settings LIMIT 1")
            error_message = cursor.fetchone()
            response = error_message[0] if error_message else "Sorry, I cannot find an answer to your query."
    
    return render_template('index.html', query=user_query, response=response)



@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor.execute("SELECT * FROM admins WHERE username = %s AND password = %s", (username, password))
        admin = cursor.fetchone()
        if admin:
            session['admin_id'] = admin[0]
            flash('Login successful!', 'success')
            return redirect(url_for('admin_dashboard'))
        else:
            flash('Invalid username or password', 'danger')
    return render_template('login.html')


@app.route('/logout')
def logout():
    session.pop('admin_id', None)
    flash('Logged out successfully.', 'success')
    return redirect(url_for('login'))


@app.route('/admin_dashboard', methods=['GET', 'POST'])
def admin_dashboard():
    if 'admin_id' not in session:
        flash('Please log in to access the dashboard.', 'danger')
        return redirect(url_for('/'))
    
    # Fetch the current error message
    cursor.execute("SELECT error_message FROM settings LIMIT 1")
    error_message = cursor.fetchone()
    error_message = error_message[0] if error_message else "No error message set."

    if request.method == 'POST':
        if 'knowledge_file' in request.files:
            # Handle Excel file upload
            file = request.files['knowledge_file']
            if file.filename.endswith('.xlsx'):
                file_path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
                file.save(file_path)
                # Save knowledge base content to the database
                save_excel_to_db(file_path)
                flash('Knowledge base file uploaded successfully!', 'success')
            else:
                flash('Please upload a valid Excel file.', 'danger')

        # Update error message
        if 'error_message' in request.form:
            new_error_message = request.form['error_message']
            cursor.execute("UPDATE settings SET error_message = %s WHERE id = 1", (new_error_message,))
            db.commit()
            flash('Error message updated successfully!', 'success')
    
    # List uploaded files
    files = os.listdir(app.config['UPLOAD_FOLDER'])
    return render_template('admin_dashboard.html', files=files, error_message=error_message)


def save_excel_to_db(file_path):
    """
    Reads the Excel file and saves its content into the knowledge_base table.
    """
    try:
        data = pd.read_excel(file_path)
        for index, row in data.iterrows():
            cursor.execute("INSERT INTO knowledge_base (question, answer) VALUES (%s, %s)", (row['Question'], row['Answer']))
        db.commit()
    except Exception as e:
        flash(f"Error saving Excel data to database: {str(e)}", 'danger')



if __name__ == '__main__':
    app.run(debug=True)
