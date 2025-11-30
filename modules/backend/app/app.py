from flask import Flask
import psycopg2
import os

app = Flask(__name__)

DB_PASSWORD = os.environ.get("POSTGRES_PASSWORD", "postgres")
DB_HOST = "db"

@app.route("/")
def hello():
    return "The Beauty of Perseverance!"

@app.route("/dbtest")
def dbtest():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            user="postgres",
            password=DB_PASSWORD,
            dbname="postgres"
        )
        conn.close()
        return {"db": "ok"}
    except Exception as e:
        return {"db": "error", "details": str(e)}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
