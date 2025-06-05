import 'package:flutter/material.dart';
class ResidenceInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cư trú'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to temporary residence declaration page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TemporaryResidenceDeclarationPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information Section
            _buildSectionHeader('Thông tin hành chính'),
            _buildInfoRow('Họ và tên', 'NGUYỄN VĂN A'),
            _buildInfoRow('Số định danh cá nhân', '082304011223'),
            _buildInfoRow('Giới tính', 'Nam'),
            _buildInfoRow('Ngày sinh', '23-07-2004'),
            _buildInfoRow('Dân tộc', 'Kinh'),
            _buildInfoRow('Tôn giáo', 'Không'),
            _buildInfoRow('Quốc tịch', 'Việt Nam'),
            _buildInfoRow('Quê quán', '13/4 Võ Văn Tần, Phường 5, Thành phố Mỹ Tho, Tỉnh Tiền Giang'),
            _buildInfoRow('Trạng thái công dân', 'Còn sống'),
            
            Divider(height: 24, thickness: 1),
            
            // Residence Information Section
            _buildSectionHeader('Thông tin cư trú'),
            _buildInfoRow('Nơi thường trú', '13/4 Võ Văn Tần, Phường 5, Thành phố Mỹ Tho, Tỉnh Tiền Giang'),
            _buildInfoRow('Nơi tạm trú', '140 Lê Trọng Tấn, Phường Tây Thạnh, Quận Tân Phú, Thành phố Hồ Chí Minh'),
            _buildInfoRow('Nơi ở hiện tại', '140 Lê Trọng Tấn, Phường Tây Thạnh, Quận Tân Phú, Thành phố Hồ Chí Minh'),
            _buildInfoRow('Họ và tên chủ hộ', 'NGUYỄN VĂN B'),
            _buildInfoRow('Số định danh cá nhân chủ hộ', '082072017788'),
            _buildInfoRow('Quan hệ với chủ hộ', 'Con đẻ'),
            _buildInfoRow('Thành viên khác trong hộ gia đình', '3 người'),
            
            SizedBox(height: 20),
            // Button to add temporary residence (alternative to app bar icon)
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Khai báo tạm trú tạm vắng'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TemporaryResidenceDeclarationPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12, top: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value.isEmpty ? 'Chưa có thông tin' : value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(height: 16, thickness: 0.5),
        ],
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class TemporaryResidenceDeclarationPage extends StatefulWidget {
  @override
  _TemporaryResidenceDeclarationPageState createState() => _TemporaryResidenceDeclarationPageState();
}

class _TemporaryResidenceDeclarationPageState extends State<TemporaryResidenceDeclarationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _currentAddressController = TextEditingController();
  final TextEditingController _tempAddressController = TextEditingController();
  final TextEditingController _hostNameController = TextEditingController();
  final TextEditingController _hostIdNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khai báo tạm trú tạm vắng'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Thông tin người khai báo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Họ và tên',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập họ và tên';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _idNumberController,
                decoration: const InputDecoration(
                  labelText: 'Số CCCD',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số CCCD';
                  }
                  if (value.length != 12) {
                    return 'Số CCCD phải có 12 chữ số';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _currentAddressController,
                decoration: const InputDecoration(
                  labelText: 'Địa chỉ hiện tại',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập địa chỉ hiện tại';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _tempAddressController,
                decoration: const InputDecoration(
                  labelText: 'Địa chỉ đăng ký tạm trú tạm vắng',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập địa chỉ tạm trú/tạm vắng';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Thông tin chủ hộ tạm trú',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hostNameController,
                decoration: const InputDecoration(
                  labelText: 'Họ và tên chủ hộ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập họ tên chủ hộ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _hostIdNumberController,
                decoration: const InputDecoration(
                  labelText: 'Số CCCD chủ hộ',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số CCCD chủ hộ';
                  }
                  if (value.length != 12) {
                    return 'Số CCCD phải có 12 chữ số';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đang gửi khai báo...')),
                    );
                    // Quay về trang thông tin cư trú
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Gửi xác nhận'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _idNumberController.dispose();
    _currentAddressController.dispose();
    _tempAddressController.dispose();
    _hostNameController.dispose();
    _hostIdNumberController.dispose();
    super.dispose();
  }
}