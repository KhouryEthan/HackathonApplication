import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_application/loginpage.dart';
import 'package:hackathon_application/UI_Models/dashboard_models.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 8),
      child: ListView(physics: ClampingScrollPhysics(), children: <Widget>[
        //AppBar UI
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/user_image.png'),
                  ),
                ),
              ),
              //Go back to login page
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: SvgPicture.asset('assets/logout-icon.svg',
                    color: Colors.lightBlue),
              ),
            ],
          ),
        ),

        //Card Selection
        SizedBox(
          height: 25,
        ),

        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Good Morning',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
              Text('Ethan Khoury',
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
          child: Text(
            'What would you like to do?',
            style: GoogleFonts.inter(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        ListView.builder(
          itemCount: transactions.length,
          padding: EdgeInsets.only(left: 16, right: 16),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                height: 76,
                margin: EdgeInsets.only(bottom: 13),
                padding:
                    EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(8.0, 8.0),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: AssetImage(transactions[index].photo),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              transactions[index].name,
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          transactions[index].info,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlueAccent,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if (transactions[index].path == 'org') {
                    return LoginPage();
                  }
                  if (transactions[index].path == 'loc') {
                    return LoginPage();
                  }
                  if (transactions[index].path == 'sched') {
                    return LoginPage();
                  } else {
                    throw new Exception('Not a valid page');
                  }
                }));
              },
            );
          },
        ),
      ]),
    ));
  }
}
