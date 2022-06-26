import 'package:store_app/imports.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key,
    @required Order order,
  })  : order = order,
        super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ItemCardContainer(
          child: Row(
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // id
                Row(
                  children: [
                    SizedBox(
                      child: Icon(Icons.wysiwyg_outlined, size: 36),
                      width: 40,
                    ),
                    Text('#' + order.id, style: TextStyle(fontSize: 18)),
                  ],
                ),
                // user id
                Row(
                  children: [
                    SizedBox(
                        child: Icon(Icons.person_outline_outlined, size: 36),
                        width: 40),
                    Text('#' + order.user, style: TextStyle(fontSize: 18)),
                  ],
                ),
                // products
                Row(
                  children: [
                    SizedBox(
                      child: Icon(Icons.view_list, size: 36),
                      width: 40,
                    ),
                    Text('Product: ', style: TextStyle(fontSize: 20)),
                  ],
                ),
                ...List.generate(
                    order.items.length,
                    (index) => Row(
                          children: [
                            SizedBox(width: 20),
                            Text(order.items[index].productId +
                                ' x' +
                                order.items[index].quantity.toString()),
                          ],
                        )),
                SizedBox(height: 10),
                // location
                Row(
                  children: [
                    SizedBox(
                      child: Icon(Icons.location_on_sharp, size: 36),
                      width: 40,
                    ),
                    Expanded(
                      child: Text(
                        order.shippingAddress.address,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                // phone number
                Row(
                  children: [
                    SizedBox(
                      child: Icon(Icons.local_phone_rounded, size: 36),
                      width: 40,
                    ),
                    Text(
                      order.shippingAddress.phoneNumber,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                // total
                Row(
                  children: [
                    SizedBox(
                      child: Icon(Icons.attach_money_outlined, size: 36),
                      width: 40,
                    ),
                    Text(
                      order.total,
                      style: TextStyle(fontSize: 18, color: Colors.redAccent),
                    ),
                  ],
                ),
                // status
                Row(
                  children: [
                    SizedBox(
                      child: Icon(Icons.warning_amber_rounded, size: 36),
                      width: 40,
                    ),
                    Text(
                      order.status,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              // edit button
              GestureDetector(
                onTap: () {
                  Get.to(() => EditOrderScreen(), arguments: order);
                },
                child: Container(
                  width: 50,
                  child: Icon(Icons.build_outlined),
                ),
              ),
              SizedBox(height: 60),
              //delete button
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:
                          Text("Are your sure you want to delete this order ?"),
                      actions: [
                        FlatButton(
                            onPressed: () async {
                              await ApiServices.deleteOrder(order.id);
                              Get.back();
                            },
                            child: Text("Yes")),
                        FlatButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("No")),
                      ],
                    ),
                  );
                },
                child: Container(
                  width: 50,
                  child: Icon(Icons.delete_outline, color: Colors.red),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
