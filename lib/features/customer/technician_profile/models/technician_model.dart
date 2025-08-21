class TechnicianModel {
  final int id;
  final String name;
  final String nameAr;
  final String tier;
  final String tierAr;
  final double rating;
  final int jobCount;
  final int yearsExperience;
  final String photo;
  final String profileImage;
  final List<String> badges;
  final String arrivalTime;
  final bool isFlashAvailable;
  final String distance;
  final String bio;
  final List<String> specialties;
  final List<TechnicianReview> reviews;

  const TechnicianModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.tier,
    required this.tierAr,
    required this.rating,
    required this.jobCount,
    required this.yearsExperience,
    required this.photo,
    required this.profileImage,
    required this.badges,
    required this.arrivalTime,
    required this.isFlashAvailable,
    required this.distance,
    required this.bio,
    required this.specialties,
    required this.reviews,
  });
}

class TechnicianReview {
  final String name;
  final int rating;
  final String comment;
  final String date;

  const TechnicianReview({
    required this.name,
    required this.rating,
    required this.comment,
    required this.date,
  });
}
