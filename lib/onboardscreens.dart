import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Container(
                color: Colors.amberAccent,
                child: Center(
                  child: Text('First Screen'),
                ),
              ),
              Container(
                color: Colors.pinkAccent,
                child: Center(
                  child: Text('2nd Screen'),
                ),
              ),
              Container(
                color: Colors.tealAccent,
                child: Center(
                  child: Text('3rd Screen'),
                ),
              )
            ],
          ),
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment(0, 0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text('skip'),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  // done
                  onLastPage
                      ? MaterialButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: Text('done'),
                        )
                      : MaterialButton(
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.bounceIn);
                          },
                          child: Text('next'),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
