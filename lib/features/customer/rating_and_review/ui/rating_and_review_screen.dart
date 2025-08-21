import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/rating_and_review/data/rating_review_data.dart';
import 'package:fixly/features/customer/rating_and_review/models/rating_review_model.dart';
import 'package:fixly/features/customer/rating_and_review/ui/widgets/compliment_tags_widget.dart';
import 'package:fixly/features/customer/rating_and_review/ui/widgets/review_text_widget.dart';
import 'package:fixly/features/customer/rating_and_review/ui/widgets/star_rating_widget.dart';
import 'package:fixly/features/customer/rating_and_review/ui/widgets/submit_review_button.dart';
import 'package:fixly/features/customer/rating_and_review/ui/widgets/tip_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RatingAndReviewScreen extends StatefulWidget {
  final String? bookingId;
  final String? technicianId;
  final String? technicianName;
  final String? serviceName;

  const RatingAndReviewScreen({
    super.key,
    this.bookingId,
    this.technicianId,
    this.technicianName,
    this.serviceName,
  });

  @override
  State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
}

class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
  late RatingReviewModel _ratingReview;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _initializeRatingReview();
  }

  void _initializeRatingReview() {
    // Try to get existing review data or create new one
    if (widget.bookingId != null) {
      _ratingReview =
          RatingReviewData.getRatingReviewByBookingId(widget.bookingId!) ??
          RatingReviewData.createRatingReview(
            bookingId: widget.bookingId!,
            technicianId: widget.technicianId ?? 'TECH001',
            technicianName: widget.technicianName ?? 'Hassan Mahmoud',
            serviceName: widget.serviceName ?? 'Plumbing',
          );
    } else {
      _ratingReview = RatingReviewData.getDefaultRatingReview(
        technicianId: widget.technicianId,
        technicianName: widget.technicianName,
        serviceName: widget.serviceName,
      );
    }
  }

  void _onRatingChanged(RatingValue rating) {
    setState(() {
      _ratingReview = _ratingReview.updateRating(rating);
    });
  }

  void _onComplimentToggled(String complimentId) {
    setState(() {
      _ratingReview = _ratingReview.toggleCompliment(complimentId);
    });
  }

  void _onReviewTextChanged(String text) {
    setState(() {
      _ratingReview = _ratingReview.updateReviewText(text);
    });
  }

  void _onTipAmountChanged(double amount) {
    setState(() {
      _ratingReview = _ratingReview.updateTipAmount(amount);
    });
  }

  Future<void> _submitReview() async {
    if (!RatingReviewData.validateReviewData(_ratingReview)) {
      _showErrorDialog('Please provide a valid rating before submitting.');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      // Create submitted review
      final submittedReview = SubmittedReviewModel(
        reviewId: SubmittedReviewModel.generateReviewId(),
        reviewData: _ratingReview,
        submittedAt: DateTime.now(),
      );

      // Show success dialog
      await _showSuccessDialog(submittedReview);

      // Navigate to receipt screen
      if (mounted) {
        context.pushReplacement(
          CustomerRoutes.receiptScreen,
          extra: submittedReview,
        );
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog('Failed to submit review. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _showSuccessDialog(SubmittedReviewModel submittedReview) async {
    final successMessage = RatingReviewData.getSubmissionSuccessMessage(
      submittedReview.reviewData,
    );

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: context.colors.success,
                size: 64.r,
              ),
              SizedBox(height: 16.h),
              Text(
                'Review Submitted!',
                style: context.textStyles.cardTitle.copyWith(
                  color: context.colors.success,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Review ID: ${submittedReview.reviewId}',
                style: context.textStyles.bodyTextSmall.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                successMessage,
                style: context.textStyles.bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Continue',
                style: context.textStyles.bodyTextBold.copyWith(
                  color: context.colors.accent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showErrorDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: context.colors.error,
                size: 64.r,
              ),
              SizedBox(height: 16.h),
              Text(
                'Submission Failed',
                style: context.textStyles.cardTitle.copyWith(
                  color: context.colors.error,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                message,
                style: context.textStyles.bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Try Again',
                style: context.textStyles.bodyTextBold.copyWith(
                  color: context.colors.accent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.primary, size: 24.r),
        ),
        title: Column(
          children: [
            Text(
              'How was your experience with',
              style: context.textStyles.bodyTextSmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            Text(
              '${_ratingReview.technicianName}?',
              style: context.textStyles.screenTitle,
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 80.h,
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Star rating
                  StarRatingWidget(
                    currentRating: _ratingReview.rating,
                    onRatingChanged: _onRatingChanged,
                  ),
                  SizedBox(height: 24.h),

                  // Compliment tags
                  ComplimentTagsWidget(
                    compliments: _ratingReview.compliments,
                    onComplimentToggled: _onComplimentToggled,
                  ),
                  SizedBox(height: 24.h),

                  // Review text
                  ReviewTextWidget(
                    reviewText: _ratingReview.reviewText,
                    onReviewTextChanged: _onReviewTextChanged,
                  ),
                  SizedBox(height: 24.h),

                  // Tip selection
                  TipSelectionWidget(
                    technicianName: _ratingReview.technicianName,
                    currentTipAmount: _ratingReview.tipAmount,
                    onTipAmountChanged: _onTipAmountChanged,
                  ),

                  // Add some bottom padding for the fixed button
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),

          // Fixed submit button
          SubmitReviewButton(
            currentRating: _ratingReview.rating,
            onPressed: _submitReview,
            isLoading: _isSubmitting,
          ),
        ],
      ),
    );
  }
}
