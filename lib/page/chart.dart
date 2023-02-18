import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class StackedBarChart extends StatelessWidget {
  final List<charts.Series<SalesData, String>> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
              zeroBound: false, dataIsInWholeNumbers: true)),
    );
  }
}

class SalesData {
  final String year;
  final int sales;
  final charts.Color color;

  SalesData(this.year, this.sales, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

// void main() {
//   final data = [
//     SalesData('2014', 100, Colors.blue),
//     SalesData('2015', 120, Colors.green),
//     SalesData('2016', 140, Colors.orange),
//     SalesData('2017', 160, Colors.red),
//     SalesData('2018', 180, Colors.purple),
//   ];
//
//   final series = [
//     charts.Series(
//       id: 'Sales',
//       domainFn: (SalesData sales, _) => sales.year,
//       measureFn: (SalesData sales, _) => sales.sales,
//       colorFn: (SalesData sales, _) => sales.color,
//       data: data,
//     )
//   ];
//
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Donut Chart'),
//       ),
//       body: Center(
//         child: Container(
//           height: 300,
//           child: DonutChart(series, animate: true),
//         ),
//       ),
//     ),
//   ));
// }

class ChartPage extends StatelessWidget {
   ChartPage({Key? key}) : super(key: key);


  final series = [
    charts.Series(
      id: 'Sales',
      domainFn: (SalesData sales, _) => sales.year,
      measureFn: (SalesData sales, _) => sales.sales,
      colorFn: (SalesData sales, _) => sales.color,
      data: [
        SalesData('2014', 100, Colors.blue),
        SalesData('2015', 120, Colors.green),
        SalesData('2016', 140, Colors.orange),
        SalesData('2017', 160, Colors.red),
        SalesData('2018', 180, Colors.purple),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stacked Chart'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width:300,
          child:StackedBarChart(series, animate: true),
        ),
      ),
    );
  }
}
