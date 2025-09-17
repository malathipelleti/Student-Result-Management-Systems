import sqlite3

# Connect to database (creates file if not exists)
conn = sqlite3.connect("student_results.db")
cursor = conn.cursor()

# Create table
cursor.execute("""
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    roll_no TEXT UNIQUE NOT NULL,
    marks INTEGER NOT NULL,
    grade TEXT
)
""")
conn.commit()

# Function to calculate grade
def calculate_grade(marks):
    if marks >= 90:
        return "A+"
    elif marks >= 75:
        return "A"
    elif marks >= 60:
        return "B"
    elif marks >= 40:
        return "C"
    else:
        return "F"

# Add student
def add_student(name, roll_no, marks):
    grade = calculate_grade(marks)
    cursor.execute("INSERT INTO students (name, roll_no, marks, grade) VALUES (?, ?, ?, ?)", 
                   (name, roll_no, marks, grade))
    conn.commit()
    print(f"✅ Student {name} added successfully!")

# View all students
def view_students():
    cursor.execute("SELECT * FROM students")
    for row in cursor.fetchall():
        print(row)

# Update marks
def update_marks(roll_no, new_marks):
    grade = calculate_grade(new_marks)
    cursor.execute("UPDATE students SET marks=?, grade=? WHERE roll_no=?", 
                   (new_marks, grade, roll_no))
    conn.commit()
    print("✅ Marks updated successfully!")

# Delete student
def delete_student(roll_no):
    cursor.execute("DELETE FROM students WHERE roll_no=?", (roll_no,))
    conn.commit()
    print("✅ Student deleted successfully!")

# CLI menu
while True:
    print("\n📘 Student Results Management System")
    print("1. Add Student")
    print("2. View Students")
    print("3. Update Marks")
    print("4. Delete Student")
    print("5. Exit")

    choice = input("Enter choice: ")

    if choice == "1":
        name = input("Enter name: ")
        roll_no = input("Enter roll no: ")
        marks = int(input("Enter marks: "))
        add_student(name, roll_no, marks)

    elif choice == "2":
        view_students()

    elif choice == "3":
        roll_no = input("Enter roll no: ")
        marks = int(input("Enter new marks: "))
        update_marks(roll_no, marks)

    elif choice == "4":
        roll_no = input("Enter roll no: ")
        delete_student(roll_no)

    elif choice == "5":
        print("👋 Exiting...")
        break

    else:
        print("❌ Invalid choice! Try again.")
