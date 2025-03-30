import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure() : super.pure('');
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);


  @override
  PhoneNumberValidationError? validator(String value) {

    return value.isNotEmpty && (value.length > 6 &&value.length < 16)
        ? null
        : PhoneNumberValidationError.invalid;

  }
}