class InputValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît entrer un email';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Sil vous plaît entrer un email valide';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît entrer un mot de passe';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit comporter au moins 6 caractères';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît confirmer votre mot de passe';
    }
    if (value != password) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît entrer un nom';
    }
    if (value.length < 2) {
      return 'Le nom doit comporter au moins 2 caractères';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît entrer un âge';
    }
    final age = int.tryParse(value);
    if (age == null || age < 0) {
      return 'Sil vous plaît entrer un âge valide';
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît sélectionner le sexe';
    }
    return null;
  }
  static String? validateMedicalHistory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sil vous plaît entrer des antécédents médicaux';
    }
    if (value.length < 10) {
      return 'Les antécédents médicaux doivent comporter au moins 10 caractères';
    }
    return null;
  }
}
