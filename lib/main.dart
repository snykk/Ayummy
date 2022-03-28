import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.black,
            ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xffff8a00),
                child: Column(
                  children: const [
                    Image(
                      height: 130,
                      image: AssetImage("./assets/logo/logo_ayam.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Restoran Ayam Favorit Anda",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(190),
                child: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Color(0xff2f4858),
                  tabs: [
                    Tab(
                      text: "Masuk",
                    ),
                    Tab(
                      text: "Daftar",
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 35,
                    left: 50,
                    right: 50,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          keyboardType: TextInputType.phone,
                          enableSuggestions: false,
                          autocorrect: false,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: Color(0xff626663),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff626663),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff626663),
                              ),
                            ),
                            hintText: "No. Handphone",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,

                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: Color(0xff626663),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff626663),
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff626663),
                              ),
                            ),
                            hintText: "Masukkan Password",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Lupa Password?",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("yuhu 'masuk' diclick");
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff2f4858),
                            ),
                            child: const Center(
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Or",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("yuhu 'login with facebook' diclick");
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1877f2),
                            ),
                            child: const Center(
                              child: Text(
                                "Login with Facebook",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: GestureDetector(
                            onTap: () {
                              print("yuhu 'log in with Facebook' diclick");
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  "Log in with Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          elevation: 6,
                          shadowColor: Colors.black,
                          shape:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.white,width: 1)
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // Text(
                        //   "Test",
                        // )
                        RichText(
                          text: const TextSpan(
                            text: "Belum punya akun? ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            children: <TextSpan> [
                              TextSpan(
                                text: "Daftar",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
                // 
              ],
            )),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//       ),
//       home: const HomePage(),
//     ),
//   );
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         Container(
//             // custom AppBarr
//             padding:
//                 const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 10),
//             width: double.infinity,
//             height: 200,
//             color: const Color.fromARGB(255, 248, 151, 24),
//             child: Column(
//               children: [
//                 Row( // selamat datang dan lonceng notif
//                   children: [
//                     SizedBox(
//                       width: 150,
//                       child: RichText(
//                         text: const TextSpan(
//                           text: "Selamat Datang,",
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: " Patrick Star",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20
//                               ),
//                             )
//                           ]
//                          ) 
//                         ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 170),
//                       child: const Icon( 
//                         Icons.notifications_outlined,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 15),
//                   width: 800,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   height: 50,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.search_outlined,
//                         size: 30,
//                         color: Colors.white,
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(left: 10),
//                         child: const Text(
//                           "Cari Menu",
//                           style: TextStyle(
//                             color: Colors.white
//                           ),
//                         ),
//                       ),
//                     ],
//                     )
//                 ),
//               ],
//             )),
//         Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 70,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 30,
//                     width: 110,
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 248, 151, 24),
//                       border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Semua Menu",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 30,
//                     width: 110,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Makanan",
//                         style: TextStyle(color: Color.fromARGB(255, 248, 151, 24)),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 30,
//                     width: 110,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Minuman",
//                         style: TextStyle(color: Color.fromARGB(255, 248, 151, 24)),
//                       ),
//                     ),
//                   )
//                 ]
//                 ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 width: 320,
//                 // color: const Color.fromARGB(255, 50, 255, 255),
//                 margin: const EdgeInsets.only(top: 13),
//                 child: Column(// daftar menu
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Card(
//                           child: Container(
//                             width: 130,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               children: const [
//                                 SizedBox(
//                                   width:  double.infinity,
//                                   height: 100,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(20),
//                                       topRight: Radius.circular(20),
//                                     ),
//                                     child: Image(
//                                       fit: BoxFit.fill,
//                                       image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Ayam bakar Rica-Rica",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   heightFactor: 2.5,
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Rp. 11,500",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
                        
//                               ],
//                             ),
//                           ),
//                           elevation: 8,
//                           shadowColor: Colors.black,
//                           shape:  OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide:const BorderSide(color: Colors.white,width: 1)
//                           ),
//                         ),
//                         Card(
//                           child: Container(
//                             width: 130,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               children: const [
//                                 SizedBox(
//                                   width:  double.infinity,
//                                   height: 100,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(20),
//                                       topRight: Radius.circular(20),
//                                     ),
//                                     child: Image(
//                                       fit: BoxFit.fill,
//                                       image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Ayam bakar Rica-Rica",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   heightFactor: 2.5,
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Rp. 11,500",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
                        
//                               ],
//                             ),
//                           ),
//                           elevation: 8,
//                           shadowColor: Colors.black,
//                           shape:  OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide:const BorderSide(color: Colors.white,width: 1)
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Card(
//                           child: Container(
//                             width: 130,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               children: const [
//                                 SizedBox(
//                                   width:  double.infinity,
//                                   height: 100,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(20),
//                                       topRight: Radius.circular(20),
//                                     ),
//                                     child: Image(
//                                       fit: BoxFit.fill,
//                                       image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Ayam bakar Rica-Rica",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   heightFactor: 2.5,
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Rp. 11,500",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
                        
//                               ],
//                             ),
//                           ),
//                           elevation: 8,
//                           shadowColor: Colors.black,
//                           shape:  OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide:const BorderSide(color: Colors.white,width: 1)
//                           ),
//                         ),
//                         Card(
//                           child: Container(
//                             width: 130,
//                             height: 160,
//                             decoration: BoxDecoration(
//                               // border: Border.all(color: const Color.fromARGB(255, 248, 151, 24), width: 2),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               children: const [
//                                 SizedBox(
//                                   width:  double.infinity,
//                                   height: 100,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(20),
//                                       topRight: Radius.circular(20),
//                                     ),
//                                     child: Image(
//                                       fit: BoxFit.fill,
//                                       image: AssetImage("assets/makanan/ayam_bakar_rica.jpg"),
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Ayam bakar Rica-Rica",
//                                     style: TextStyle(
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                   heightFactor: 2.5,
//                                 ),
//                                 Center(
//                                   child: Text(
//                                     "Rp. 11,500",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
                        
//                               ],
//                             ),
//                           ),
//                           elevation: 8,
//                           shadowColor: Colors.black,
//                           shape:  OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide:const BorderSide(color: Colors.white,width: 1)
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     ));
//   }
// }
