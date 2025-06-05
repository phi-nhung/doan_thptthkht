import 'package:flutter/material.dart';
import 'user_home.dart'; // Import trang UserHome

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(          
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  backgroundColor: Colors.transparent,
                 // Transparent background
                ),
                const Text(
                  'Xin chào!',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Vui lòng đăng nhập để tiếp tục',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                 TextField(
                  decoration: InputDecoration(
                    
                    labelText: 'Số CCCD/CMND',
                    labelStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  
                ),
                const SizedBox(height: 10),
                 TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    labelStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Đăng nhập thành công, chuyển sang trang user_home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => UserHome()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Full width button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.blue, // Button color
                  ), 
                  child: Text('Đăng nhập', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: (){}, 
                  child:Text('Quên mật khẩu?', style: TextStyle(color: Colors .brown, fontSize: 20),)
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn chưa có tài khoản?', style: TextStyle(fontSize: 20)),
                    
                    TextButton(
                      onPressed: (){}, 
                      child:Text('Đăng ký?', style: TextStyle(color: Colors.red, fontSize: 20),)
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}