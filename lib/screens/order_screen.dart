import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart';
import '../widgets/oreder_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Orders>(context, listen: false).fetchOrdersinfo();
  }

  @override
  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, dataSnapshot) =>
            dataSnapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Orders>(
                      builder: (ctx, orderData, child) => ListView.builder(
                        itemCount: orderData.orders.length,
                        itemBuilder: (context, index) =>
                            OrederItem(orderData.orders[index]),
                      ),
                    ),
                  ),
      ),
    );
  }
}
