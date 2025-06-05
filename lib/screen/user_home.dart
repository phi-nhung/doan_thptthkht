import 'package:doan/screen/account.dart';
import 'package:doan/screen/feedBack.dart';
import 'package:doan/screen/traCuuThue.dart';
import 'package:flutter/material.dart';
import 'package:doan/screen/khaibaotttv.dart';
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
              backgroundImage: AssetImage('assets/images/5556499.png'),
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
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trongdong.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5,
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
                    image: AssetImage('assets/images/home.jpg'),
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
        child: InkWell(
          onTap: () {
            print('Card tapped: ' + title);
            if (title.trim().contains('Thông tin lưu trú')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResidenceInfoPage(

                  ),
                ),
              );
            }
            if (title.trim().contains('Tài khoản')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Account(

                  ),
                ),
              );
            }
            if (title.trim().contains('Phản ánh')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhanAnhScreen(

                  ),
                ),
              );
            }
            if (title.trim().contains('Tra cứu thuế')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TraCuuThueScreen(

                  ),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Color.fromARGB(255, 42, 53, 170)),
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
      ),
    );
  }
  Widget _buildIconColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 42, 53, 170),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 30, color: Colors.white),
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: 80, // Cố định chiều rộng
        height: 34, // ⚠️ Cố định chiều cao để text dài hay ngắn đều không lệch icon
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
  
}
}
