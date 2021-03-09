import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticsPage extends StatefulWidget {
  var mymap = Map();
  StatisticsPage(this.mymap);
  StatisticsPageState createState() => StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: height / 50),
              Text(
                "Résultats de l'élection des ambassadeurs",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: height / 20,
                ),
              ),
              SizedBox(height: height / 10),
              PieChart(
                dataMap: widget.mymap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: height / 2.5,
                initialAngleInDegree: 0,
                ringStrokeWidth: 32,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
