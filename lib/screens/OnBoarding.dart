import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pasabahce_artifacts/models/artifact_model.dart';
import 'package:pasabahce_artifacts/screens/sign_up.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController();

  int numOfPages = 3;
  int currentPageAsInt = 0;
  double currentPageAsDouble = 0;

  _indicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: isActive ? 10.w : 6.w,
        height: isActive ? 10.h : 6.h,
        decoration: BoxDecoration(
            color: isActive ? Color(0xFFCC9D76) : Colors.white.withOpacity(0.3),
            shape: BoxShape.circle),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numOfPages; i++) {
      list.add(i == currentPageAsInt ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  _listener() {
    setState(() {
      currentPageAsDouble = pageController.page!;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0)..addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SizedBox(height: 64.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          SizedBox(height: 5.h),
          Container(
            height: 585.h,
            width: 406.w,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageAsInt = index;
                });
              },
              itemCount: numOfPages,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Artifact artifact = onBoardingArtifacts[index];
                double percent = 1 - (currentPageAsDouble - index).abs();
                return Column(
                  children: [
                    Image.asset(artifact.imageUrl),
                    SizedBox(height: 2.h),
                    Text('\$${artifact.price}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                    Text('history Culture glass'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 6.h),
                    Container(
                      height: 101.h,
                      width: 250.w,
                      child: Text(
                        artifact.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Spacer(),
          pageController.hasClients
              ? pageController.page != numOfPages - 1
                  ? GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeInOutSine);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40.h),
                        width: 240.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFD7A324),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                          child: Text(
                            'next'.toUpperCase(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40.h),
                        height: 44.h,
                        width: 240.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(22)),
                        child: Center(
                          child: Text(
                            'create account'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
              : Text(''),
        ],
      ),
    );
  }
}
