// 10. Write a program to print the cubes of the first 10 natural numbers in reverse order.

void main() {
  int i = 10;

  do {
    print(i * i * i);
    i--;
  } while (i >= 1);
}
