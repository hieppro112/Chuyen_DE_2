class UserPostApprovalModel {
  final String id;
  final String authorName;
  final String content;
  final String image;
  final DateTime date;
  final String status;
  final String reviewType;

  UserPostApprovalModel({
    required this.id,
    required this.authorName,
    required this.content,
    required this.image,
    required this.date,
    required this.status,
    required this.reviewType,
  });

  factory UserPostApprovalModel.fromJson(Map<String, dynamic> json) {
    return UserPostApprovalModel(
      id: json['id'],
      authorName: json['authorName'],
      content: json['content'],
      image: json['image'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      reviewType: json['reviewType'],
    );
  }
}
