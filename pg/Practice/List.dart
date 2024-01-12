// List can be of any type

// void main() {
//   List list = [10, 20, 30, 'Hello', false, null];
//   print(list);
// }

void main() {
  // Dart created
  List<double> marks = [10, 20.3, 22, 99.85];
  marks.add(88);
  print(marks);

  final student = Student<String>('DhirajNavik');
  print(student.name);

  // custom list type
  List<Student2> details = [
    Student2('Dhiraj', 23),
    Student2('Rivan', 18),
    Student2('Satish', 27),
    Student2('Verma', 12),
    Student2('Vasu', 21),
  ];
  print(details[0].name);

  details.add(Student2('Rahul', 34));
  details.insert(2, Student2('rajesh', 17));
  print(details);

  // for loop
  List<Student2> changedDetails = [];

  for (int i = 0; i < details.length; i++) {
    if (details[i].age >= 18) {
      changedDetails.add(details[i]);
    }
  }
  print(changedDetails);

  // for in
  List<Student2> changedDetailsEg2 = [];

  for (final detail in details) {
    if (detail.age >= 18) {
      changedDetailsEg2.add(detail);
    }
  }
  print(changedDetailsEg2);

  //where
  final filteredDetailsList = details.where((dets) => dets.age >= 18).toList();
  print(filteredDetailsList.runtimeType);
  // print('filtered List : ${filteredDetailsList.toList()}');
  print('filtered List : ${filteredDetailsList}');

  // forEach
  final ListEg = [];
  details.forEach((dets) {
    ListEg.add(dets.age >= 22);
  });
  print(ListEg);
}

// <double> --> Generic <type>

class Student<T> {
  final T name;
  Student(this.name);
}

class Student2 {
  final String name;
  final int age;
  Student2(this.name, this.age);

  @override
  String toString() => 'Student : $name';
}
