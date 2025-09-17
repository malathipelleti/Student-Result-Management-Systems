import sqlite3

# Connect
conn = sqlite3.connect("student_results.db")
cursor = conn.cursor()

# Create table
cursor.execute("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, marks INTEGER)")
conn.commit()

# Insert
cursor.execute("INSERT INTO students (name, marks) VALUES (?, ?)", ("Rahul", 90))
conn.commit()

# Fetch
cursor.execute("SELECT * FROM students")
for row in cursor.fetchall():
    print(row)

# Close
conn.close()

-- DDL COMMANDS
-- -------------
-- CREATE-DATABASE,TABLE
-- ALTER-ADD,MODIFY,RENAME,DROP
-- DROP-DELETE THE TABLE
-- TRUNCATE
-- DML COMMANDS
-- -------------
-- insert
-- update
-- delete

-- DQL COMMANDS
-- select

-- -----------------------------------------------------------INSERT INTO gandhi.students VALUES(1, 'MAL',21,'ECE','FEMALE');
-- INSERT INTO gandhi.students VALUES(2, 'sri',22,'ECE','FEMALE');
-- INSERT INTO gandhi.students VALUES(3, 'nag',21,'ECE','FEMALE');
-- UPDATE gandhi.students SET sname='pelleti' WHERE sid=1;
-- UPDATE gandhi.students SET sname='paidi' WHERE sid=2;
-- /*UPDATING GROUP OF RECORDS*/
-- UPDATE gandhi.students SET sname='MALATHI',Sage=22,sbranch='ECE',sgender='female' WHERE sid=2;
-- /*DELETING ANSPECIFIC RECORD*/
-- DELETE FROM gandhi.students WHERE sid=3;
-- /*SELECT sid,sname,sbranch,sgender FROM gandhi.students;*/
-- SELECT *FROM gandhi.students;
-- SELECT sid,sname,sage,sbranch,sgender FROM gandhi.students;--------------------------
-- ---------------------------------------------------------------
-- package jdbc.connect;

-- import java.sql.Connection;
-- import java.sql.DriverManager;
-- import java.sql.SQLException;
-- import java.sql.Statement;

-- public class MyConnection {
-- 	

-- 	public static void main(String[] args) {
-- 		String drivernname = "com.mysql.cj.jdbc.Driver";
-- 		String url="jdbc:mysql://localhost:3306/mydb";
-- 	    String username ="root";
-- 		String password ="root";
-- 		String sql1="CREATE DATABASE mydb";
-- 		String sql2="CREATE TABLE product(pid int,pname varchar(25),pcost double)";
-- 		String sql3="INSERT INTO product VALUES(1, 'JBL Speaker',3500)";
-- 		String sql4="INSERT INTO product VALUES(2, 'realme Speaker',4500)";
-- 		String sql5="INSERT INTO product VALUES(3, 'oppo Speaker',5500)";
-- 		String sql6="INSERT INTO product VALUES (4,'mivi buds',2000),(5,'smart watch',4000),(6,'powerbank',4500)";
-- 		String sql7="INSERT INTO product VALUES (7,'mivi buds',2000),(8,'smart watch',4000),(9,'powerbank',4500),(10,'iphone',5500)";
-- 		String sql8="UPDATE product SET pname='memorycard',pcost=850 WHERE pid=3";
-- 		String sql9="UPDATE product SET pname='atmcard',pcost=550 WHERE pid=2";
-- 		String sql10="DELETE FROM product WHERE pid=2";
-- 		String sql11="DELETE FROM product WHERE pid=2";
-- 		String sql12="TRUNCATE TABLE product";
-- 		try {
-- 			Class.forName(drivernname);
-- 			Connection connect=DriverManager.getConnection(url, username, password);
-- 			Statement stmt=connect.createStatement();
-- 			int rowCount=stmt.executeUpdate(sql12);
-- //			if(rowCount > 0) {
-- //				System.out.println("deleted records:"+rowCount+" success");
-- //			}
-- //			else {
-- //				System.out.println("deleted records:"+rowCount+" failure");
-- //			}
-- 		System.out.println("deleted");
-- 		} catch (ClassNotFoundException | SQLException e) {
-- 			
-- 			e.printStackTrace();
-- 		}
-- 	}

-- }-- 
------------------------------------------------------------------