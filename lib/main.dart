import 'package:flutter/material.dart';
import 'app/providers/list_providers.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'app/routes/route.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MyProvider.listProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                secondary: Colors.black,
              ),
        ),
        initialRoute: Routes.startup,
        routes: Routes.mapping,
      ),
    );
  }
}
