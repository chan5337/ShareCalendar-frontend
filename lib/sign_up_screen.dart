import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  String? _errorMessage;

  void _validateInputs() {
    // 빈 칸 체크
    if (_idController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordCheckController.text.isEmpty ||
        _nicknameController.text.isEmpty) {
      setState(() {
        _errorMessage = '모든 항목을 입력해주세요.';
      });
      return;
    }

    // 비밀번호 일치 체크
    if (_passwordController.text != _passwordCheckController.text) {
      setState(() {
        _errorMessage = '비밀번호와 비밀번호 확인 칸이 같지 않습니다.';
      });
      return;
    }

    // 모든 검증 통과
    setState(() {
      _errorMessage = null;
    });

    // 여기에 실제 회원가입 로직이 들어갈 예정
    // 지금은 단순히 로그인 화면으로 돌아가기
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Icon(
                Icons.sync,
                size: 80,
                color: Colors.green[400],
              ),
              const SizedBox(height: 20),
              const Text(
                '너와 나의 Memory',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              TextField(
                controller: _idController,
                decoration: const InputDecoration(
                  hintText: '아이디',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '비밀번호',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordCheckController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '비밀번호 체크',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nicknameController,
                decoration: const InputDecoration(
                  hintText: '닉네임',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _validateInputs,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _passwordCheckController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }
}