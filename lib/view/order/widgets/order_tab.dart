import 'package:flutter/material.dart';
import '../../../model/order_model.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  bool isLiveSelected = true;
  List<bool> isExpandedList = List.filled(10, false);

  final List<Order> orders = List.generate(
    10,
    (index) => Order(
      orderId: '46736364',
      timestamp: '${index + 1} min ago',
      items: [
        OrderItem(title: 'Fresho Capsicum 500 gm', quantity: 5, price: 120),
        OrderItem(title: 'Tomato Ketchup 500 gm', quantity: 5, price: 120),
      ],
      customerInfo: CustomerInfo(
        name: 'Nidhi Dobariya',
        phoneNumber: '6351865556',
        address: 'A-2 Parth Society, Ahmedabad',
      ),
      paymentMode: 'Cash on delivery',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 14,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiveSelected = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                      color: isLiveSelected
                          ? Colors.green.withOpacity(0.1)
                          : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Live',
                          style: TextStyle(
                            fontSize: 18,
                            color: isLiveSelected ? Colors.green : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.signal_cellular_alt,
                          color: isLiveSelected ? Colors.green : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiveSelected = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                      color: !isLiveSelected
                          ? Colors.green.withOpacity(0.1)
                          : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Pending',
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                !isLiveSelected ? Colors.green : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.pending,
                          color: !isLiveSelected ? Colors.green : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.signal_cellular_alt_sharp,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Order ID: ${order.orderId}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  order.timestamp,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Title',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text('Q',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Price',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            for (var item in order.items) ...[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(item.title),
                                  ),
                                  Text('${item.quantity}'),
                                  Text('₹${item.price}'),
                                ],
                              ),
                              const SizedBox(height: 4),
                            ],
                            const SizedBox(height: 8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '₹240',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isExpandedList[index] =
                                          !isExpandedList[index];
                                    });
                                  },
                                  icon: const Icon(Icons.person_add_alt),
                                  label: const Text('Customer info'),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpandedList[index] =
                                          !isExpandedList[index];
                                    });
                                  },
                                  icon: isExpandedList[index]
                                      ? const Icon(Icons.arrow_drop_up_rounded)
                                      : const Icon(
                                          Icons.arrow_drop_down_rounded),
                                ),
                              ],
                            ),
                            if (isExpandedList[index])
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Customer info',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(order.customerInfo.name),
                                        const Spacer(),
                                        Text(order.customerInfo.phoneNumber),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(order.customerInfo.address),
                                    const SizedBox(height: 4),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Payment Mode',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'Cash on delivery',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Order Cancelled'),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 12),
                                  ),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Order Processed'),
                                      backgroundColor: Colors.green,
                                    ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 12),
                                  ),
                                  child: const Text(
                                    'Process Order',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
