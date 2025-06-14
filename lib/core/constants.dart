class Constants {
  static String emailRegExp =
      r"^[a-zA-Z0-9._%+-]+@(gmail\.com|outlook\.com|hotmail\.com|yahoo\.com|icloud\.com|gov|edu|org|net|com)$";
  static String phoneRegExp = r"^(01)[0125][0-9]{8}$";
  static String nameRegExp = r"^[A-Z][a-zA-Z'-]+([ ][A-Z][a-zA-Z'-]+)*$";
  static const String passRegExp =
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$";
  static const String baseUrl = "https://sm-ecommerce.runasp.net/";
  static const String baseUrl2 = "https://recommendedlist.up.railway.app/";
}
