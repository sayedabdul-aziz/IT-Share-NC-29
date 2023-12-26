import 'package:chat_app_ui/user_model.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [
      UserModel(
          name: 'Ahmed',
          image: 'assets/11.jpg',
          lastMsg: 'Hello , Ahmed',
          time: '12:00'),
      UserModel(
          name: 'Amira',
          image: 'assets/22.jpg',
          lastMsg: 'Hello',
          time: '12:00'),
      UserModel(
          name: 'Ali',
          image: 'assets/33.jpg',
          lastMsg: 'How are u',
          time: '12:00'),
      UserModel(
          name: 'Belal',
          image: 'assets/44.jpg',
          lastMsg: 'Hello',
          time: '12:00'),
      UserModel(
          name: 'Mostafa',
          image: 'assets/55.jpg',
          lastMsg: 'How are u',
          time: '12:00'),
      UserModel(
          name: 'Anan', image: 'assets/66.jpg', lastMsg: 'Hi', time: '12:00'),
      UserModel(
          name: 'Tarek',
          image: 'assets/77.jpg',
          lastMsg: 'Hello',
          time: '12:00'),
      UserModel(
          name: 'Sayed', image: 'assets/88.jpg', lastMsg: 'ok', time: '12:00')
    ];
    return Scaffold(
      backgroundColor: const Color(0xff4622fe),
      appBar: AppBar(
        backgroundColor: const Color(0xff4622fe),
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.white))
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  'Favourite Contacts',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 29,
                        backgroundImage: AssetImage(users[index].image),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        users[index].name,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: users.length),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 29,
                          backgroundImage: AssetImage(users[index].image),
                        ),
                        title: Text(
                          users[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4622fe)),
                        ),
                        subtitle: Text(
                          users[index].lastMsg,
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: Text(
                          users[index].time,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    );
                  },
                  // separatorBuilder: (context, index) {
                  //   return const SizedBox(
                  //     height: 10,
                  //   );
                  // },
                  itemCount: users.length),
            ),
          )
        ],
      ),
    );
  }
}
