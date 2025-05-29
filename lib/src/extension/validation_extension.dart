extension ValidationExtension on String? {
  String? validatePhoneNumber(int length, String phoneCode) {
    if (this == null || this!.isEmpty) {
      return 'Please enter a phone number';
    }

    String phoneWithCountryCode = '+$phoneCode $this';
    if (phoneWithCountryCode.length != length) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
