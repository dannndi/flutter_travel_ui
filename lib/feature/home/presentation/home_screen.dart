import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/core/theme/app_color.dart';
import 'package:flutter_travel_ui/feature/home/presentation/widget/for_you_destination_widget.dart';
import 'package:flutter_travel_ui/feature/home/presentation/widget/popular_destination_widget.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Coachmart properties
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey profileKey = GlobalKey();
  GlobalKey notificationKey = GlobalKey();
  GlobalKey searchKey = GlobalKey();
  GlobalKey popularKey = GlobalKey();
  GlobalKey specialKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _showTutorialCoachmark();
    });
    super.initState();
  }

  void _showTutorialCoachmark() {
    _initTarget();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      pulseEnable: false,
      colorShadow: AppColor.primaryColor,
      onClickTarget: (target) {
        print("${target.identify}");
      },
      // hideSkip: true,
      alignSkip: Alignment.topRight,
      onFinish: () {
        print("Finish");
      },
    )..show(context: context);
  }

  void _initTarget() {
    targets = [
      // profile
      TargetFocus(
        identify: "profile-key",
        keyTarget: profileKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      ),

      // notification
      TargetFocus(
        identify: "notification-key",
        keyTarget: notificationKey,
        color: AppColor.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      ),

      // search
      TargetFocus(
        identify: "search-key",
        keyTarget: searchKey,
        color: AppColor.black,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      ),

      // popular
      TargetFocus(
        identify: "popular-key",
        keyTarget: popularKey,
        color: AppColor.black,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      ),

      /// special for you
      TargetFocus(
        identify: "special-key",
        keyTarget: specialKey,
        color: AppColor.black,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
                next: "Finish",
                onNext: () {
                  /// save state
                  /// local storage
                  controller.next();
                  print("Save to Local Strage");
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Container(
                      key: profileKey,
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/profile_1.jpeg",
                          ),
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "William",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Where do you want to go ?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Icon(
                      Icons.notifications_none_rounded,
                      key: notificationKey,
                      size: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  key: searchKey,
                  height: 56,
                  width: MediaQuery.of(context).size.width - 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.search),
                      const SizedBox(width: 8),
                      Text(
                        "Search any location, bali, rome, etc.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: (MediaQuery.of(context).size.width - 48 - 20) / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.primarySwatch[100],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Beach",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 48,
                      width: (MediaQuery.of(context).size.width - 48 - 20) / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.primarySwatch[100],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Mountain",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 48,
                      width: (MediaQuery.of(context).size.width - 48 - 20) / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.primarySwatch[100],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "City",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Popular Destination",
                  key: popularKey,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 16),
              const PopularDestinationWidget(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      key: specialKey,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Explore All",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColor.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const ForYouDestinationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CoachmarkDesc extends StatefulWidget {
  const CoachmarkDesc({
    super.key,
    required this.text,
    this.skip = "Skip",
    this.next = "Next",
    this.onSkip,
    this.onNext,
  });

  final String text;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;

  @override
  State<CoachmarkDesc> createState() => _CoachmarkDescState();
}

class _CoachmarkDescState extends State<CoachmarkDesc>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 20,
      duration: const Duration(milliseconds: 800),
    )..repeat(min: 0, max: 20, reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animationController.value),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: widget.onSkip,
                  child: Text(widget.skip),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: widget.onNext,
                  child: Text(widget.next),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
