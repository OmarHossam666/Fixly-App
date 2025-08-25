class ProfileModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String joinDate;
  final int completedServices;
  final double rating;
  final String image;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.joinDate,
    required this.completedServices,
    required this.rating,
    required this.image,
  });
}
