from flask import Flask, render_template, jsonify
import os
import mysql.connector
from dotenv import load_dotenv

# טעינת משתני הסביבה מקובץ .env
load_dotenv()

app = Flask(__name__)

# קריאת משתני הסביבה
db_config = {
    'host': os.getenv('MYSQL_HOST'),
    'user': os.getenv('MYSQL_USER'),
    'password': os.getenv('MYSQL_PASSWORD'),
    'database': os.getenv('MYSQL_DATABASE')
}

@app.route('/')
def display_images():
    try:
        # התחברות למסד הנתונים
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()

        # עדכון מונה המבקרים
        cursor.execute("UPDATE visitors SET visit_count = visit_count + 1 WHERE id = 1")
        cnx.commit()

        # בדיקת המונה
        cursor.execute("SELECT visit_count FROM visitors WHERE id = 1")
        visit_count = cursor.fetchone()[0]

        # שאילתת ה-SQL לשליפת תמונה אקראית
        cursor.execute("SELECT image_url FROM images ORDER BY RAND() LIMIT 1")
        result = cursor.fetchone()

        # בדיקת תוצאה
        image_url = result[0] if result else None

        # סגירת ההתחברות למסד הנתונים
        cursor.close()
        cnx.close()

        # העברת ה-URL לתבנית להציג אותו
        return render_template('index.html', image_url=image_url, visit_count=visit_count)

    except mysql.connector.Error as err:
        return jsonify({"error": f"Database error: {err}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {e}"}), 500

if __name__ == "__main__":
    port = int(os.getenv("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
