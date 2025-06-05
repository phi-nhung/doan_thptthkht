import 'package:flutter/material.dart';

class TraCuuThueScreen extends StatefulWidget {
  const TraCuuThueScreen({super.key});

  @override
  State<TraCuuThueScreen> createState() => _TraCuuThueScreenState();
}

class _TraCuuThueScreenState extends State<TraCuuThueScreen> {
  final _controller = TextEditingController();
  bool _isSearching = false;
  Map<String, String>? _ketQua;

  void _traCuuThongTin() async {
    setState(() {
      _isSearching = true;
      _ketQua = null;
    });

    // Giả lập delay như gọi API / SQLite
    await Future.delayed(const Duration(seconds: 2));

    // Dữ liệu mẫu – bạn có thể thay bằng dữ liệu thực từ SQLite hoặc API
    if (_controller.text.trim() == '123456789') {
      setState(() {
        _ketQua = {
          'Mã số thuế': '123456789',
          'Tên người nộp thuế': 'Nguyễn Văn A',
          'Ngày đăng ký': '12/03/2020',
          'Trạng thái': 'Đang hoạt động',
          'Cơ quan quản lý': 'Chi cục Thuế Quận 1',
        };
      });
    } else {
      setState(() {
        _ketQua = {};
      });
    }

    setState(() => _isSearching = false);
  }

  Widget _buildKetQua() {
    if (_isSearching) {
      return const Center(child: CircularProgressIndicator());
    } else if (_ketQua == null) {
      return const SizedBox.shrink();
    } else if (_ketQua!.isEmpty) {
      return const Center(
        child: Text('Không tìm thấy thông tin thuế.',
            style: TextStyle(color: Colors.red)),
      );
    } else {
      return Card(
        margin: const EdgeInsets.only(top: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: _ketQua!.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text('${entry.key}:',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold))),
                    Expanded(flex: 5, child: Text(entry.value)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tra cứu thông tin thuế', style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Nhập mã số thuế hoặc CCCD để tra cứu:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Nhập mã số thuế...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _traCuuThongTin,
              icon: const Icon(Icons.search,color:Colors.white,),
              label: const Text('Tra cứu', style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 42, 53, 170),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildKetQua()),
          ],
        ),
      ),
    );
  }
}
