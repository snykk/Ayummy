import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../constants/ratio.dart';
import '../../../providers/product_provider.dart';
import '../../../services/storage_services.dart';
import '../widgets/custom_appbar.dart';
import 'widgets/camera_screen.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({Key? key}) : super(key: key);

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  String _imagePath = '';
  String _imageName = '';
  bool isImageProductFill = true;

  GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  late TextEditingController _nameProdC;
  late TextEditingController _priceProdC;
  late TextEditingController _qtyProdC;
  late TextEditingController _descProdC;

  @override
  void initState() {
    _nameProdC = TextEditingController();
    _priceProdC = TextEditingController();
    _qtyProdC = TextEditingController();
    _descProdC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameProdC.dispose();
    _priceProdC.dispose();
    _qtyProdC.dispose();
    _descProdC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final Storage storageService = Storage();
    return Scaffold(
        appBar: const CustomAppbar(
          text: "Tambah produk",
          child: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        XFile _img =
                            await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return const CameraScreen();
                        }));

                        String imagePath = _img.path;
                        setState(() {
                          _imagePath = imagePath;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: (isImageProductFill == false) ? Colors.red : Colors.white,
                        )),
                        child: _imagePath.isEmpty
                            ? Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/a-yummy.appspot.com/o/food%2Fdefault.png?alt=media&token=38ba4739-7299-4b36-ac52-b2a95aa21500',
                                fit: BoxFit.fill,
                                width: Ratio(context).widthApp * 0.4,
                                height: Ratio(context).heightApp * 0.2,
                              )
                            : Image.file(
                                File(_imagePath),
                                fit: BoxFit.fill,
                                width: Ratio(context).widthApp * 0.4,
                                height: Ratio(context).heightApp * 0.2,
                              ),
                      ),
                    ),
                    (isImageProductFill == false)
                        ? const Text(
                            "Gambar produk tidak boleh kosong",
                            style: TextStyle(color: Colors.red),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Tambah gambar produk",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: myFormKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Ratio(context).widthApp * 0.08),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameProdC,
                        keyboardType: TextInputType.name,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          hintText: "Nama Produk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          prefixIcon: const Icon(Icons.font_download),
                        ),
                        validator: (val) {
                          if (val == "") {
                            return 'Nama produk tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _priceProdC,
                        enableSuggestions: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "Harga produk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          prefixIcon: const Icon(Icons.price_change),
                        ),
                        validator: (val) {
                          if (val == "") {
                            return 'Harga produk tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _qtyProdC,
                        enableSuggestions: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "Jumlah produk tersedia",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          prefixIcon: const Icon(Icons.inbox_sharp),
                        ),
                        validator: (val) {
                          if (val == "") {
                            return 'Jumlah produk tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _descProdC,
                        enableSuggestions: false,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Deskripsi produk",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          prefixIcon: const Icon(Icons.text_fields_outlined),
                        ),
                        validator: (val) {
                          if (val == "") {
                            return 'Deskripsi produk tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 25),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_imagePath != "") {
                            setState(() {
                              isImageProductFill = true;
                            });
                          } else {
                            setState(() {
                              isImageProductFill = false;
                            });
                          }

                          if (myFormKey.currentState != null) {
                            if (myFormKey.currentState!.validate() && _imagePath != "") {
                              setState(() {
                                _imageName = _nameProdC.text;
                              });

                              await storageService.uploadFile(_imagePath, _imageName);

                              String imageUrl = await storageService.getUrl(_imageName);

                              productProvider
                                  .addProduct(
                                    context: context,
                                    name: _nameProdC.text,
                                    price: int.parse(_priceProdC.text),
                                    qty: int.parse(_qtyProdC.text),
                                    imageUrl: imageUrl,
                                    desc: _descProdC.text,
                                  )
                                  .then((_) => setState(() {}));
                            }
                          }
                        },
                        child: const Text(
                          'Tambahkan product',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
