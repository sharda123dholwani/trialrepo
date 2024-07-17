import 'package:dart_define_prac/dart_define_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:download_assets/download_assets.dart';
void main() {
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

  void init() async {
    await downloadAssetsController.init(assetDir: 'assets', useFullDirectoryPath: false );
    downloaded = await downloadAssetsController.assetsDirAlreadyExists();
    setState(() {
      downloaded;
    });
    print("downloaded: $downloaded");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

        }, child:const Text("Call an API")),
      ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
