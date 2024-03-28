import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_update.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // COLUMN THAT WILL CONTAIN THE PROFILE
          Column(
            children: const [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Thu Trang Hoa",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text("trang2002@gmail.com")
            ],
          ),

          const SizedBox(height: 20),

          const Divider(),
          const SizedBox(height: 20),
          // Text(
          //   "Profile Information",
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),

          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: Text("Name", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17, color: Colors.black54)),flex: 4,),
              Expanded(child: Text("Thu Trang Hoa ", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17)),flex: 5,)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Username", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17, color: Colors.black54)),flex: 4,),
              Expanded(child: Text("tranghoathu ", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17)),flex: 5,)
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(child: Text("UserID", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17, color: Colors.black54)),flex: 4,),
              Expanded(child: Text("45678 ", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17)),flex: 5,)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("E-mail", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17, color: Colors.black54)),flex: 4,),
              Expanded(child: Text("trang2002@gmail.com ", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17)),flex: 5,)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("Phone ", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17, color: Colors.black54)),flex: 4,),
              Expanded(child: Text("+84 456 789 ", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17)),flex: 5,)
            ],
          ),
          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
    context, MaterialPageRoute(builder: (context) => UpdateProfile())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, side:  BorderSide.none, shape: const StadiumBorder()
                  ),
                  child: const Text("Edit Profile", style: TextStyle(color : Colors.black, fontSize: 17),
                ),
              )
            ),
          ),
           const SizedBox(height: 35),
          // const Divider(),
          // const SizedBox(height: 30),


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

