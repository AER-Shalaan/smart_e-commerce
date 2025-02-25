class Constants {
  static String emailRegExp =
      r"^[a-zA-Z0-9._%+-]+@(gmail\.com|outlook\.com|hotmail\.com|yahoo\.com|icloud\.com|gov|edu|org|net|com)$";

  static String nameRegExp = r"^[A-Z][a-zA-Z'-]+([ ][A-Z][a-zA-Z'-]+)*$";
  static const String passRegExp =
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$";
  static const String baseUrl = "http://sm-ecommerce.runasp.net/";
}
