import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:live_order_app/view/home/widgets/dropdown_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Weekly';
  final List<String> dropdownOptions = ['Weekly', 'Monthly', 'Yearly'];
  List<String> images = [
    'assets/images/total_revenue.png',
    'assets/images/online_order.png',
    'assets/images/return_order.png',
    'assets/images/cancelled_order.png',
    'assets/images/in_stock.png',
    'assets/images/out_of_stock.png',
  ];

  List<String> texts = [
    'Total Revenue',
    'Online Order',
    'Return Order',
    'Cancelled Orders',
    'In Stock Product',
    'Out of Stock Product',
  ];
  List<String> values = [
    '₹770',
    '#234',
    '#100',
    '#100',
    '#100',
    '#100',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                    child: Text(
                      'Product Sales',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 6),
                    child: Row(
                      children: [
                        const Text('Total Product Sales'),
                        const Spacer(),
                        CustomDropdown(
                          dropdownValue: dropdownValue,
                          dropdownOptions: dropdownOptions,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    height: 220,
                    width: double.infinity,
                    child: BarChart(
                      BarChartData(
                        borderData: FlBorderData(
                          border: const Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                          ),
                        ),
                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles:
                                SideTitles(showTitles: true, reservedSize: 28),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const style = TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                );
                                String text = getLabelText(value.toInt());
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(text, style: style),
                                );
                              },
                              reservedSize: 28,
                            ),
                          ),
                        ),
                        groupsSpace: 10,
                        barGroups: [
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 10,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 10,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 15,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 10,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 11,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 10,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                          BarChartGroupData(x: 7, barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: 10,
                              width: 15,
                              color: Colors.green,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.7 / 1,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.green.shade100,
                            child: Image.asset(images[index],
                                height: 20, width: 20),
                          ),
                          const SizedBox(height: 6),
                          Flexible(
                            child: Text(
                              texts[index],
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Flexible(
                            child: Text(
                              values[index],
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getLabelText(int value) {
    switch (dropdownValue) {
      case 'Monthly':
        switch (value) {
          case 1:
            return 'Jan';
          case 2:
            return 'Feb';
          case 3:
            return 'Mar';
          case 4:
            return 'Apr';
          case 5:
            return 'May';
          case 6:
            return 'Jun';
          case 7:
            return 'Jul';
          case 8:
            return 'Aug';
          case 9:
            return 'Sep';
          case 10:
            return 'Oct';
          case 11:
            return 'Nov';
          case 12:
            return 'Dec';
          default:
            return '';
        }
      case 'Yearly':
        return (value + 2020).toString();
      case 'Weekly':
        switch (value) {
          case 1:
            return 'Sun';
          case 2:
            return 'Mon';
          case 3:
            return 'Tue';
          case 4:
            return 'Wed';
          case 5:
            return 'Thu';
          case 6:
            return 'Fri';
          case 7:
            return 'Sat';
          default:
            return '';
        }
      default:
        return '';
    }
  }
}
