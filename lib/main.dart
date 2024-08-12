import 'package:dart_define_prac/dart_define_class.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:download_assets/download_assets.dart';
import 'package:firebase_core/firebase_core.dart';

//final dbHelper = DatabaseHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DownloadAssetsController downloadAssetsController = DownloadAssetsController();
  bool downloaded = false;


  void makeApiCall() {
    String s = DartDefine.stringValue;
    print(s);

    String test = const String.fromEnvironment("key-take");
    print("name: $test");
    String test1 = const String.fromEnvironment("key-take2");
    print("name: $test $test1");
  }

  // void insertIntoDatabase() async {
  //   await dbHelper.insertData({
  //     "name":"sharda",
  //     "id" : 1
  //   });
  //
  //   await dbHelper.queryRows();
  // }

  void init() async {
    await downloadAssetsController.init(assetDir: 'assets', useFullDirectoryPath: false );
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
    setState(() {
      downloaded;
    });
    print("downloaded: $downloaded");
  }
  //
  // void databaseInitialize() async {
  //   await dbHelper.init();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // databaseInitialize();
    makeApiCall();
    init();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          //insertIntoDatabase();
          FirebaseCrashlytics.instance.crash();
        }, child:const Text("insert ")),
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

