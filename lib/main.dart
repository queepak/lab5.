import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  final _formKey = GlobalKey<FormState>();

  double res = 0.0;
  double width = 0.0;
  double height = 0.0;

  void _calculation () {
    setState(() {
      res = height * width;
      if(_formKey.currentState!.validate() ) {

      }
    });
  }

  _changeHeight (String number) {
    setState(() => height = double.tryParse(number) ?? 0.0);
  }
  _changeWidth (String number){
    setState(() => width = double.tryParse(number) ?? 0.0 );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child:
              Row(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child:
                    Column(
                      children: const <Widget>[
                        Text('Ширина (мм):', style: TextStyle(fontSize: 17,),),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty) return 'Введите ширину';
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: _changeHeight,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: '',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child:
              Row(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child:
                    Column(
                      children: const <Widget>[
                        Text('Высота (мм):', style: TextStyle(fontSize: 18,),),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField( validator: (value){
                      if(value!.isEmpty) return 'Введите ширину';
                    },
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: _changeWidth,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: '',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)
                        ),
                      ),
                    ),
                  ),
// const SizedBox(height: 20,)
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _calculation, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    child: const Text('Вычислить'),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  width > 0 && height > 0 && res > 0 && (width * height) == res ? Text('S = $width * $height = $res (мм2)',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 26),)
                      : width > 0 && height > 0 ? const Text('') : const Text('Задайте параметры', style: TextStyle(
                      fontSize: 26))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp (
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.green,
            title: const Text('Калькулятор площади'),
          ),
          body: const MyApp(),
        )
    )
);
