import 'package:flutter/material.dart';

class TinTucPage extends StatelessWidget {
  const TinTucPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> newsList = [
      {
        "title": "Thông báo bảo trì hệ thống",
        "image": "assets/images/baotri.jpg",
        "desc": "Thông báo bảo trì hệ thống định danh điện tử (Từ 23h00’ ngày 19/05/2025 đến 07h00’ ngày 20/05/2025)",
        "views": 44751,
        "date": "19-05-2025",
        "favorite": false,
      },
      {
        "title": "HƯỚNG DẪN ĐĂNG KÝ ĐỊNH DANH TỔ CHỨC TRÊN VNEID",
        "image": "assets/images/huongdan.jpg",
        "desc": "Tài khoản định danh điện tử cơ quan, tổ chức",
        "views": 12345,
        "date": "18-05-2025",
        "favorite": true,
      },
      {
        "title": "Công an triển khai cấp CCCD gắn chip trên toàn quốc",
        "image": "assets/images/cccd.jpg",
        "desc": "Bộ Công an triển khai cấp căn cước công dân gắn chip điện tử cho người dân trên toàn quốc từ tháng 6/2025.",
        "views": 30500,
        "date": "10-05-2025",
        "favorite": false,
      },
      {
        "title": "Khuyến cáo bảo mật thông tin cá nhân trên môi trường số",
        "image": "assets/images/baomat.jpg",
        "desc": "Cơ quan chức năng khuyến cáo người dân nâng cao cảnh giác, bảo vệ thông tin cá nhân khi sử dụng dịch vụ số.",
        "views": 15800,
        "date": "05-05-2025",
        "favorite": false,
      },
      {
        "title": "Hướng dẫn sử dụng dịch vụ công trực tuyến",
        "image": "assets/images/dichvucong.jpg",
        "desc": "Người dân có thể thực hiện các thủ tục hành chính nhanh chóng qua Cổng dịch vụ công quốc gia.",
        "views": 22100,
        "date": "01-05-2025",
        "favorite": true,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tin tức",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Thanh tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      "Nổi bật",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text("Tin tức", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 12),
                  const Text("Loa phường", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 12),
                  const Text("Văn hóa - Du lịch", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 12),
                  const Text("Đặc sản vùng miền", style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 12),
                  const Text("Du lịch địa phương", style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          // Bookmark
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.bookmark_border, color: Colors.blue),
                SizedBox(width: 6),
                Text(
                  "Xem danh sách bài viết quan tâm",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Divider(),
          // Danh sách tin tức
          Expanded(
            child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tiêu đề
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Text(
                            news["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        // Ảnh
                        if (news["image"] != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                news["image"],
                                fit: BoxFit.cover,
                                height: 140,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        // Mô tả
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Text(
                            news["desc"],
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        // Thông tin phụ
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Row(
                            children: [
                              const Icon(Icons.remove_red_eye, size: 18, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                "${news["views"]}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                news["date"],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const Spacer(),
                              Icon(
                                news["favorite"] ? Icons.bookmark : Icons.bookmark_border,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}