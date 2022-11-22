import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDateProvider = Provider<DateTime>((ref) {
  return DateTime.now();
});

final navigationBarProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDateProvider);
    int navigationBarIndex = ref.watch(navigationBarProvider);
    return Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(indicatorColor: Colors.blue),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.grey,
            selectedIndex: navigationBarIndex,
            onDestinationSelected: (index) =>
                {ref.read(navigationBarProvider.notifier).state = index},
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.email_outlined), label: 'Email'),
              NavigationDestination(
                  icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
              NavigationDestination(
                  icon: Icon(Icons.people_outline_outlined), label: 'Space'),
              NavigationDestination(
                  icon: Icon(Icons.meeting_room), label: 'Meet'),
            ],
          ),
        ),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(''),
        ),
        body: Center(
          child: Text(
            date.toIso8601String(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ));
  }
}
