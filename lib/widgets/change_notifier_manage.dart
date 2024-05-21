import 'package:flutter/material.dart';

mixin ChangeNotifierMixin<T extends StatefulWidget> on State<T> {
  Map<ChangeNotifier?, List<VoidCallback>?>? _map;

  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier();

  @override
  void initState() {
    _map = changeNotifier();
    _map?.forEach((changeNotifier, callback) {
      /// 遍历数据，如果callbacks不为空则添加监听
      if (callback != null && callback.isNotEmpty) {
        void addListener(VoidCallback callback) {
          changeNotifier?.addListener(callback);
        }

        callback.forEach(addListener);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _map?.forEach((changeNotifier, callbacks) {
      if (callbacks != null) {
        void removeListener(VoidCallback callback) {
          changeNotifier?.removeListener(callback);
        }

        callbacks.forEach(removeListener);
      }
      changeNotifier?.dispose();
    });
    super.dispose();
  }
}
