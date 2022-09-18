import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/core/theme/app_color.dart';
import 'package:flutter_travel_ui/feature/home/model/place.dart';

class DetailDestinationScreen extends StatelessWidget {
  const DetailDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final destination = ModalRoute.of(context)?.settings.arguments as Place;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  destination.asset,
                ),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 24,
              right: 24,
            ),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.more_vert,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.place,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Text(destination.location),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Wrap(
                                  spacing: -24,
                                  children: destination.testimonials
                                      .map((e) => Container(
                                            height: 48,
                                            width: 48,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(e),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "see what they say.",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.amber[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 8),
                                Text(destination.rating.toString()),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$${destination.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: AppColor.primaryColor,
                                      ),
                                ),
                                const TextSpan(text: "\n"),
                                TextSpan(
                                  text: "/Person",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    destination.headline,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    destination.desc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 24,
              right: 24,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
              child: const Text("BOOK NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
