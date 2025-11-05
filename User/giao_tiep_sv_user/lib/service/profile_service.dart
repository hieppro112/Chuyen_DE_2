import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:giao_tiep_sv_user/Data/faculty.dart';
import 'package:giao_tiep_sv_user/Profile/editProflie/models/profile_model.dart';

class ProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final String _collectionName = 'Users';
  final String _facultyCollectionName = 'Faculty';

  // Giả lập user ID (thay bằng Firebase Auth trong thực tế)
  String _getUserId() {
    return '23211TT8888';
  }

  Future<ProfileModel?> getProfile() async {
    final userId = _getUserId();

    try {
      final doc = await _firestore
          .collection(_collectionName)
          .doc(userId)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        return ProfileModel(
          name: data['fullname'] ?? '',
          email: data['email'] ?? '',
          address: data['address'] ?? '',
          phone: data['phone'] ?? '',
          avatarUrl: data['avt'] ?? '',
          faculty: Faculty(
            faculty_id: data['faculty_id'] ?? '',
            name_faculty: data['name_faculty'] ?? '',
          ),
          roleId: data['role_id']?.toString() ?? '', // Chỉ sửa ở đây
        );
      }
      return null;
    } catch (e) {
      print('Lỗi khi lấy profile: $e');
      throw e;
    }
  }

  /// 🧩 Cập nhật thông tin profile
  Future<void> updateProfile(ProfileModel profile, {File? newAvatar}) async {
    final userId = _getUserId();

    try {
      String avatarUrl = profile.avatarUrl;

      if (newAvatar != null) {
        if (!await newAvatar.exists()) {
          throw Exception("File ảnh không tồn tại: ${newAvatar.path}");
        }
        avatarUrl = await _uploadAvatar(newAvatar, userId);
      }

      await _firestore.collection(_collectionName).doc(userId).update({
        'fullname': profile.name,
        'address': profile.address,
        'phone': profile.phone,
        'avt': avatarUrl,
      });
    } on FirebaseException catch (e) {
      print('Firebase lỗi: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      print('Lỗi không xác định: $e');
      rethrow;
    }
  }

  /// 🧩 Upload ảnh đại diện lên Firebase Storage
  Future<String> _uploadAvatar(File imageFile, String userId) async {
    try {
      final ref = _storage.ref().child('user_avatars/$userId.jpg');
      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Lỗi khi upload ảnh: $e');
      throw e;
    }
  }

  Future<Map<String, String>> layNganhVaNienKhoa(
    String email,
    String facultyId,
  ) async {
    try {
      String schoolYear = _schoolYearFromEmail(email);
      String major = await _getMajorFromFacultyId(facultyId);

      return {'major': major, 'schoolYear': schoolYear};
    } catch (e) {
      return {'major': 'lỗi', 'schoolYear': '20XX'};
    }
  }

  // Trích xuất niên khóa từ email
  String _schoolYearFromEmail(String email) {
    if (email.length >= 2) {
      String yearPrefix = email.substring(0, 2);
      return "20$yearPrefix";
    }
    return "null";
  }

  // Lấy major từ faculty_id (query to field id)
  Future<String> _getMajorFromFacultyId(String facultyId) async {
    if (facultyId.isEmpty) return 'Chưa chọn khoa';

    try {
      final snapshot = await _firestore
          .collection(_facultyCollectionName)
          .where('id', isEqualTo: facultyId)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return 'Không tìm thấy khoa';
      }

      final data = snapshot.docs.first.data();
      final name =
          data['name']?.toString().replaceAll('"', '') ?? 'Tên khoa trống';

      //print('Khoa: $name (ID: $facultyId)');
      return name;
    } catch (e) {
      //print(' Lỗi khi lấy thông tin khoa: $e');
      return 'Lỗi khi tải dữ liệu';
    }
  }
}
