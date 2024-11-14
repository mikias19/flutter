String getFriendlyErrorMessage(String error) {
  // Map technical errors to user-friendly messages
  if (error.contains('email')) {
    return 'Please enter a valid email address.';
  } else if (error.contains('password')) {
    return 'The password you entered is incorrect or too weak.';
  } else if (error.contains('network')) {
    return 'Network issue detected. Please check your connection and try again.';
  } else {
    return 'An unexpected error occurred. Please try again later.';
  }
}
