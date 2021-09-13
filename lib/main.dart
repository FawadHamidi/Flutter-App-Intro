import 'package:flutter/material.dart';

import 'helpers/color_helper.dart';

void main() {
  runApp(
   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    )
  );
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Padding(padding:EdgeInsets.only(right: 20, top:20),
            child: Text("Skip",style: TextStyle(
              fontFamily: "Gilroy",
              color: KprimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
          ),
        ],

      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller:  _pageController,
            children: [
            pageMaker(
              image: "assets/images/image1.png",
              title: "Lorem Ipsum",
              content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, "
            ),
              pageMaker(
                  image: "assets/images/image2.png",
                  title: "Lorem Ipsum",
                  content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, "
              ),
              pageMaker(
                  image: "assets/images/image3.png",
                  title: "Lorem Ipsum",
                  content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, "
              ),


            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget pageMaker({required String image, required String title, required String content,reverse = false}){
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse ?
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset(image),
              ),
              const SizedBox(height: 30,),
            ],
          ) : const SizedBox(),
          Text(title, style: const TextStyle(
              color: KprimaryColor,
              fontSize: 30,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 20,),
          Text(content, textAlign: TextAlign.center, style: const TextStyle(
              color: KsecondaryColor,
              fontSize: 20,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w500
          ),),
          reverse ?
          Column(
            children: <Widget>[
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ) : const SizedBox(),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}


