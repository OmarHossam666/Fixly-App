/// Enum for rating values
enum RatingValue {
  none(0, 'Tap to rate your experience'),
  poor(1, 'Poor'),
  fair(2, 'Fair'),
  good(3, 'Good'),
  veryGood(4, 'Very Good'),
  excellent(5, 'Excellent');

  const RatingValue(this.value, this.description);

  final int value;
  final String description;

  /// Get rating value from integer
  static RatingValue fromInt(int value) {
    return RatingValue.values.firstWhere(
      (rating) => rating.value == value,
      orElse: () => RatingValue.none,
    );
  }
}

/// Model for compliment tags
class ComplimentTag {
  final String id;
  final String label;
  final bool isSelected;

  const ComplimentTag({
    required this.id,
    required this.label,
    this.isSelected = false,
  });

  /// Copy with method for updating selection state
  ComplimentTag copyWith({String? id, String? label, bool? isSelected}) {
    return ComplimentTag(
      id: id ?? this.id,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  /// Toggle selection state
  ComplimentTag toggle() {
    return copyWith(isSelected: !isSelected);
  }
}

/// Model for tip amounts
class TipAmount {
  final double amount;
  final bool isSelected;
  final bool isCustom;

  const TipAmount({
    required this.amount,
    this.isSelected = false,
    this.isCustom = false,
  });

  /// Copy with method for updating selection state
  TipAmount copyWith({double? amount, bool? isSelected, bool? isCustom}) {
    return TipAmount(
      amount: amount ?? this.amount,
      isSelected: isSelected ?? this.isSelected,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  /// Get formatted amount string
  String get formattedAmount {
    return '${amount.toStringAsFixed(0)} EGP';
  }
}

/// Model for rating and review data
class RatingReviewModel {
  final String bookingId;
  final String technicianId;
  final String technicianName;
  final String serviceName;
  final RatingValue rating;
  final List<ComplimentTag> compliments;
  final String reviewText;
  final double tipAmount;
  final DateTime createdAt;

  const RatingReviewModel({
    required this.bookingId,
    required this.technicianId,
    required this.technicianName,
    required this.serviceName,
    required this.rating,
    required this.compliments,
    required this.reviewText,
    required this.tipAmount,
    required this.createdAt,
  });

  /// Get selected compliments
  List<ComplimentTag> get selectedCompliments {
    return compliments.where((compliment) => compliment.isSelected).toList();
  }

  /// Check if review is valid for submission
  bool get isValidForSubmission {
    return rating != RatingValue.none;
  }

  /// Copy with method for updating the model
  RatingReviewModel copyWith({
    String? bookingId,
    String? technicianId,
    String? technicianName,
    String? serviceName,
    RatingValue? rating,
    List<ComplimentTag>? compliments,
    String? reviewText,
    double? tipAmount,
    DateTime? createdAt,
  }) {
    return RatingReviewModel(
      bookingId: bookingId ?? this.bookingId,
      technicianId: technicianId ?? this.technicianId,
      technicianName: technicianName ?? this.technicianName,
      serviceName: serviceName ?? this.serviceName,
      rating: rating ?? this.rating,
      compliments: compliments ?? this.compliments,
      reviewText: reviewText ?? this.reviewText,
      tipAmount: tipAmount ?? this.tipAmount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Update rating
  RatingReviewModel updateRating(RatingValue newRating) {
    return copyWith(rating: newRating);
  }

  /// Update review text
  RatingReviewModel updateReviewText(String newText) {
    return copyWith(reviewText: newText);
  }

  /// Update tip amount
  RatingReviewModel updateTipAmount(double newAmount) {
    return copyWith(tipAmount: newAmount);
  }

  /// Toggle compliment selection
  RatingReviewModel toggleCompliment(String complimentId) {
    final updatedCompliments = compliments.map((compliment) {
      if (compliment.id == complimentId) {
        return compliment.toggle();
      }
      return compliment;
    }).toList();

    return copyWith(compliments: updatedCompliments);
  }
}

/// Model for submitted review data
class SubmittedReviewModel {
  final String reviewId;
  final RatingReviewModel reviewData;
  final DateTime submittedAt;
  final bool isSubmitted;

  const SubmittedReviewModel({
    required this.reviewId,
    required this.reviewData,
    required this.submittedAt,
    this.isSubmitted = true,
  });

  /// Generate review ID
  static String generateReviewId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'REV${timestamp.toString().substring(7)}';
  }
}
