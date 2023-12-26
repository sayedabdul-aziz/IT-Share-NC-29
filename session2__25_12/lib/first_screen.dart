import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'My Second App',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              color: Colors.deepOrange,
              iconSize: 24,
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  // alignment: Alignment.bottomRight,
                  children: [
                    // image
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                    ),
                    //badge
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          print('clickeeeeeeeeeeed');
                        },
                        child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.deepOrange,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome To My App',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  // alignment: Alignment.centerLeft,
                  // height: 200,
                  width: double.infinity,
                  // color: Colors.deepOrange,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   color: Colors.white,
                      // ),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 5),
                            blurRadius: 15,
                            spreadRadius: 1,
                            color: Colors.grey)
                      ],
                      // shape: BoxShape.circle,
                      // gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     stops: const [
                      //       .4,
                      //       2
                      //     ],
                      //     colors: [
                      //       Colors.deepOrange.withOpacity(.2),
                      //       Colors.deepOrange,
                      //     ]),
                      color: Colors.deepOrange),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.white),
                            SizedBox(width: 10),
                            Text('Ahmed Samy',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Spacer(),
                            Icon(Icons.star_half_rounded),
                            Text('4'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'NICE NICENICENICENICENICE NICE NICE NICE NICE NICE NICENICENICENICENICE NICE NICE NICE NICENICE NICENICENICENICENICE NICE NICE NICE NICENICE NICENICENICENICENICE NICE NICE NICE NICENICE NICENICENICENICENICE NICE NICE NICE NICE',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //// ---------------- Button ---------------------
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          foregroundColor: Colors.deepOrange,
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 10),
                          Text(
                            'Delete Report',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                //// -------------------- text button ---------------------
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          decorationColor: Colors.white,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          elevation: 0,
          foregroundColor: Colors.black,
          onPressed: () {
            //
          },
          child: const Icon(Icons.edit)),
    );
  }
}
