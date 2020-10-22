// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    ///
    /// todo: 分析入口
    ///
    MultiProvider(
      ///
      /// todo: 初始化 providers 列表
      ///   - 该列表里值, 是层层嵌套关系.
      ///
      providers: [

        ///
        ///  todo: 关键代码
        ///
        ChangeNotifierProvider(create: (_) => Counter()),
      ],

      ///
      /// todo:
      ///
      child: MyApp(),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////
///
/// todo: provider 定义方式:
///
//////////////////////////////////////////////////////////////////////////////

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  ///
  /// todo: value fields:
  ///
  int _count = 0;

  int get count => _count;

  ///
  /// todo: value action:
  ///
  void increment() {
    _count++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  ///
  /// todo: 调试工具 - 分析
  ///
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

//////////////////////////////////////////////////////////////////////////////

///
/// todo:
///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      ///
      ///
      ///
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      ///
      ///
      appBar: AppBar(
        title: const Text('Example'),
      ),

      ///
      ///
      ///
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,

          ///
          /// todo:
          ///
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            ///
            /// todo: 计数器
            ///
            const Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        ///
        /// todo: 点击事件
        ///
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    /// todo: 文本控件 - 值
    ///
    return Text(

        /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
        '${context.watch<Counter>().count}',

        ///
        ///
        ///
        style: Theme.of(context).textTheme.headline4);
  }
}
