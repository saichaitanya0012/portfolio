import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/Model/Method.dart';
import 'package:myportfolio/UI/About.dart';
import 'package:myportfolio/UI/FeatureProject.dart';
import 'package:myportfolio/UI/Work.dart';
import 'package:myportfolio/Widget/AppBarTitle.dart';
import 'package:myportfolio/Widget/CustomText.dart';
import 'package:myportfolio/Widget/MainTiitle.dart';
import 'package:myportfolio/Widget/OSImages.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }


  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
          () => _isAppBarExpanded
          ? isExpaned != false
          ? setState(
            () {
          isExpaned = false;
          print('setState is called');
        },
      )
          : {}
          : isExpaned != true
          ? setState(() {
        print('setState is called');
        isExpaned = true;
      })
          : {},
    );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.change_history,
                            size: 32.0,
                            color: Color(0xff64FFDA),
                          ),
                          onPressed: () {}),
                      Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Project',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact Us',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: FlatButton(
                              hoverColor: Color(0xFF3E0449),
                              onPressed: () {
                                method.launchURL(
                                    "https://firebasestorage.googleapis.com/v0/b/chaitanya-a4051.appspot.com/o/Mallela_SaiChaitanya_Resume_21.PDF?alt=media&token=8dde4310-5cc8-482b-94ce-f45767136586");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: Color(0xff64FFDA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // IconButton(
                        //     icon: FaIcon(FontAwesomeIcons.github),
                        //     color: Color(0xffffA8B2D1),
                        //     iconSize: 16.0,
                        //     onPressed: () {
                        //       method.launchURL("https://github.com/champ96k");
                        //     }),
                        // IconButton(
                        //     icon: FaIcon(FontAwesomeIcons.twitter),
                        //     color: Color(0xffffA8B2D1),
                        //     iconSize: 16.0,
                        //     onPressed: () {
                        //       method.launchURL("https://twitter.com/champ_96k");
                        //     }),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/sai-chaitanya-24876b170/");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: Icon(Icons.call),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchCaller();
                            }),
                        IconButton(
                            icon: Icon(Icons.mail),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * .06,
                                      ),
                                      CustomText(
                                        text: "Hi, my name is",
                                        textsize: 16.0,
                                        color: Color(0xff41FBDA),
                                        letterSpacing: 3.0,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      CustomText(
                                        text: "Mallela Sai Chaitanya.",
                                        textsize: 68.0,
                                        color: Color(0xffCCD6F6),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      CustomText(
                                        text:
                                        "I build applications for the Android and ios using flutter.",
                                        textsize: 56.0,
                                        color: Color(0xffCCD6F6).withOpacity(0.6),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        height: size.height * .04,
                                      ),
                                      Wrap(
                                        children: [
                                          Text(
                                            "I'm a Mobile Application developer in Deepsense Digital Solutions, IN specializing in building mobile applications.",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                              letterSpacing: 2.75,
                                              wordSpacing: 0.75,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * .12,
                                      ),

                                      //get in tuch text
                                      InkWell(
                                        onTap: () {
                                          method.launchEmail();
                                        },
                                        hoverColor:
                                        Color(0xff64FFDA).withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(4.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: size.height * 0.09,
                                          width: size.width * 0.14,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff64FFDA),
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(4.0),
                                          ),
                                          child: Text(
                                            "Get In Touch",
                                            style: TextStyle(
                                              color: Color(0xff64FFDA),
                                              letterSpacing: 2.75,
                                              wordSpacing: 1.0,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: size.height * 0.20,
                                      ),
                                    ],
                                  ),



                                  //About Me
                                  _wrapScrollTag(
                                    index: 0,
                                    child: About(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),

                                  //Where I've Worked
                                  _wrapScrollTag(
                                      index: 1,
                                      child:Work()
                                  ),
                                  SizedBox(
                                    height: size.height * 0.10,
                                  ),

                                  //Some Things I've Built Main Project
                                  _wrapScrollTag(
                                      index: 2,
                                      child: Column(
                                        children: [
                                          MainTiitle(
                                            number: "0.3",
                                            text: "Some Things I've Built",
                                          ),
                                          SizedBox(
                                            height: size.height * 0.04,
                                          ),
                                          FeatureProject(
                                            imagePath: "images/pizza.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://firebasestorage.googleapis.com/v0/b/chaitanya-a4051.appspot.com/o/pizza.mp4?alt=media&token=f17c944a-b2ae-4668-bd25-8d0d74e6eb11");
                                            },
                                            // projectDesc:
                                            //     "A Mobile app for both Android and IOS. View your Status, Chat, and call history. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                            projectTitle: "Pizza Order App",
                                            tech1: "Flutter",
                                            tech2: "Dart",
                                            tech3: "Flutter UI",
                                          ),FeatureProject(
                                            imagePath: "images/kids.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://firebasestorage.googleapis.com/v0/b/chaitanya-a4051.appspot.com/o/ios.mp4?alt=media&token=67a909ff-3ba9-403f-9b50-b398279de697");
                                            },
                                            // projectDesc:
                                            //     "A Mobile app for both Android and IOS. View your Status, Chat, and call history. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                            projectTitle: "Stories App",
                                            tech1: "Flutter",
                                            tech2: "Dart",
                                            tech3: "Flutter UI",
                                          ),FeatureProject(
                                            imagePath: "images/image1.png",
                                            ontab: () {
                                              method.launchURL(
                                                  "https://firebasestorage.googleapis.com/v0/b/chaitanya-a4051.appspot.com/o/blind%20poc.mp4?alt=media&token=a1c01938-2660-4a8a-b6a2-18e3afc66b27");
                                            },
                                            // projectDesc:
                                            //     "A Mobile app for both Android and IOS. View your Status, Chat, and call history. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                            projectTitle: "Blind People Poc",
                                            tech1: "Flutter",
                                            tech2: "Dart",
                                            tech3: "Flutter UI",
                                          ),




                                        ],
                                      )),

                                  // SizedBox(
                                  //   height: 6.0,
                                  // ),

                                  //Get In Touch
                                  _wrapScrollTag(
                                    index: 3,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: size.height * 0.68,
                                          width: MediaQuery.of(context).size.width -
                                              100,
                                          // color: Colors.orange,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              CustomText(
                                                text: "0.4 What's Next?",
                                                textsize: 16.0,
                                                color: Color(0xff41FBDA),
                                                letterSpacing: 3.0,
                                              ),
                                              SizedBox(
                                                height: 16.0,
                                              ),
                                              CustomText(
                                                text: "Get In Touch",
                                                textsize: 42.0,
                                                color: Colors.white,
                                                letterSpacing: 3.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              SizedBox(
                                                height: 16.0,
                                              ),
                                              Wrap(
                                                children: [
                                                  Text(
                                                    "Although I'm currently looking for better opportunities, my inbox is \nalways open. Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                      letterSpacing: 0.75,
                                                      fontSize: 17.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 32.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  method.launchEmail();
                                                },
                                                child: Card(
                                                  elevation: 4.0,
                                                  color: Color(0xff64FFDA),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(6.0),
                                                  ),
                                                  child: Container(
                                                    margin: EdgeInsets.all(0.85),
                                                    height: size.height * 0.09,
                                                    width: size.width * 0.10,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff0A192F),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 8.0,
                                                      ),
                                                      child: Text(
                                                        "Say Hello",
                                                        style: TextStyle(
                                                          color: Color(0xff64FFDA),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //Footer
                                        Container(
                                          alignment: Alignment.center,
                                          height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                          width: MediaQuery.of(context).size.width -
                                              100,
                                          //color: Colors.white,
                                          child: Text(
                                            " Built by Sai Chaitanya 💙 Flutter",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "saichaitanya0012@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
