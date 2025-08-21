import 'package:fixly/core/constants/app_assets.dart';
import 'package:fixly/features/onboarding/models/onboarding_data_model.dart';

class TechnicianOnboardingDataList {
  static const List<OnboardingData> onboardingItems = [
    OnboardingData(
      id: 1,
      title: 'Boost Your Career...',
      subtitle: 'With Every Job.',
      description: 'Join Fixly to access a steady flow of customers who need your expertise, right in your area.',
      lottieFilePath: AppAssets.customerOnboardingScreen1,
    ),
    OnboardingData(
      id: 2,
      title: 'Work on Your Terms...',
      subtitle: 'Anytime, Anywhere.',
      description: 'Choose the jobs that fit your schedule. Flexibility and freedom while growing your income.',
      lottieFilePath: AppAssets.customerOnboardingScreen2,
    ),
    OnboardingData(
      id: 3,
      title: 'Secure Payments...',
      subtitle: 'Always on Time.',
      description: 'Get paid quickly and securely for every completed task, with no delays or hidden fees.',
      lottieFilePath: AppAssets.customerOnboardingScreen3,
    ),
  ];
}
