void main() {
  print(Constants.greeting);
  Constants.callMe();
}

class Constants {
  static String greeting = "How do you do";

  static void callMe() {
    print("Calling..");
  }
}
// bina class ko inistate kiya call karna tho tab use kar sakta