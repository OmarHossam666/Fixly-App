import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/auth_toggle_widget.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/logo_widget.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/phone_input_widget.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/primary_button_widget.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/skip_button_widget.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/social_login_button.dart';
import 'package:fixly/features/customer/authentication/ui/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _isLogin = false;
  String _phoneNumber = '';
  bool _showPhoneInput = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: context.isDarkMode
              ? Brightness.light
              : Brightness.dark,
          statusBarBrightness: context.isDarkMode
              ? Brightness.dark
              : Brightness.light,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Logo Section
              const LogoWidget(),
              const SizedBox(height: 60),

              // Welcome Text
              WelcomeTextWidget(isLogin: _isLogin),
              const SizedBox(height: 40),

              // Phone Number Input (if shown)
              if (_showPhoneInput) ...[
                PhoneInputWidget(
                  phoneNumber: _phoneNumber,
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
              ],

              // Authentication Buttons
              _buildAuthButtons(),
              const SizedBox(height: 32),

              // Toggle Auth Mode
              AuthToggleWidget(isLogin: _isLogin, onToggle: _toggleAuthMode),
              const SizedBox(height: 16),

              // Skip Button
              SkipButtonWidget(onPressed: _handleSkip),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButtons() {
    return Column(
      children: [
        // Google Login Button
        SocialLoginButton(
          type: SocialLoginType.google,
          onPressed: () => _handleSocialLogin('Google'),
          isLoading: _isLoading,
        ),
        const SizedBox(height: 16),

        // Facebook Login Button
        SocialLoginButton(
          type: SocialLoginType.facebook,
          onPressed: () => _handleSocialLogin('Facebook'),
          isLoading: _isLoading,
        ),
        const SizedBox(height: 16),

        // Phone Number Button
        if (!_showPhoneInput)
          PrimaryButtonWidget(
            text: 'Continue with Phone Number',
            icon: Icons.phone,
            onPressed: _isLoading
                ? null
                : () {
                    setState(() {
                      _showPhoneInput = true;
                    });
                  },
            isLoading: false,
          )
        else
          PrimaryButtonWidget(
            text: _isLoading ? 'Sending OTP...' : 'Send Verification Code',
            onPressed: _phoneNumber.trim().isEmpty ? null : _handlePhoneLogin,
            isLoading: _isLoading,
            showIcon: false,
          ),
      ],
    );
  }

  Future<void> _handleSocialLogin(String provider) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 1500));

      if (mounted) {
        _showComingSoonDialog(provider);
      }
    } catch (error) {
      if (mounted) {
        _showErrorDialog('Something went wrong. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handlePhoneLogin() async {
    if (_phoneNumber.trim().isEmpty) {
      _showErrorDialog('Please enter your phone number');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Simulate OTP sending
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        _showOtpSentDialog();
      }
    } catch (error) {
      if (mounted) {
        _showErrorDialog('Failed to send OTP. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
      _showPhoneInput = false;
      _phoneNumber = '';
    });
  }

  void _handleSkip() {
    // Navigate to main app
    context.pushReplacement(CustomerRoutes.mainScreen);
  }

  void _showComingSoonDialog(String provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: provider == 'Google'
            ? context.colors.google
            : context.colors.facebook,
        title: Text('Coming Soon', style: context.textStyles.headline),
        content: Text(
          '$provider login will be available in the next update.',
          style: context.textStyles.bodyTextBold,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: context.colors.primaryButton,
              foregroundColor: context.colors.primaryButtonText,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () => context.pop(),
            child: Text('OK', style: context.textStyles.primaryButton),
          ),
        ],
      ),
    );
  }

  void _showOtpSentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.background,
        title: Text('OTP Sent', style: context.textStyles.headline),
        content: Text(
          'Verification code sent to $_phoneNumber. This feature will be fully implemented in the next update.',
          style: context.textStyles.bodyText,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: context.colors.primaryButton,
              foregroundColor: context.colors.primaryButtonText,
            ),
            onPressed: () {
              context.pop();
              context.pushReplacement(CustomerRoutes.mainScreen);
            },
            child: Text(
              'Continue to App',
              style: context.textStyles.primaryButton,
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error', style: context.textStyles.errorTitle),
        content: Text(message, style: context.textStyles.errorSubtitle),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: context.colors.error,
              foregroundColor: context.colors.warning,
            ),
            onPressed: () => context.pop(),
            child: Text('OK', style: context.textStyles.primaryButton),
          ),
        ],
      ),
    );
  }
}
