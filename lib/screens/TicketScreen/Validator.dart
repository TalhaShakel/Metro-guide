class Validator {
  static String? validateField({required String value}){
    if (value.isEmpty){
      return "TextFormFied Cannot be empty";
    }
    return null;
  }
}