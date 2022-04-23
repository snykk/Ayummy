import 'package:flutter/material.dart';
import '../main/main_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Map<String, String>> data = [
    {
      "title": "Dibuat langsung dari bahan-bahan              pilihan",
      "subtitle":
          "Restoran ayam dengan cita rasa sempurna menyajikan berbagai menu makanan yang menggugah selera"
    },
    {
      "title": "Nikmati makananmu dengan datang secara langsung",
      "subtitle":
          "Restoran ayam dengan cita rasa sempurna menyajikan berbagai menu makanan yang menggugah selera"
    },
    {
      "title": "Permudah dengan memesan melalui aplikasi",
      "subtitle":
          "Restoran ayam dengan cita rasa sempurna menyajikan berbagai menu makanan yang menggugah selera"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: 3,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xffff8a00),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 190,
                  right: 40,
                  left: 40,
                ),
                child: Image.asset(
                  "./assets/onboarding/onboarding${i+1}.png",
                  width: 325,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(207.5, 90),
                        topLeft: Radius.elliptical(207.5, 90),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 50, right: 50, bottom: 40, left: 50),
                      child: Column(
                        children: [
                          Text(
                            data[i]['title'].toString(),
                            style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data[i]['subtitle'].toString(),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3,
                                  (index) => buildIndicator(index, context)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff2f4858),
                                borderRadius: BorderRadius.circular(8)),
                            child: TextButton(
                              onPressed: () {
                                if (currentIndex == 2) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                    return const MainPage();
                                  }));
                                }
                                _controller.nextPage(
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.bounceIn);
                              },
                              child: Text(
                                currentIndex == 2
                                    ? "Pesan Sekarang"
                                    : "Selanjutnya",
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Container buildIndicator(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 40 : 20,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? const Color(0xffff8a00) : Colors.grey,
      ),
    );
  }

  Widget customSetImage(String path) {
    return Center(
      child: Image.asset(
        path,
        width: 350,
      ),
    );
  }
}
