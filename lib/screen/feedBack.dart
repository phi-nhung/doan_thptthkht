import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PhanAnhScreen extends StatefulWidget {
  const PhanAnhScreen({Key? key}) : super(key: key);

  @override
  State<PhanAnhScreen> createState() => _PhanAnhScreenState();
}

class _PhanAnhScreenState extends State<PhanAnhScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tenController = TextEditingController();
  final _tieuDeController = TextEditingController();
  final _noiDungController = TextEditingController();
  String? _loaiPhanAnh;
  File? _hinhAnh;

  final List<String> _dsLoaiPhanAnh = [
    'Sai thông tin cá nhân',
    'Vấn đề kỹ thuật',
    'Góp ý hệ thống',
    'Khác'
  ];

  Future<void> _chonHinhAnh() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _hinhAnh = File(picked.path);
      });
    }
  }

  void _guiPhanAnh() {
    if (_formKey.currentState!.validate()) {
      final phanAnh = {
        'ten': _tenController.text.trim(),
        'tieuDe': _tieuDeController.text.trim(),
        'noiDung': _noiDungController.text.trim(),
        'loai': _loaiPhanAnh,
        'thoiGian': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        'hinhAnh': _hinhAnh?.path ?? '',
      };

      // TODO: Gọi DatabaseHelper.insertPhanAnh(phanAnh)

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Phản ánh đã được gửi'),
          content: const Text('Cảm ơn bạn đã gửi phản ánh!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
                setState(() {
                  _loaiPhanAnh = null;
                  _hinhAnh = null;
                });
              },
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gửi phản ánh',style: TextStyle(color: Colors.white, fontSize: 30),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor:Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Thông tin phản ánh", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 12),
              TextFormField(
                controller: _tenController,
                decoration: const InputDecoration(
                  labelText: 'Họ và tên',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Vui lòng nhập họ tên' : null,
              ),

              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _loaiPhanAnh,
                items: _dsLoaiPhanAnh
                    .map((loai) => DropdownMenuItem(value: loai, child: Text(loai)))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'Loại phản ánh',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() => _loaiPhanAnh = value);
                },
                validator: (value) =>
                    value == null ? 'Vui lòng chọn loại phản ánh' : null,
              ),

              const SizedBox(height: 12),
              TextFormField(
                controller: _tieuDeController,
                decoration: const InputDecoration(
                  labelText: 'Tiêu đề phản ánh',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Vui lòng nhập tiêu đề' : null,
              ),

              const SizedBox(height: 12),
              TextFormField(
                controller: _noiDungController,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: 'Nội dung chi tiết',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) => value!.isEmpty ? 'Vui lòng nhập nội dung' : null,
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _chonHinhAnh,
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text('Đính kèm hình',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 42, 53, 170),
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (_hinhAnh != null)
                    Text(
                      'Đã chọn ảnh',
                      style: const TextStyle(color: Colors.green),
                    ),
                ],
              ),

              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _guiPhanAnh,
                  icon: const Icon(Icons.send,color: Colors.white,),
                  label: const Text('Gửi phản ánh',style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 42, 53, 170),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
