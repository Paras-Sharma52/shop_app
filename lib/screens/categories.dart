import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> catitems = ['HOME', 'ORDERS', 'SELL'];

  int selected = 0;
  Widget buildcutombar(var index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            catitems[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: selected == index ? Colors.purple : Colors.transparent,
            ),
          ),
          Column(
            children: [
              Container(
                color: selected == index ? Colors.black : Colors.transparent,
                height: 8,
                width: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: catitems.length,
        itemBuilder: ((context, index) {
          return buildcutombar(index);
        }),
      ),
    );
  }
}
