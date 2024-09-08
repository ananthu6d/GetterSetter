import 'package:GetterSetter/Generator.dart';
import 'package:GetterSetter/Method.dart';
import 'package:GetterSetter/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: outputController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color.fromARGB(255, 7, 16, 31),
        content: Text(
          'Copied to clipboard!',
          style: TextStyle(
            color: Color(0xffffa8b2d1),
            fontSize: 13.0,
            letterSpacing: 2.75,
            wordSpacing: 0.75,
          ),
        ),
      ),
    );
  }

  void generateGetterSetter() {
    // Example logic for generating getters and setters (to be expanded):

    if (inputController.text.trim().isEmpty) {
      // Show a Snackbar if the input is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 7, 16, 31),
          content: Text(
            'Input is empty. Please provide valid input!',
            style: TextStyle(
              color: Color(0xffffa8b2d1),
              fontSize: 13.0,
              letterSpacing: 2.75,
              wordSpacing: 0.75,
            ),
          ),
        ),
      );
      return; // Exit the function early
    }
    MethodGenerator generator = MethodGenerator();
    String output = generator.generateMethods(inputController.text);

    if (output.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 7, 16, 31),
          content: Text(
            'Invalid Input!',
            style: TextStyle(
              color: Color(0xffffa8b2d1),
              fontSize: 13.0,
              letterSpacing: 2.75,
              wordSpacing: 0.75,
            ),
          ),
        ),
      );
    }
    outputController.text = output;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Navigation Bar
              SizedBox(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.change_history,
                            size: 32.0,
                            color: Color(0xff64FFDA),
                          ),
                          onPressed: () {}),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: const Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                method.launchURL(
                                    "https://github.com/ananthu6d/GetterSetter");
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Source Code",
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
                  SizedBox(
                    width: size.width * 0.05,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github),
                            color: const Color(0xffffa8b2d1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://github.com/ananthu6d/");
                            }),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          color: const Color(0xffffa8b2d1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/ananthusuresh/");
                          },
                          iconSize: 16.0,
                        ),
                        IconButton(
                            icon: const Icon(Icons.call),
                            color: const Color(0xffffa8b2d1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchCaller();
                            }),
                        IconButton(
                            icon: const Icon(Icons.mail),
                            color: const Color(0xffffa8b2d1),
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
                    child: SizedBox(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                        text: "Let's,",
                                        textsize: 15.0,
                                        color: Color(0xff41FBDA),
                                        letterSpacing: 3.0,
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      const CustomText(
                                        text: "GetterSetter.",
                                        textsize: 40.0,
                                        color: Color(0xffCCD6F6),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      SizedBox(
                                        height: size.height * .03,
                                      ),
                                      Row(
                                        children: [
                                          // Left Side: Input Text Editor
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                TextField(
                                                  controller: inputController,
                                                  maxLines: 11,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16.0,
                                                    letterSpacing: 2.75,
                                                    wordSpacing: 0.75,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.black12,
                                                    hintText:
                                                        'Enter class varibles..',
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16.0,
                                                      letterSpacing: 2.75,
                                                      wordSpacing: 0.75,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                InkWell(
                                                  onTap: generateGetterSetter,
                                                  hoverColor:
                                                      const Color(0xff64FFDA)
                                                          .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: size.height * 0.07,
                                                    width: size.width * 0.13,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xff64FFDA),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: const Text(
                                                      "Proceed",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff64FFDA),
                                                        letterSpacing: 2.75,
                                                        wordSpacing: 1.0,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const VerticalDivider(
                                              width: 10,
                                              color: Colors.transparent),
                                          // Right Side: Output Code Editor
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                TextField(
                                                  controller: outputController,
                                                  maxLines: 11,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16.0,
                                                    letterSpacing: 2.75,
                                                    wordSpacing: 0.75,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.black12,
                                                    hintText:
                                                        'Getter Setter functions...',
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16.0,
                                                      letterSpacing: 2.75,
                                                      wordSpacing: 0.75,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                InkWell(
                                                  onTap: copyToClipboard,
                                                  hoverColor:
                                                      const Color(0xff64FFDA)
                                                          .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: size.height * 0.07,
                                                    width: size.width * 0.13,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xff64FFDA),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: const Text(
                                                      "Copy",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff64FFDA),
                                                        letterSpacing: 2.75,
                                                        wordSpacing: 1.0,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "ananthu6d@gmail.com",
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
