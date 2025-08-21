import 'package:fixly/features/customer/rating_and_review/models/rating_review_model.dart';

/// Sample rating and review data for demonstration
class RatingReviewData {
  /// Available compliment tags
  static final List<ComplimentTag> availableCompliments = [
    const ComplimentTag(id: 'professional', label: 'Professional'),
    const ComplimentTag(id: 'on_time', label: 'On Time'),
    const ComplimentTag(id: 'clean_work', label: 'Clean Work'),
    const ComplimentTag(id: 'fair_price', label: 'Fair Price'),
    const ComplimentTag(id: 'friendly', label: 'Friendly'),
    const ComplimentTag(id: 'expert', label: 'Expert'),
    const ComplimentTag(id: 'quick_service', label: 'Quick Service'),
    const ComplimentTag(id: 'problem_solved', label: 'Problem Solved'),
  ];

  /// Common tip amounts
  static final List<TipAmount> commonTipAmounts = [
    const TipAmount(amount: 10.0),
    const TipAmount(amount: 20.0),
    const TipAmount(amount: 30.0),
    const TipAmount(amount: 50.0),
  ];

  /// Sample rating and review instances
  static final List<RatingReviewModel> sampleReviews = [
    RatingReviewModel(
      bookingId: 'FX123456789',
      technicianId: 'TECH001',
      technicianName: 'Hassan Mahmoud',
      serviceName: 'Plumbing',
      rating: RatingValue.excellent,
      compliments: availableCompliments,
      reviewText:
          'Excellent service! Hassan was very professional and fixed the issue quickly.',
      tipAmount: 20.0,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    RatingReviewModel(
      bookingId: 'FX987654321',
      technicianId: 'TECH002',
      technicianName: 'Mohamed Hassan',
      serviceName: 'Electricity',
      rating: RatingValue.veryGood,
      compliments: availableCompliments,
      reviewText:
          'Great work on fixing our electrical issues. Very knowledgeable.',
      tipAmount: 15.0,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  /// Get default rating review model
  static RatingReviewModel getDefaultRatingReview({
    String? bookingId,
    String? technicianId,
    String? technicianName,
    String? serviceName,
  }) {
    return RatingReviewModel(
      bookingId: bookingId ?? 'FX123456789',
      technicianId: technicianId ?? 'TECH001',
      technicianName: technicianName ?? 'Hassan Mahmoud',
      serviceName: serviceName ?? 'Plumbing',
      rating: RatingValue.none,
      compliments: availableCompliments,
      reviewText: '',
      tipAmount: 0.0,
      createdAt: DateTime.now(),
    );
  }

  /// Get rating review by booking ID
  static RatingReviewModel? getRatingReviewByBookingId(String bookingId) {
    try {
      return sampleReviews.firstWhere(
        (review) => review.bookingId == bookingId,
      );
    } catch (e) {
      return null;
    }
  }

  /// Create new rating review with technician data
  static RatingReviewModel createRatingReview({
    required String bookingId,
    required String technicianId,
    required String technicianName,
    required String serviceName,
  }) {
    return RatingReviewModel(
      bookingId: bookingId,
      technicianId: technicianId,
      technicianName: technicianName,
      serviceName: serviceName,
      rating: RatingValue.none,
      compliments: availableCompliments,
      reviewText: '',
      tipAmount: 0.0,
      createdAt: DateTime.now(),
    );
  }

  /// Get tip amounts with selection state
  static List<TipAmount> getTipAmountsWithSelection(double selectedAmount) {
    return commonTipAmounts.map((tip) {
      return tip.copyWith(isSelected: tip.amount == selectedAmount);
    }).toList();
  }

  /// Validate review data before submission
  static bool validateReviewData(RatingReviewModel review) {
    // Rating is required
    if (review.rating == RatingValue.none) {
      return false;
    }

    // Review text should not be too long
    if (review.reviewText.length > 500) {
      return false;
    }

    // Tip amount should be non-negative
    if (review.tipAmount < 0) {
      return false;
    }

    return true;
  }

  /// Get review submission success message
  static String getSubmissionSuccessMessage(RatingReviewModel review) {
    final hasCompliments = review.selectedCompliments.isNotEmpty;
    final hasReviewText = review.reviewText.trim().isNotEmpty;
    final hasTip = review.tipAmount > 0;

    if (hasCompliments && hasReviewText && hasTip) {
      return 'Thank you for your detailed review and generous tip!';
    } else if (hasCompliments && hasReviewText) {
      return 'Thank you for your detailed review!';
    } else if (hasTip) {
      return 'Thank you for your rating and generous tip!';
    } else {
      return 'Thank you for your rating!';
    }
  }

  /// Get rating description with emoji
  static String getRatingDescriptionWithEmoji(RatingValue rating) {
    switch (rating) {
      case RatingValue.none:
        return '⭐ Tap to rate your experience';
      case RatingValue.poor:
        return '😞 Poor';
      case RatingValue.fair:
        return '😐 Fair';
      case RatingValue.good:
        return '😊 Good';
      case RatingValue.veryGood:
        return '😄 Very Good';
      case RatingValue.excellent:
        return '🤩 Excellent';
    }
  }
}
