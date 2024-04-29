import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/dashboard_screen/sale_chart/chart_sale_data.dart';
import 'package:oohapp/presentation/e_home_page/dashboard_screen/sale_chart/model/chart_sale_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
/*

class SaleChart extends StatelessWidget {
  SaleChart({super.key});

  final ChartSaleData chartSaleData = ChartSaleData();

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(
        alignment: ChartAlignment.near,
        //  text: CustomText.headlineText(text: 'Weekly chart'),
        text: 'Weekly sale',
      ),
      primaryXAxis: CategoryAxis(),

     /// I comment this due to error after update package


     */
/* series: <ChartSeries>[
        BarSeries<SaleData, String>(
          dataSource: chartSaleData.getChartData(),
          xValueMapper: (SaleData sales, _) => sales.weekDay,
          yValueMapper: (SaleData sales, _) => sales.amount,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
        //  FastLineSeries(dataSource: chartSaleData.getChartData(), xValueMapper: , yValueMapper: yValueMapper)
      ],*//*


      ///
    );
    */
/* return SfCartesianChart(
      title: ChartTitle(text: 'Weekly Sale'),
      primaryXAxis: NumericAxis(
        // Set labels for the X-axis
        interval: 30, // Adjust interval as needed
        labelFormat: '{value}k',
      ),
      primaryYAxis: NumericAxis(),
      series: <ChartSeries>[
        BarSeries<SaleData, String>(
          dataSource: chartSaleData.getChartData(),
          xValueMapper: (SaleData sales, _) => sales.amount,
          yValueMapper: (SaleData sales, _) => sales.weekDay,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
*//*

  }
}
*/





