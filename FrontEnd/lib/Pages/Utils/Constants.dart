import 'package:flutter/material.dart';
import 'dart:io';

class AppColors {
  static const backgroundColor = Color(0xFFFAFAFA);
  static const surfaceColor = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFF2C3E50);
  static const secondaryColor = Color(0xFF34495E);
  static const accentColor = Color(0xFF3498DB);
  static const dividerColor = Color(0xFFEDF2F7);
  static const primaryTextColor = Color(0xFF2D3748);
  static const secondaryTextColor = Color(0xFF718096);
  static const successColor = Color(0xFF2ECC71); 
  static const errorColor = Color(0xFFE74C3C);
  static const warningColor = Color(0xFFF1C40F);
  static const cardColor = Colors.white;
  static const cardShadowColor = Color(0x0A000000);
}

class AppTextStyles {
  static const headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold, 
    color: AppColors.primaryTextColor
  );

  static const headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor
  );

  static const headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor
  );

  static const headingSmallCarousel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor
  );

  static const bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryTextColor
  );

  static const bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryTextColor
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryTextColor
  );

  static const buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white
  );

  static const priceText = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor
  );

  static const priceTextCarousel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor
  );
}

class AppDimensions {
  static const paddingSmall = 8.0;
  static const paddingMedium = 16.0;
  static const paddingLarge = 24.0;
  
  static const marginSmall = 8.0;
  static const marginMedium = 16.0;
  static const marginLarge = 24.0;
  
  static const borderRadiusSmall = 8.0;
  static const borderRadiusMedium = 12.0;
  static const borderRadiusLarge = 16.0;
  
  static const iconSizeSmall = 16.0;
  static const iconSizeMedium = 24.0;
  static const iconSizeLarge = 32.0;
}

class AppStrings {
  static const appName = 'SeNless SoNe zero';
  static const login = 'Login';
  static const signup = 'Sign Up';
  static const forgotPassword = 'Forgot Password?';
  static const email = 'Email';
  static const password = 'Password';
  static const confirmPassword = 'Confirm Password';
  static const addToCart = 'Add to Cart';
  static const checkout = 'Checkout';
  static const continue_ = 'Continue';
  static const cancel = 'Cancel';
  static const addedToCart = 'Item added to cart';
  static const purchaseSuccess = 'Thank you for your purchase!';
  static const loginError = 'Invalid username or password';
}

class ApiConstants {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000/api';
    }
    return 'http://localhost:3000/api';
  }
}