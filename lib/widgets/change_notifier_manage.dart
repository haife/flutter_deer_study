import 'package:flutter/material.dart';

mixin ChangeNotifieMixin<T extends StatefulWidget> on State<T> {
  Map<ChangeNotifier?, List<VoidCallback>?>? _map;
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier();

  @override
  void initState() {
    _map = changeNotifier();
    _map?.forEach((notifier, callback) {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
