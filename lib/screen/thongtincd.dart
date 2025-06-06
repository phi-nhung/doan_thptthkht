import 'package:flutter/material.dart';

class ThongTinCaNhanPage extends StatelessWidget {
  const ThongTinCaNhanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Màu nền nhạt
    const backgroundColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Thanh tiêu đề
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Thông tin cá nhân",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.qr_code, color: Colors.black, size: 28),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Ảnh đại diện
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/5556499.png'), 
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "NGUYỄN VĂN A",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Định danh mức 2",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.star, color: Colors.red, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Thông tin cá nhân
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoRow("Số CCCD", "06123456789"),
                    infoRow("Giới tính", "Nam"),
                    infoRow("Ngày sinh", "20-07-2002"),
                    infoRow("Số điện thoại", "0987654321"),
                    infoRow("Địa chỉ thường trú", "Tây Ninh, Việt Nam"),
                    infoRow("Địa chỉ tạm trú", "140 Nguyễn Thị Minh Khai, Phường 6, Quận 3, TP. Hồ Chí Minh"),
                    infoRow("Trình độ học vấn", "Đại học"),
                    infoRow("Tình trạng hôn nhân", "Độc thân"),
                    infoRow("Nghề nghiệp", "Kỹ sư phần mềm"),
                  ],
                ),
              ),
            ),
            // Thanh kéo dưới cùng
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              child: Container(
                width: 120,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String label, String value, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}