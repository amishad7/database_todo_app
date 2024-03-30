import 'package:flutter/material.dart';
import 'package:todo_app/src/utils/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textScaler = MediaQuery.of(context).textScaler;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff181819),
        leading: const Icon(Icons.grid_view_rounded),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor: const Color(0xff181819),
      body: Column(
        children: [
          Container(
            // color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Hi, Amisha',
                    style: GoogleFonts.mukta().copyWith(
                        fontSize: textScaler.scale(20), color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Be more productive',
                    style: GoogleFonts.mukta().copyWith(
                      fontSize: textScaler.scale(25),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(45),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search task",
                      suffixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            height: MediaQuery.sizeOf(context).height * 0.15,
            padding: const EdgeInsets.only(top: 10, left: 18),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(45),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tasks process',
                      style: GoogleFonts.mukta().copyWith(
                        fontSize: textScaler.scale(26),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0/0 task done',
                      style: GoogleFonts.mukta().copyWith(
                        fontSize: textScaler.scale(19),
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          // height: MediaQuery.sizeOf(context).height / 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height / 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Container(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),

                                      hintText: "Write your today's task",
                                      // suffixIcon: Icon(
                                      //   Icons.search,
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height / 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Submit"),
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Clear"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 200,
                    width: 170,
                    margin: const EdgeInsets.only(
                      left: 25,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black38,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
