import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDateProvider = Provider<DateTime>((ref) {
  return DateTime.now();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDateProvider);
    return Scaffold(
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
