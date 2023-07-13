import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS Flutter API',
      home: ApiDataScreen(),
    );
  }
}

class ApiDataScreen extends StatefulWidget {
  @override
  _ApiDataScreenState createState() => _ApiDataScreenState();
}

class _ApiDataScreenState extends State<ApiDataScreen> {
  List<dynamic> apiData = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://booking.kai.id/api/stations2'));
    if (response.statusCode == 200) {
      setState(() {
        apiData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAS Flutter API - KAI (Kereta Api Indonesia)'),
      ),
      body: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    color: const Color.fromARGB(255, 33, 243, 173),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: const Color.fromARGB(255, 33, 243, 173),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: const Color.fromARGB(255, 33, 243, 173),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'City',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: const Color.fromARGB(255, 33, 243, 173),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'City Name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            for (var data in apiData)
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(8.0),
                      child: Text(data['code']),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(8.0),
                      child: Text(data['name']),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(8.0),
                      child: Text(data['city']),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.all(8.0),
                      child: Text(data['cityname']),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
