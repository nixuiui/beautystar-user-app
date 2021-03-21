import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/database/hive_db.dart';
import 'package:beautystar_user_app/ui/custom_dialogs/setup_dialog_ui.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_button.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/router.gr.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await HiveDB.init();
  
  setupLocator();
  setupDialogUI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    var navigatorKey2 = locator<NavigationService>().navigatorKey;
    return MaterialApp(
      title: 'Beauty Star',
      initialRoute: router.Routes.splashView,
      onGenerateRoute: router.Router().onGenerateRoute,
      navigatorKey: navigatorKey2,
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Color(0xffd46f89),
      accentColor: Color(0xff74a4c0),
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        centerTitle: false,
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black87
          ),
        )
      ),
      dividerTheme: DividerThemeData(
        space: 0
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            NxText.primary("text"),
            NxButton()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
