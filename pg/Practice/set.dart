void main() {
  Set set = Set();

  set.addAll({1, 2});
  print(set.iterator);

  // .toSet() can change list to set type
  // set => {} set uses {1,2,3}
}
