import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smartqueue/SignIn-SignUp/SignIn.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Benefit',
              body: 'Reduce congestion and save the time',
              image: buildImage('assets/images/Queue-rafiki.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Service selection',
              body: 'reserve a role for any institution you want to go to',
              image: buildImage('assets/images/booking.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'To confirm your reservation',
              body:
                  'Check the QR code upon arrival at the establishment in which the reservation was made',
              image: buildImage('assets/images/QR.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text(
            'Done',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.deepPurple),
          ),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(color: Colors.deepPurple),
          ),
          onSkip: () => goToHome(context),
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.deepPurple,
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.deepPurple,
          // skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignIn()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.deepPurple,
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
