// ignore_for_file: public_member_api_docs, sort_constructors_first
class BankModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;
  BankModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalReviews,
    required this.profile,
  });
}

final List<BankModel> nearbyBanks = [
  BankModel(
    name: "Mawar Biru",
    position: "Jl. Rambutan",
    averageReview: 0,
    totalReviews: 0,
    profile: "lib/images/banksampah1.jpg",
  ),
  BankModel(
    name: "Sophie Harmon",
    position: "General Practitioner",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/doctor_2.jpg",
  ),
  BankModel(
    name: "Louise Reid",
    position: "General Practitioner",
    averageReview: 2,
    totalReviews: 0,
    profile: "assets/doctor_3.jpg",
  ),
];
