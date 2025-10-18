import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_user/duyet_Nguoi_Dung/models/MemberApprovalModel.dart';
import 'package:giao_tiep_sv_user/duyet_Nguoi_Dung/models/User_post_approval_model.dart';
import 'package:giao_tiep_sv_user/duyet_Nguoi_Dung/widgets/member_approval_widget.dart';
import 'package:giao_tiep_sv_user/duyet_Nguoi_Dung/widgets/tabs_member_post_widget.dart';
import 'package:giao_tiep_sv_user/duyet_Nguoi_Dung/widgets/user_post_approval_widget.dart';

class MemberPostScreen extends StatefulWidget {
  const MemberPostScreen({Key? key}) : super(key: key);

  @override
  _MemberPostScreenState createState() => _MemberPostScreenState();
}

class _MemberPostScreenState extends State<MemberPostScreen> {
  int _selectedTabIndex = 0;

  // Dummy data - thay thế bằng data thực tế từ API
  final List<UserPostApprovalModel> _posts = [
    UserPostApprovalModel(
      id: '1',
      authorName: 'Cao Quang Khánh',
      content: 'Ngày đầu tiên đi học tại TDĐ',
      image:
          'https://occ-0-8407-2218.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABZTsOmV9hdevbqR_nArY3CdINQlYz00L4zdYonWDx-zpqdajGBO5KLt6kazmy6DyFzDjQwp-GyaHQ-sWHOD0qc2ePVBZh47cPAdw.jpg',
      date: DateTime.now(),
      status: 'pending',
      reviewType: 'post',
    ),
    UserPostApprovalModel(
      id: '2',
      authorName: 'Cao Quang Khanh',
      content: 'Nội dung bài viết khác',
      image:
          'https://cafefcdn.com/203337114487263232/2025/1/21/1722591443-conan-2-7381-width645height387-17373707771021179015512-1737424828485-1737424828574151073796.jpg',
      date: DateTime.now(),
      status: 'pending',
      reviewType: 'post',
    ),
  ];

  final List<MemberApprovalModel> _users = [
    MemberApprovalModel(
      id: '1',
      fullName: 'Cao Quang Khánh',
      avatar_member:
          "https://jbagy.me/wp-content/uploads/2025/03/Hinh-anh-avatar-dragon-ball-super-cool-ngau-5.jpg",
      reviewStatus: 'pending',
      reviewType: 'user',
    ),
    MemberApprovalModel(
      id: '2',
      fullName: 'Phạm Thắng',
      avatar_member:
          "https://i.pinimg.com/736x/d4/38/25/d43825dd483d634e59838d919c3cf393.jpg",
      reviewStatus: 'pending',
      reviewType: 'user',
    ),
    MemberApprovalModel(
      id: '3',
      fullName: 'Lê Đình Thuận',
      avatar_member:
          "https://i.pinimg.com/736x/9a/92/88/9a9288733b745cf4563ecdbe0e3ddb1e.jpg",
      reviewStatus: 'pending',
      reviewType: 'user',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyệt'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Tabs
          Tabs_Member_Approval_Widget(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          // Content
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildPostsList()
                : _buildMemberList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsList() {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        // gán Dummy data của _posts vào post
        final post = _posts[index];
        return UserPostApproval(
          // gán đúng data post ở trên vào trường post với kdl UserPostApproval và khai báo ở class UserPostApprovals
          post: post,
          onApprove: () => _duyetBaiViet(post),
          onReject: () => _tuChoiBaiviet(post),
        );
      },
    );
  }

  Widget _buildMemberList() {
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (context, index) {
        // gán Dummy data của _users vào user
        final user = _users[index];
        return MemberApprovalWidget(
          // gán đúng data post ở trên vào trường user với kdl MemberApprovalModel và khai báo ở class MemberApprovalWidget
          user: user,
          onApprove: () => _duyetThanhVien(user),
          onReject: () => _tuChoiThanhvien(user),
        );
      },
    );
  }

  void _duyetBaiViet(UserPostApprovalModel post) {
    // Xử lý duyệt bài viết
    print('Duyệt bài viết: ${post.id}');
    _showSnackBar('Đã duyệt bài viết của ${post.authorName}');
  }

  void _tuChoiBaiviet(UserPostApprovalModel post) {
    // Xử lý từ chối bài viết
    print('Từ chối bài viết: ${post.id}');
    _showSnackBar('Đã từ chối bài viết của ${post.authorName}');
  }

  void _duyetThanhVien(MemberApprovalModel user) {
    // Xử lý duyệt thành viên
    print('Duyệt thành viên: ${user.id}');
    _showSnackBar('Đã duyệt thành viên ${user.fullName}');
  }

  void _tuChoiThanhvien(MemberApprovalModel user) {
    // Xử lý từ chối thành viên
    print('Từ chối thành viên: ${user.id}');
    _showSnackBar('Đã từ chối thành viên ${user.fullName}');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }
}
