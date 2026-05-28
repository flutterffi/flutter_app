class ProfileModel {
  const ProfileModel({
    required this.title,
    required this.subtitle,
    required this.email,
    required this.password,
    required this.isPasswordVisible,
    required this.isLoggedIn,
    required this.errorMessage,
  });

  final String title;
  final String subtitle;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool isLoggedIn;
  final String? errorMessage;

  ProfileModel copyWith({
    String? title,
    String? subtitle,
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isLoggedIn,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return ProfileModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
