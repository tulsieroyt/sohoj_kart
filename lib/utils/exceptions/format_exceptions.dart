class SKFormatExceptions implements Exception {
  final String message;

  ///Default constructor with a generic error message
  const SKFormatExceptions(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  ///Create a  format exception from the specific error message
  factory SKFormatExceptions.fromMessage(String message) {
    return SKFormatExceptions(message);
  }

  ///Get the corresponding error message
  String get formattedMessage => message;

  ///
  factory SKFormatExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const SKFormatExceptions(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const SKFormatExceptions(
            'The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const SKFormatExceptions(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const SKFormatExceptions(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const SKFormatExceptions(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const SKFormatExceptions(
            'The input should be a valid numeric format.');
      default:
        return const SKFormatExceptions('Something went wrong');
    }
  }
}
