import 'package:flutter/material.dart';
import 'package:project/app/views/main/chat/widgets/chat_message_model.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFF8A00),
        flexibleSpace: SafeArea(
          child: Row(
            children: [
              Container(width: 16,),
              GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
              Center(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(width: 20),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/logo/logo_ayam.png"),
                        maxRadius: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "A’yummy",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      // Expanded(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: const <Widget>[
                      //       Text(
                      //         "A’yummy",
                      //         style: TextStyle(
                      //             fontSize: 22,
                      //             fontWeight: FontWeight.w600,
                      //             color: Colors.white),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: (messages[index].messageType == "receiver"
                      ? Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/logo/logo_ayam.png"),
                            maxRadius: 20,
                          ),
                          Container(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                              color: Colors.grey.shade200,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: const TextStyle(fontSize: 15, color: Colors.black,),
                            ),
                          ),
                        ],
                      )
                      : Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                          color:  Color(0xFFFF8A00),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ))
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Ketikan Pesan...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.image,
                        color: Color(0xFFFF8A00),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 24,
                    ),
                    backgroundColor: const Color(0xFFFF8A00),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Halo, mas", messageType: "receiver"),
  ChatMessage(messageContent: "Ayam gepreknya ada?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Ada mas, mau pesan berapa?",
      messageType: "sender"),
  ChatMessage(messageContent: "Saya mau pesan 3", messageType: "receiver"),
  ChatMessage(
      messageContent: "Baik silahkan lanjukan pesanan lewat aplikasi", messageType: "sender"),
];
