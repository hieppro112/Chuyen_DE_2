import 'package:flutter/material.dart';
import 'package:giao_tiep_sv_admin/Admin/duyet_bai_viet_admin/model/post_model.dart';
import 'package:giao_tiep_sv_admin/Admin/duyet_bai_viet_admin/widget/post_card.dart';

class AdminPostManagementScreen extends StatefulWidget {
  @override
  _AdminPostManagementScreenState createState() =>
      _AdminPostManagementScreenState();
}

class _AdminPostManagementScreenState extends State<AdminPostManagementScreen> {
  List<Post> posts = [
    Post(
      id: '1',
      author: 'Cao Quang Khanh',
      group: 'Điện - Điện tử',
      title: 'Ngày đầu tiên đi học tại TDC',
      content:
          'Hôm nay là ngày đầu tiên tôi đi học tại trường TDC. Mọi thứ thật mới mẻ và thú vị...',
      imageUrl:
          'https://static.chotot.com/storage/chotot-kinhnghiem/nha/2024/10/3f900290-cong-nghe-thu-duc.jpeg',
      status: PostStatus.pending,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Post(
      id: '2',
      author: 'Lê Đình Thuận',
      group: 'Khoa CNTT',
      title: 'Tìm người đi xem phim chung',
      content: ' Tôi đã gặp nhiều bạn bè mới...',
      imageUrl:
          'https://sm.pcmag.com/t/pcmag_au/help/h/how-to-wat/how-to-watch-dragon-ball-z-and-the-entire-franchise-in-order_xs33.1920.jpg',
      status: PostStatus.pending,
      createdAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    Post(
      id: '3',
      author: 'Lê Đại Hiệp',
      group: 'Kinh tế',
      title: 'Trải nghiệm học tập tại TDC',
      content: 'Môi trường học tập tại TDC rất chuyên nghiệp và thân thiện...',
      imageUrl:
          'https://nghenghiepcuocsong.vn/wp-content/uploads/2024/06/11.jpg',
      status: PostStatus.pending,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
    ),
    Post(
      id: '4',
      author: 'Phạm Thắng ',
      group: 'Cơ khí',
      title: 'Hoạt động ngoại khóa tại TDC',
      content: 'Các hoạt động ngoại khóa tại trường rất đa dạng và bổ ích...',
      imageUrl:
          'https://topxephang.com/wp-content/uploads/2017/11/truong-cao-dang-cong-nghe-thu-duc.png',
      status: PostStatus.pending,
      createdAt: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  // Biến quản lý bộ lọc
  PostFilterType _currentFilter = PostFilterType.all;
  String? _currentGroupFilter;

  void _approvePost(int index) {
    setState(() {
      posts[index].status = PostStatus.approved;
    });
    _showSnackBar('Đã duyệt bài viết của ${posts[index].author}');
  }

  void _rejectPost(int index) {
    setState(() {
      posts[index].status = PostStatus.rejected;
    });
    _showSnackBar('Đã từ chối bài viết của ${posts[index].author}');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  // Lấy danh sách nhóm duy nhất (đã sửa lỗi sort)
  List<String> get uniqueGroups {
    final groups = posts.map((p) => p.group).toSet().toList()..sort();
    return ['Tất cả nhóm', ...groups];
  }

  // Lọc bài viết
  List<Post> get filteredPosts {
    List<Post> result = posts;

    // Lọc theo trạng thái
    switch (_currentFilter) {
      case PostFilterType.pending:
        result = result
            .where((post) => post.status == PostStatus.pending)
            .toList();
        break;
      case PostFilterType.approved:
        result = result
            .where((post) => post.status == PostStatus.approved)
            .toList();
        break;
      case PostFilterType.rejected:
        result = result
            .where((post) => post.status == PostStatus.rejected)
            .toList();
        break;
      case PostFilterType.all:
        break;
    }

    // Lọc theo nhóm
    if (_currentGroupFilter != null && _currentGroupFilter != 'Tất cả nhóm') {
      result = result
          .where((post) => post.group == _currentGroupFilter)
          .toList();
    }

    return result;
  }

  int get pendingPostsCount =>
      posts.where((post) => post.status == PostStatus.pending).length;
  int get approvedPostsCount =>
      posts.where((post) => post.status == PostStatus.approved).length;
  int get rejectedPostsCount =>
      posts.where((post) => post.status == PostStatus.rejected).length;

  @override
  Widget build(BuildContext context) {
    final safeGroupValue = uniqueGroups.contains(_currentGroupFilter)
        ? _currentGroupFilter
        : 'Tất cả nhóm';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Duyệt bài viết',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header và Dropdown cùng hàng
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Hai dropdown
                Row(
                  children: [
                    // Dropdown trạng thái
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<PostFilterType>(
                          value: PostFilterType.values.contains(_currentFilter)
                              ? _currentFilter
                              : PostFilterType.all,
                          onChanged: (PostFilterType? newValue) {
                            setState(() => _currentFilter = newValue!);
                          },
                          isExpanded: true,
                          underline: SizedBox(),
                          items: [
                            DropdownMenuItem(
                              value: PostFilterType.all,
                              child: Text('Tất cả (${posts.length})'),
                            ),
                            DropdownMenuItem(
                              value: PostFilterType.pending,
                              child: Text('Chờ duyệt ($pendingPostsCount)'),
                            ),
                            DropdownMenuItem(
                              value: PostFilterType.approved,
                              child: Text('Đã duyệt ($approvedPostsCount)'),
                            ),
                            DropdownMenuItem(
                              value: PostFilterType.rejected,
                              child: Text('Từ chối ($rejectedPostsCount)'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    // Dropdown nhóm
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: safeGroupValue ?? 'Tất cả nhóm',
                          onChanged: (String? newValue) {
                            setState(() {
                              _currentGroupFilter = newValue == 'Tất cả nhóm'
                                  ? null
                                  : newValue;
                            });
                          },
                          isExpanded: true,
                          underline: SizedBox(),
                          items: uniqueGroups.map((String group) {
                            return DropdownMenuItem<String>(
                              value: group,
                              child: Text(group),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // hien thi ket qua
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Có ${filteredPosts.length} bài viết phù hợp',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Danh sách bài viết
          Expanded(
            child: filteredPosts.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: filteredPosts.length,
                    itemBuilder: (context, index) {
                      final post = filteredPosts[index];
                      final originalIndex = posts.indexWhere(
                        (p) => p.id == post.id,
                      );
                      return PostCard(
                        post: post,
                        onApprove: () => _approvePost(originalIndex),
                        onReject: () => _rejectPost(originalIndex),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.article_outlined, size: 64, color: Colors.grey[300]),
        SizedBox(height: 16),
        Text(
          _getEmptyStateMessage(),
          style: TextStyle(color: Colors.grey[500], fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  String _getEmptyStateMessage() {
    switch (_currentFilter) {
      case PostFilterType.pending:
        return 'Không có bài viết nào đang chờ duyệt';
      case PostFilterType.approved:
        return 'Không có bài viết nào đã được duyệt';
      case PostFilterType.rejected:
        return 'Không có bài viết nào bị từ chối';
      case PostFilterType.all:
        return 'Không có bài viết nào';
    }
  }
}

// Enum cho các loại bộ lọc
enum PostFilterType { all, pending, approved, rejected }
