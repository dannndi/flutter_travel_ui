import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/core/theme/app_color.dart';
import 'package:flutter_travel_ui/feature/home/presentation/widget/for_you_destination_widget.dart';
import 'package:flutter_travel_ui/feature/home/presentation/widget/popular_destination_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    const Icon(
                      Icons.notifications_none_rounded,
                      size: 32,
                    ),
                  ],
                ),
              ),
              Container(
                height: 56,
                width: MediaQuery.of(context).size.width - 48,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.all(24),
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
