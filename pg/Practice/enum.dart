void main() {
  Employee emp1 = Employee('Dhiraj', EmployeeType.finance);
  emp1.fn();
}

enum EmployeeType {
  sde(100000),
  softwareEngineer(200000),
  finance(100000);

  final int Salary;
  const EmployeeType(this.Salary);
}

class Employee {
  final String name;
  final EmployeeType type;
  Employee(this.name, this.type);

  void fn() {
    print(type.name);
  }
}
