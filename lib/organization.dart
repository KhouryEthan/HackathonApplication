import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_application/style.dart';
import 'package:hackathon_application/UI_Models/organization_models.dart';

class OrganizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizations'),
      ), //AppBar
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [
          // Container(
          //   padding: EdgeInsets.only(top: 30, left: 40),
          //   height: 220,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       PrimaryText(
          //         text: 'Organization -\nHackathon Group',
          //         fontSize: 32,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w900,
          //       ),
          //       SizedBox(height: 25),
          //     ],
          //   ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 0),
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          text: 'Hackathon Group',
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            height: MediaQuery.of(context).size.height - 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) => chatElement(
                  userList[index]['member']!,
                  context,
                  userList[index]['name']!,
                  userList[index]['message']!,
                  userList[index]['time']!),
            ),
          )
        ],
      ),
    );
  }

  Widget chatElement(String avatarUrl, BuildContext context, String name,
      String message, String time) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: ListTile(
        leading: Avatar(avatarUrl: avatarUrl),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryText(text: name, fontSize: 18),
            PrimaryText(text: time, color: Colors.grey[400]!, fontSize: 10),
          ],
        ),
        subtitle: PrimaryText(
            text: message,
            color: Colors.grey[600]!,
            fontSize: 14,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
