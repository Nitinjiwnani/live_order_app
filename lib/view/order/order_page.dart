import 'package:flutter/material.dart';
import 'package:live_order_app/view/order/widgets/order_tab.dart';
import 'package:live_order_app/view/order/widgets/completed_tab.dart';
import 'package:live_order_app/view/order/widgets/return_tab.dart';
import 'package:live_order_app/view/order/widgets/shipping_tab.dart';
import 'package:live_order_app/view/order/widgets/tab_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.blueGrey,
          tabs: const [
            Tab(
              child: TabItem(
                icon: Icons.assignment,
                text: 'Order',
              ),
            ),
            Tab(
              child: TabItem(
                icon: Icons.local_shipping,
                text: 'Shipping',
              ),
            ),
            Tab(
              child: TabItem(
                icon: Icons.assignment_return,
                text: 'Return',
              ),
            ),
            Tab(
              child: TabItem(
                icon: Icons.check_circle,
                text: 'Completed',
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          OrderTab(),
          ShippingTab(),
          ReturnTab(),
          CompletedTab(),
        ],
      ),
    );
  }
}
