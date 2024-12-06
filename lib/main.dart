// Импорт библиотеки Flutter для создания интерфейса
import 'package:flutter/material.dart';
// Импорт экрана домашней страницы приложения из отдельного файла
import 'screens/home_screen.dart';

// Главная функция приложения, которая запускает приложение
void main() {
  runApp(const MyApp()); // Запускает приложение с корневым виджетом MyApp
}

// Класс MyApp, который представляет основное приложение
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Конструктор без состояния

  // Метод build, который строит интерфейс приложения
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Отключает баннер "Debug"
      home: HomeScreen(), // Указывает начальный экран приложения
    );
  }
}
