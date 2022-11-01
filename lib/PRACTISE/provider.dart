import 'package:flutter/cupertino.dart';

class ValidationProvider with ChangeNotifier {
    ValidationItem _fullName = ValidationItem(null,null);
  ValidationItem _userName = ValidationItem(null,null);
  ValidationItem _password = ValidationItem(null,null);
   ValidationItem _email = ValidationItem(null,null);

  //Getters
  ValidationItem get fullName => _fullName;
  ValidationItem get userName => _userName;
  ValidationItem get password => _password;
  ValidationItem get email => _email;
  bool get isValid {
    if (_fullName.value != null && _userName.value != null && _password.value != null && _email.value != null ){
      return true;
    } else {
      return false;
    }
  }


 void changeFullName(String value){
    if (value.length >= 3){
      _fullName=ValidationItem(value,null);
    } else {
      _fullName=ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }


  void changeuserName(String value){
    if (value.length >= 3){
      _userName=ValidationItem(value,null);
    } else {
      _userName=ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }
  void changepassword(String value){
    if (value.length >= 3){
      _password=ValidationItem(value,null);
    } else {
      _password=ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }
  void changeemail(String value){
    if (value.length >= 3){
      _email=ValidationItem(value,null);
    } else {
      _email=ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

    void submitData(){
    print("FirstName: ${fullName.value}, LastName: ${userName.value}, ");
  }

}






class ValidationItem {
  final dynamic value;
  final dynamic error;

  ValidationItem(this.value, this.error);
}
