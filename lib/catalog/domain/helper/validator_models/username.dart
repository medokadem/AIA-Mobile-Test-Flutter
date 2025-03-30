import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty ,validationError }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameInputError? validator(String value) {
    if(value.length > 1 && value.length< 32){
      return null;
    }
    else{
      return UsernameInputError.validationError;

    }
  }
}