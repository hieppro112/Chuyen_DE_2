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
      group: 'khoa CNTT',
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

  // Lấy danh sách bài viết đã lọc
  List<Post> get filteredPosts {
    switch (_currentFilter) {
      case PostFilterType.pending:
        return posts
            .where((post) => post.status == PostStatus.pending)
            .toList();
      case PostFilterType.approved:
        return posts
            .where((post) => post.status == PostStatus.approved)
            .toList();
      case PostFilterType.rejected:
        return posts
            .where((post) => post.status == PostStatus.rejected)
            .toList();
      case PostFilterType.all:
        return posts;
    }
  }

  int get pendingPostsCount {
    return posts.where((post) => post.status == PostStatus.pending).length;
  }

  int get approvedPostsCount {
    return posts.where((post) => post.status == PostStatus.approved).length;
  }

  int get rejectedPostsCount {
    return posts.where((post) => post.status == PostStatus.rejected).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADMIN',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header và Dropdown cùng hàng
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Header Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duyệt bài viết',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Có ${filteredPosts.length} bài viết phù hợp',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                // Dropdown Filter Section
                Container(
                  width: 200, // Hoặc để width cố định
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<PostFilterType>(
                    value: _currentFilter,
                    onChanged: (PostFilterType? newValue) {
                      setState(() {
                        _currentFilter = newValue!;
                      });
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
              ],
            ),
          ),
          // Posts List
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

  Widget _buildEmptyState() {
    return Center(
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
  }

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
