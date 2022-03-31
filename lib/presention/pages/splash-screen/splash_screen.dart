import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/images.dart';
import '../../theme/colors.dart';
import '../landing-page/landing_page.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation fadingAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadingAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    animationController.repeat(reverse: true);
    goToLandingPage();
    super.initState();
  }

  void goToLandingPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
        });
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            SizedBox(
              height: 300.h,
              width: 237.w,
              child: Image.asset(
                imCloud,
                fit: BoxFit.fitWidth,
                height: 300.h,
                width: 237.w,
              ),
            ),
            SizedBox(height: 20.h),
            AnimatedBuilder(
              animation: fadingAnimation,
              builder: (context, _) => Opacity(
                opacity: fadingAnimation.value,
                child: Text(
                  'Weather',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(letterSpacing: 10.w),
                ),
              ),
            ),
            const Spacer(flex: 3),
            Text.rich(
              const TextSpan(
                children: [
                  TextSpan(text: 'Created By  '),
                  TextSpan(
                    text: 'Alaa badr ',
                    style: TextStyle(
                      color: kYellow,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
