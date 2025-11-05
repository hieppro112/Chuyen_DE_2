import 'package:cloud_firestore/cloud_firestore.dart';

class GetPosts {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Lấy tất cả bài viết từ Firestore, sắp xếp theo ngày tạo giảm dần.
  Future<List<Map<String, dynamic>>> fetchPosts() async {
    try {
      final snapshot = await _firestore
          .collection('Post')
          .orderBy('date_created', descending: true)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();

        // Chuẩn hóa dữ liệu thành format mong muốn (Map<String, dynamic>)
        return {
          "id": doc.id,
          "user": data["user_id"] ?? "Ẩn danh",
          "group": data["group_id"] ?? "Không rõ",
          "title": data["content"] ?? "Không có nội dung",
          // Chuyển Timestamp sang String, hoặc null nếu không có
          "date": (data["date_created"] is Timestamp)
              ? (data["date_created"] as Timestamp).toDate().toString()
              : null,
          "image": data["file_url"],
          // Giá trị mặc định cho likes, isLiked, comments vì không có trong Firestore (theo logic hiện tại)
          "likes": 0,
          "isLiked": false,
          "comments": <Map<String, dynamic>>[],
        };
      }).toList();
    } catch (e) {
      print("🔥 Lỗi tải bài viết từ PostService: $e");
      // Trả về danh sách rỗng nếu có lỗi
      return [];
    }
  }

  // Bạn có thể thêm các hàm khác như:
  // - Future<void> addPost(Map<String, dynamic> postData)
  // - Future<void> toggleLike(String postId, bool isLiked)
}
