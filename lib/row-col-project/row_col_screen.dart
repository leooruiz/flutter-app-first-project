import 'package:flutter/material.dart';

class RowColScreen extends StatefulWidget {
  const RowColScreen({super.key});

  @override
  State<RowColScreen> createState() => _RowColScreenState();
}

class _RowColScreenState extends State<RowColScreen> {
  bool isRow = true;

  String layoutTypeString = 'Row';
  int layoutTypeCounter = 0;

  String mainAxisTypeString = 'Center';
  int mainAxisCounter = 0;
  MainAxisAlignment mainAxisType = MainAxisAlignment.center;

  String mainAxisSizeString = 'Max';
  int mainAxisSizeCounter = 0;
  MainAxisSize mainAxisSizeType = MainAxisSize.max;

  String crossAxisString = 'Center';
  int crossAxisCounter = 0;
  CrossAxisAlignment crossAxisType = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Row/Col',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 100, width: 100, color: Colors.purple),
              Container(height: 100, width: 100, color: Colors.teal),
              Container(height: 100, width: 100, color: Colors.indigo),
              
            ],
          ),
        ],
      ),
    );
  }
}
