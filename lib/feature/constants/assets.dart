class CustomAssets {
  static final String onboardImage1 = _imagesPath('onboard_image_1.json');
  static final String onboardImage2 = _imagesPath('onboard_image_2.json');
  static final String onboardImage3 = _imagesPath('onboard_image_3.json');
  static final String onboardBackground = _imagesPath('canva2.png');
  static final String person1 = _imagesPath('p1.jpg');
  static final String person2 = _imagesPath('p2.jpg');
  static final String person3 = _imagesPath('p3.jpg');
  static final String person4 = _imagesPath('p4.jpg');
}

String _imagesPath(String assetName) {
  return 'assets/images/$assetName';
}
