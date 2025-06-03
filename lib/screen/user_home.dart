import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              //backgroundImage: AssetImage('assets/images/pngtree-stereo-blue-gradient-network-security-logo-free-logo-design-template-png-image_5047340.jpg'),
              backgroundColor: Colors.transparent,
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'Nguyễn Văn A',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Icon(Icons.search, size: 30),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_6-hinh-nen-powerpoint-trong-dong.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 0.2 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hinh-anh-welcome-to-vietnam-800x420.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tiện ích khác',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 25), // spacing đầu
                    _buildIconColumn(Icons.electric_bolt_rounded, 'Tiền điện'),
                    const SizedBox(width: 25),
                    _buildIconColumn(Icons.water_drop_rounded, 'Tiền nước'),
                    const SizedBox(width: 25),
                    _buildIconColumn(Icons.health_and_safety, 'Y tế'),
                    const SizedBox(width: 25),
                    _buildIconColumn(Icons.motorcycle, 'Giấy phép\n lái xe'),
                    const SizedBox(width: 25),
                    _buildIconColumn(Icons.credit_card, 'Tài khoản\n ngân hàng'),
                    const SizedBox(width: 25),
                    _buildIconColumn(Icons.wallet, 'Ví\nđiện tử'),
                    const SizedBox(width: 25),
                    _buildIconColumn(Icons.add, 'Xem thêm'),
                    const SizedBox(width: 25),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nhóm dịch vụ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildRow(context, Icons.person_pin_outlined, 'Thông tin công dân', Icons.newspaper, 'Tin tức'),
              const SizedBox(height: 20),
              _buildRow(context, Icons.account_circle_outlined, 'Tài khoản', Icons.support_agent_sharp, 'Phản ánh'),
              const SizedBox(height: 20),
              _buildRow(context, Icons.monetization_on, 'Tra cứu thuế', Icons.house, 'Thông tin lưu trú'),
              const SizedBox(height: 20),
              
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildRow(BuildContext context, IconData icon1, String text1, IconData icon2, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCard(context, icon1, text1),
        _buildCard(context, icon2, text2),
      ],
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.40,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 25, color: Colors.blue),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildIconColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(icon, size: 20, color: Colors.blue),
      ),
      SizedBox(
        width: 80, // Adjust width as needed
        child: Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
  
}
}
