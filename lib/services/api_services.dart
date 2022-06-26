import 'package:http/http.dart' as http;
import 'package:store_app/imports.dart';

class ApiServices {
  static var client = http.Client();
  static String host = "https://first-store-app.herokuapp.com";

  static Future<List<Product>> fetchProducts(String productType) async {
    print('fetching... $productType');
    var url = Uri.parse("$host/products/$productType");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print('fetch success');
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //return error message
      return null;
    }
  }

  static Future<List<User>> fetchUsers() async {
    print('fetching... users');
    var url = Uri.parse("$host/users");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print('fetch success');
      var jsonString = response.body;
      return userFromJson(jsonString);
    } else {
      //return error message
      return null;
    }
  }

  static Future<List<Order>> fetchOrders() async {
    print('fetching... orders');
    var url = Uri.parse("$host/orders");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print('fetch success');
      var jsonString = response.body;
      print(ordersFromJson(jsonString));
      return ordersFromJson(jsonString);
    } else {
      //return error message
      return null;
    }
  }

  static Future<String> login(String email, String password) async {
    var url = Uri.parse("$host/users/login");
    var respone = await client.post(
      url,
      body: {'email': email, 'password': password},
    );
    if (respone.statusCode == 200) {
      print("login success");
      var jsonString = respone.body;
      return jsonString;
    } else {
      return null;
    }
  }

  static Future<String> register(String email, String password) async {
    var url = Uri.parse("$host/users/register");
    var respone = await client.post(
      url,
      body: {'email': email, 'password': password},
    );
    if (respone.statusCode == 200) {
      print("register success");
      var jsonString = respone.body;
      return json.decode(jsonString)["user"];
    } else {
      return null;
    }
  }

  static Future<User> getInfoByToken(String token) async {
    var url = Uri.parse("$host/users/token");
    var respone = await client.get(
      url,
      headers: {'auth-token': token},
    );
    if (respone.statusCode == 200) {
      print("get info success");
      var jsonString = respone.body;
      print(respone.body);
      return userFromJson(jsonString)[0];
    } else {
      print("get Info by token failed");
      return null;
    }
  }

  static Future<Product> getProductById(String id) async {
    var url = Uri.parse("$host/products/$id");
    var respone = await client.get(
      url,
    );
    if (respone.statusCode == 200) {
      print("get product success");
      var jsonString = respone.body;
      return productsFromJson(jsonString)[0];
    } else {
      //error here
      return null;
    }
  }

  static Future<List<CartItem>> getCart(List<Cart> cart) async {
    List<CartItem> carts = [];

    toCartItem(e, isChosen) async {
      Product p = await getProductById(e.productId);
      return CartItem(product: p, numOfItem: e.quantity, isChosen: e.isChosen);
    }

    for (var i = 0; i < cart.length; i++) {
      carts.add(await toCartItem(cart[i], cart[i].isChosen));
    }
    return carts;
  }

  static updateUser(data, id) async {
    print(data);
    var url = Uri.parse("$host/users/$id");
    var response = await client.put(url, body: data);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("update failed");
      return null;
    }
  }

  static updateProduct(data) async {
    var url = Uri.parse("$host/products/updateProductById");
    var response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("update failed");
      return null;
    }
  }

  static deleteProduct(productId) async {
    var url = Uri.parse("$host/products/deleteProductById");
    var response = await client.post(url, body: {"id": productId});
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("delete failed");
      return null;
    }
  }

  static updateOrder(data) async {
    var url = Uri.parse("$host/orders/updateOrderById");
    var response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("update failed");
      return null;
    }
  }

  static deleteOrder(orderId) async {
    var url = Uri.parse("$host/orders/deleteOrderById");
    print(orderId);
    var response = await client.post(url, body: {"id": orderId});
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("delete failed");
      return null;
    }
  }

  static Future<List<Product>> fetchProductsBySearch(String text) async {
    print('fetching search ... $text');
    var url = Uri.parse("$host/products/search/$text");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print('fetch success');
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //return error message
      return null;
    }
  }

  static Future<String> sendOrder(data) async {
    var url = Uri.parse("$host/orders");
    var respone = await client.post(
      url,
      body: data,
    );
    if (respone.statusCode == 200) {
      print("send order success");
      return 'order success';
    } else {
      return null;
    }
  }

  static Future<List<Discount>> fetchDiscounts() async {
    print('fetching... all discounts');
    var url = Uri.parse("$host/discounts");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print('fetch success');
      var jsonString = response.body;
      return discountsFromJson(jsonString);
    } else {
      //return error message
      return null;
    }
  }
}
