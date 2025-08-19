import '../models/technician_model.dart';

class TechniciansData {
  static const List<TechnicianModel> availableTechnicians = [
    TechnicianModel(
      id: 1,
      name: "Hassan Mahmoud",
      nameAr: "حسن محمود",
      tier: "Master Plumber",
      tierAr: "سباك خبير",
      rating: 4.9,
      jobCount: 150,
      yearsExperience: 8,
      photo: "👨‍🔧",
      profileImage:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
      badges: ["ID Verified", "Background Checked", "Fixly Trained"],
      arrivalTime: "20 min",
      isFlashAvailable: true,
      distance: "2.5 km",
      bio:
          "Hi! I'm Hassan, a certified plumber with 8 years of experience. I specialize in emergency repairs and take pride in solving problems quickly and efficiently. Customer satisfaction is my top priority!",
      specialties: [
        "Water Heaters",
        "Drainage Systems",
        "Pipe Installation",
        "Emergency Repairs",
        "Bathroom Fixtures",
      ],
      reviews: [
        TechnicianReview(
          name: "Sarah M.",
          rating: 5,
          comment:
              "Hassan was amazing! Fixed my kitchen sink leak in 30 minutes. Very professional and clean work.",
          date: "2 days ago",
        ),
        TechnicianReview(
          name: "Ahmed K.",
          rating: 5,
          comment:
              "Excellent service. Arrived on time and explained everything clearly. Highly recommended!",
          date: "1 week ago",
        ),
        TechnicianReview(
          name: "Fatima A.",
          rating: 4,
          comment:
              "Good work on fixing our bathroom pipes. Fair pricing and honest technician.",
          date: "2 weeks ago",
        ),
      ],
    ),
    TechnicianModel(
      id: 2,
      name: "Ahmed Ali",
      nameAr: "أحمد علي",
      tier: "Senior Plumber",
      tierAr: "سباك أول",
      rating: 4.7,
      jobCount: 89,
      yearsExperience: 5,
      photo: "👨‍🔧",
      profileImage:
          "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
      badges: ["ID Verified", "Fixly Trained"],
      arrivalTime: "35 min",
      isFlashAvailable: false,
      distance: "4.1 km",
      bio:
          "Professional plumber with 5 years of experience. I focus on quality repairs and always clean up after my work. Let me help solve your plumbing problems!",
      specialties: [
        "Faucet Repair",
        "Toilet Installation",
        "Leak Detection",
        "Pipe Maintenance",
      ],
      reviews: [
        TechnicianReview(
          name: "Omar S.",
          rating: 5,
          comment:
              "Ahmed did a great job fixing our toilet. Very punctual and professional.",
          date: "3 days ago",
        ),
        TechnicianReview(
          name: "Mona H.",
          rating: 4,
          comment: "Good service, reasonable prices. Would use again.",
          date: "1 week ago",
        ),
      ],
    ),
    TechnicianModel(
      id: 3,
      name: "Mohamed Hassan",
      nameAr: "محمد حسن",
      tier: "Expert Plumber",
      tierAr: "سباك خبير",
      rating: 4.8,
      jobCount: 200,
      yearsExperience: 10,
      photo: "👨‍🔧",
      profileImage:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face",
      badges: ["ID Verified", "Background Checked", "Fixly Trained"],
      arrivalTime: "15 min",
      isFlashAvailable: true,
      distance: "1.8 km",
      bio:
          "Expert plumber with 10 years in the field. I handle complex installations and emergency repairs. Known for my attention to detail and reliable service.",
      specialties: [
        "Complex Installations",
        "Water Systems",
        "Emergency Repairs",
        "Pipe Networks",
        "Commercial Plumbing",
      ],
      reviews: [
        TechnicianReview(
          name: "Youssef M.",
          rating: 5,
          comment:
              "Mohamed is the best! Fixed a complex pipe issue that others couldn't solve. True expert!",
          date: "1 day ago",
        ),
        TechnicianReview(
          name: "Layla K.",
          rating: 5,
          comment:
              "Excellent work on our water heater installation. Very knowledgeable and professional.",
          date: "4 days ago",
        ),
        TechnicianReview(
          name: "Khaled A.",
          rating: 4,
          comment:
              "Great service, arrived early and finished quickly. Fair pricing.",
          date: "1 week ago",
        ),
      ],
    ),
  ];
}
