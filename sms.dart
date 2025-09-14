import 'dart:io';

class Student {
  String name;
  int rollNo;
  double marks;

  Student(this.name, this.rollNo, this.marks);

  void display() {
    print("Roll No: $rollNo | Name: $name | Marks: $marks");
  }

  String get grade {
    if (marks >= 90) return "A+";
    if (marks >= 75) return "A";
    if (marks >= 60) return "B";
    if (marks >= 40) return "C";
    return "Fail";
  }
}

class StudentManagement {
  final List<Student> students = [];

  void addStudent() {
    stdout.write("Enter Roll No: ");
    int roll = int.parse(stdin.readLineSync()!);

    stdout.write("Enter Name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter Marks: ");
    double marks = double.parse(stdin.readLineSync()!);

    students.add(Student(name, roll, marks));
    print("Student added successfully!");
  }

  void viewStudents() {
    if (students.isEmpty) {
      print("No students found.");
    } else {
      print("\n--- Student List ---");
      for (var s in students) {
        s.display();
        print("Grade: ${s.grade}\n");
      }
    }
  }

  void searchStudent() {
    stdout.write("Enter Roll No to search: ");
    int roll = int.parse(stdin.readLineSync()!);
    var student = students.where((s) => s.rollNo == roll).toList();
    if (student.isNotEmpty) {
      student.first.display();
      print("Grade: ${student.first.grade}");
    } else {
      print("Student not found!");
    }
  }
}

void main() {
  var sm = StudentManagement();

  while (true) {
    print("\n--- Student Management System ---");
    print("1. Add Student");
    print("2. View Students");
    print("3. Search Student");
    print("4. Exit");
    stdout.write("Choose an option: ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        sm.addStudent();
        break;
      case '2':
        sm.viewStudents();
        break;
      case '3':
        sm.searchStudent();
        break;
      case '4':
        print("Exiting...");
        return;
      default:
        print("Invalid choice, try again!");
    }
  }
}
