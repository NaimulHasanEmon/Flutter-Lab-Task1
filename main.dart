import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  String _inputText = "";

  void _updateInputText() {
    setState(() {
      _inputText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Flutter Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Align images to the center
              children: <Widget>[
                Image.asset('assets/images/Pokemon-Ash-Pikachu.jpg',
                    height: 200),
                SizedBox(width: 10), // Space between images
                Image.asset('assets/images/pikachu2.jpg', height: 200),
              ],
            ),
            SizedBox(height: 10), // image and text gap
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Mr. Pikachu from Pokaemon here...',
                floatingLabelBehavior: FloatingLabelBehavior
                    .never, // Prevents the label from floating
                border:
                    InputBorder.none, // Ensures no border or underline appears
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              onChanged: (text) {
                _updateInputText();
              },
            ),

            SizedBox(height: 30),
            Text(
              'Hello, $_inputText!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double _sliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Slider Value: ${_sliderValue.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              child: Text('Go to Third Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<String> _items = [];
  TextEditingController _itemController = TextEditingController();

  void _addItem() {
    if (_itemController.text.isNotEmpty) {
      setState(() {
        _items.add(_itemController.text);
        _itemController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page - List View')),
      body: Column(
        children: [
          TextField(
            controller: _itemController,
            decoration: InputDecoration(labelText: 'Enter item to add'),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: _addItem, child: Text('Add Item')),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Align images to the center
            children: <Widget>[
              Image.asset('assets/images/Pokemon-Ash-Pikachu.jpg', height: 200),
              SizedBox(width: 10), // Space between images
              Image.asset('assets/images/pikachu2.jpg', height: 200),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back to Second Page'),
          ),
        ],
      ),
    );
  }
}
