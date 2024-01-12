void main() {
  // Map {key:Value} Pair
  Map<String, int> marks = {
    'Dhiraj': 68,
    'Subham': 77,
    'Rathore': 54,
  };

  print(marks['Dhiraj']?.isEven);
  print(marks['Dhi']?.isEven);
  // print(marks['Dhi']!.isEven);

  marks.addAll({'Lakshay': 12, 'Chadudary': 23});

  for (int i = 0; i < marks.length; i++) {
    print('${marks.keys.toList()[i]} : ${marks.values.toList()[i]}');
  }

  marks.forEach((key, value) {
    print('$key : $value');
  });

  List<Map<String, int>> stdMarks = [
    {'Math': 18, 'Science': 10, 'Social': 13},
    {'Math': 20, 'Science': 19, 'Social': 17},
    {'Math': 13, 'Science': 20, 'Social': 19},
  ];

  stdMarks
      .map((e) => e.forEach((key, value) {
            print('$key : $value');
          }))
      .toList();
}
