import 'package:fixly/core/constants/app_assets.dart';
import 'package:fixly/features/onboarding/models/onboarding_data_model.dart';

class CustomerOnboardingDataList {
  static const List<OnboardingData> onboardingItems = [
    OnboardingData(
      id: 1,
      title: 'A Technician You Can Trust...',
      subtitle: 'With Peace of Mind.',
      description: 'Verified professionals with Fixly ID cards ensure your home repairs are handled by trusted experts.',
      lottieFilePath: AppAssets.technicianOnboardingScreen1,
    ),
    OnboardingData(
      id: 2,
      title: 'Your Problem Solved...',
      subtitle: 'Within an Hour.',
      description: 'Fixly Flash service connects you with nearby technicians for rapid response and quick solutions.',
      lottieFilePath: AppAssets.customerOnboardingScreen2,
    ),
    OnboardingData(
      id: 3,
      title: 'Guaranteed Quality...',
      subtitle: 'Or We\'ll Be Back.',
      description: 'Complete satisfaction guaranteed. If you\'re not happy with the repair, we\'ll make it right.',
      lottieFilePath: AppAssets.customerOnboardingScreen3,
    ),
  ];
}