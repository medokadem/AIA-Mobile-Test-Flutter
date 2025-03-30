import 'package:formz/formz.dart';

// Define input validation errors
enum StringFieldInputError { empty ,validationError }

// Extend FormzInput and provide the input type and error type.
class StringField extends FormzInput<String, StringFieldInputError> {
  // Call super.pure to represent an unmodified form input.
  const StringField.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const StringField.dirty([String value = '']) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  StringFieldInputError? validator(String value) {
    if(value.isEmpty){
        return StringFieldInputError.validationError;
    }
    else {
      return null;
    }

  }
}