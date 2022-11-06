import 'package:flutter/material.dart';
import 'package:keyboard_with_done/keyboard_with_done.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numeric Keyboard with Done Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestMyPackage(),
    );
  }
}

class TestMyPackage extends StatefulWidget {
  const TestMyPackage({Key? key}) : super(key: key);

  @override
  State<TestMyPackage> createState() => _TestMyPackageState();
}

class _TestMyPackageState extends State<TestMyPackage> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('testing'),
      ),
      body: SizedBox(
        height:50 ,
        child: CustomIosKeyboard(
          focusNode: focusNode,
          doneTextStyle:const TextStyle(
            color: Colors.black
          ), controller: controller,
          onChanged: (val){

          },
          decoration:  const InputDecoration(
            counterText: '',
            prefixIcon: Align(
                alignment: Alignment(-1.5, 0),
                child: Icon(
                  Icons.currency_pound,
                  color: Colors.black,
                  size: 20,
                )),
            prefixIconConstraints: BoxConstraints(maxWidth: 25),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: 'Enter custom value',
            hintStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          ),
          cursorColor: Colors.red,
        ),
      ),
    );
  }
}
