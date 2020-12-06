import 'package:flutter/material.dart';
import 'package:car_service/CostEstimation/taskScreen.dart';
import 'package:car_service/CostEstimation/task_data.dart';
import 'package:provider/provider.dart';


class Cost extends StatefulWidget {
  @override
  _CostState createState() => _CostState();
}

class _CostState extends State<Cost> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
