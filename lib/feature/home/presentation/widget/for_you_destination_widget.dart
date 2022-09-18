import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/core/route/app_route_name.dart';
import 'package:flutter_travel_ui/core/theme/app_color.dart';
import 'package:flutter_travel_ui/feature/home/model/place.dart';

class ForYouDestinationWidget extends StatelessWidget {
  const ForYouDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specialForYou.length,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouteName.detailDestination,
              arguments: specialForYou[index],
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 48,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(
                        specialForYou[index].asset,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      specialForYou[index].name,
                      style: Theme.of(context).textTheme.titleMedium,
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
                        Text(specialForYou[index].location),
                      ],
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$${specialForYou[index].price} ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AppColor.primaryColor,
                                ),
                          ),
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
          ),
        );
      },
    );
  }
}
