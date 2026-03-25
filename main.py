from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional, List
import sqlite3
import time

app = FastAPI()

# DB setup
conn = sqlite3.connect("tasks.db", check_same_thread=False)
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT,
    due_date TEXT,
    status TEXT,
    blocked_by INTEGER
)
""")
conn.commit()


# Schema
class Task(BaseModel):
    title: str
    description: str
    due_date: str
    status: str
    blocked_by: Optional[int] = None


# CREATE
@app.post("/tasks")
def create_task(task: Task):
    time.sleep(2)  # simulate delay
    cursor.execute("""
        INSERT INTO tasks (title, description, due_date, status, blocked_by)
        VALUES (?, ?, ?, ?, ?)
    """, (task.title, task.description, task.due_date, task.status, task.blocked_by))
    conn.commit()
    return {"message": "Task created"}


# READ
@app.get("/tasks")
def get_tasks():
    cursor.execute("SELECT * FROM tasks")
    rows = cursor.fetchall()
    return rows


# UPDATE
@app.put("/tasks/{task_id}")
def update_task(task_id: int, task: Task):
    time.sleep(2)
    cursor.execute("""
        UPDATE tasks
        SET title=?, description=?, due_date=?, status=?, blocked_by=?
        WHERE id=?
    """, (task.title, task.description, task.due_date, task.status, task.blocked_by, task_id))
    conn.commit()
    return {"message": "Updated"}


# DELETE
@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    cursor.execute("DELETE FROM tasks WHERE id=?", (task_id,))
    conn.commit()
    return {"message": "Deleted"}