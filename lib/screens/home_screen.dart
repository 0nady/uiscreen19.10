// Подключение библиотеки Flutter
import 'package:flutter/material.dart';

// Основная функция, с которой начинается выполнение приложения
void main() {
  runApp(const MyApp()); // Запуск приложения с корневым виджетом MyApp.
}

// Основной класс приложения, наследуемый от StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Конструктор

  // Метод, который возвращает интерфейс приложения
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Отключение баннера "Debug"
      home: HomeScreen(), // Указание домашнего экрана приложения
    );
  }
}

// Основной экран приложения
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FF), // Фон экрана
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Прозрачный фон AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.menu, // Значок "Меню"
            size: 30, // Размер значка
            color: Color(0xFF6E6E6E), // Цвет значка
          ),
          onPressed: () {}, // Кнопка
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle, // Значок "Профиль"
              size: 30,
              color: Color(0xFF6E6E6E),
            ),
            onPressed: () {}, // Кнопка
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Отступы по краям экрана
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание элементов
          children: [
            // Приветственное сообщение
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Привет Надя!", // Приветствие
                  style: TextStyle(
                    fontSize: 24, // Размер текста
                    fontWeight: FontWeight.bold, // Жирный шрифт
                    color: Color(0xFF1C1C1E), // Основной цвет текста
                  ),
                ),
                SizedBox(height: 4), // Отступ между строками
                Text(
                  "Хорошего дня!", // Второстепенное сообщение
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6E6E6E), // Второстепенный цвет текста
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24), // Отступ перед следующим блоком

            // Заголовок "Мои задачи"
            const Text(
              "Мои задачи",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C1C1E),
              ),
            ),
            const SizedBox(height: 16), // Отступ

            // Список задач в виде горизонтальных карточек
            SizedBox(
              height: 200, // Высота контейнера
              child: ListView(
                scrollDirection: Axis.horizontal, // Прокрутка по горизонтали
                children: [
                  // Первая карточка задачи
                  TaskCard(
                    title: "Разработка интерфейса", // Название задачи
                    subtitle: "20 октября 2024", // Дата задачи
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8E44FF), Color(0xFF5E5CE6)], // Градиент фона
                    ),
                  ),
                  const SizedBox(width: 16), // Отступ между карточками
                  TaskCard(
                    title: "Серверная разработка",
                    subtitle: "20 октября 2024",
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB580FF), Color(0xFF947FFF)],
                    ),
                  ),
                  const SizedBox(width: 16),
                  TaskCard(
                    title: "Тестирование приложения",
                    subtitle: "21 октября 2024",
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF6F61), Color(0xFFFF9A7B)],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32), // Отступ перед разделом "Прогресс"
            const Text(
              "Прогресс",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1C1C1E),
              ),
            ),
            const SizedBox(height: 16),

            // Карточки с прогрессом
            ProgressCard(), // Карточка 1
            const SizedBox(height: 8),
            ProgressCard(), // Карточка 2
          ],
        ),
      ),
      // Нижняя навигационная панель
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Фиксированная панель
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Значок "Домой"
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), // Значок "Календарь"
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications), // Значок "Уведомления"
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Значок "Поиск"
            label: '',
          ),
        ],
        selectedItemColor: const Color(0xFF8E44FF), // Цвет выбранного значка
        unselectedItemColor: const Color(0xFF6E6E6E), // Цвет остальных значков
        showSelectedLabels: false, // Скрытие подписей выбранных пунктов
        showUnselectedLabels: false, // Скрытие подписей остальных пунктов
        iconSize: 30, // Размер значков
      ),
    );
  }
}

// Виджет карточки задачи
class TaskCard extends StatelessWidget {
  final String title; // Название задачи
  final String subtitle; // Описание задачи
  final LinearGradient gradient; // Градиент фона

  const TaskCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Ширина карточки
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12), // Скругление углов
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.settings, // Иконка задачи
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// Виджет карточки прогресса
class ProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Лёгкая тень
            blurRadius: 10,
            offset: const Offset(0, 4), // Смещение тени
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.edit, // Иконка прогресса
            color: Color(0xFF8E44FF),
            size: 24,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "Изменения в дизайне", // Описание прогресса
              style: TextStyle(
                color: Color(0xFF1C1C1E),
                fontSize: 16,
              ),
            ),
          ),
          const Icon(
            Icons.more_vert, // Кнопка
            color: Color(0xFF6E6E6E),
            size: 24,
          ),
        ],
      ),
    );
  }
}
