class MemberApprovalModel {
  final String id;
  final String fullName;
  final String avatar_member;
  final String reviewStatus;
  final String reviewType;

  MemberApprovalModel({
    required this.id,
    required this.fullName,
    required this.avatar_member,
    required this.reviewStatus,
    required this.reviewType,
  });

  factory MemberApprovalModel.fromJson(Map<String, dynamic> json) {
    return MemberApprovalModel(
      id: json['id'],
      fullName: json['fullName'],
      avatar_member: json['avatar_member'],
      reviewStatus: json['reviewStatus'],
      reviewType: json['reviewType'],
    );
  }
}
