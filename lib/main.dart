import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 이 줄을 추가해야 합니다.
import 'calendar_page.dart';
import 'schedule_creation_page.dart';
import 'schedule_modify_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calendar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // 로컬라이제이션 설정을 추가합니다.
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ko', ''), // 한국어 지원
        Locale('en', ''), // 영어 지원 (필요시 추가)
      ],
      home: CalendarPage(),
    );
  }
}