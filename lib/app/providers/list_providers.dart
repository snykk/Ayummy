import 'package:project/app/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:project/app/providers/auth_provider.dart';
import 'package:project/app/providers/cart_provider.dart';
import 'package:project/app/providers/order_provider.dart';
import 'package:project/app/providers/promo_provider.dart';
import 'package:project/app/providers/rating_provider.dart';
import 'package:project/app/providers/user_provider.dart';

class MyProvider {
  static List<SingleChildWidget> listProvider = [
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => OrderProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PromoProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => RatingProvider(),
    ),
  ];
}
