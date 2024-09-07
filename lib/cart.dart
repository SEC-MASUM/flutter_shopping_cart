import 'package:my_bag_assignment/product.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final List<Map<String, dynamic>> productList = [
    {
      "name": "Pullover",
      "color": "Black",
      "size": "L",
      "unitPrice": 51,
      "count": 1,
      "imageUrl":
          "https://img.freepik.com/free-photo/mesmerizing-view-silhouette-tree-savanna-plains-sunset_181624-18108.jpg"
    },
    {
      "name": "T-Shirt",
      "color": "Gray",
      "size": "L",
      "unitPrice": 30,
      "count": 1,
      "imageUrl":
          "https://img.freepik.com/free-photo/mesmerizing-view-silhouette-tree-savanna-plains-sunset_181624-18108.jpg"
    },
    {
      "name": "Sport Dress",
      "color": "Black",
      "size": "M",
      "unitPrice": 43,
      "count": 1,
      "imageUrl":
          "https://img.freepik.com/free-photo/mesmerizing-view-silhouette-tree-savanna-plains-sunset_181624-18108.jpg"
    }
  ];

  double totalAmount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotalAmount();
  }

  calculateTotalAmount() {
    setState(() {
      totalAmount = productList
          .map((product) => product['unitPrice'] * product['count'])
          .reduce((value, element) => value + element);
      print(totalAmount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bag"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Image.network(
                                      "${productList[index]["imageUrl"]}"),
                                  height: 80,
                                  width: 40,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${productList[index]["name"]}"),
                                            Icon(Icons.more_vert),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: "Color: ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          "${productList[index]["color"]}",
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            RichText(
                                              text: TextSpan(
                                                text: "Size: ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "${productList[index]["size"]}",
                                                    style: TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                    "${productList[index]["count"]}"),
                                                SizedBox(width: 10),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                            Text(
                                                "${productList[index]["unitPrice"].toString()}\$"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total amount:"),
                  Text("${totalAmount}\$"),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Shopping"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
