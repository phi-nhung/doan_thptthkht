import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.output_sharp, color: Colors.white, size: 30,),
            onPressed: () {
              // Action when settings icon is pressed
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/trongdong.jpg'),
            fit: BoxFit.cover,
            opacity:0.5,
          ),
        ),
        child: SafeArea(
          child: Center(                                        
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/5556499.png'),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),
                TextButton(onPressed: (){}, child: Text('Đổi ảnh đại diện', style: TextStyle(color: Colors.red, fontSize: 20,fontWeight:FontWeight.bold,))),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            'Họ và tên:',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Nguyễn Văn A',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            'Ngày sinh:',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '28-04-2004',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Icon(Icons.email, size: 30, color: Colors.blue), // Thêm icon email
                          const SizedBox(width: 10),
                          Flexible( // 👈 Cho phép Text co lại và không tràn
                            child: Text(
                              'nguyenvana@gmail.com',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          const Icon(Icons.phone, size: 30, color: Colors.blue), // Thêm icon điện thoại
                          const SizedBox(width: 10),
                          Flexible( // 👈 Cho phép Text co lại và không tràn
                            child: Text(
                              '0112345242',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action when button is pressed
                      },
                      child: const Text('Chỉnh sửa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 42, 53, 170), // Background color
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Action when button is pressed
                      },
                      child: const Text('Đổi mật khẩu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.justify,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 42, 53, 170), // Background color
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}