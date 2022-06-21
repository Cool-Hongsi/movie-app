import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/app_color.dart';

class SearchPageShimmer extends StatelessWidget {
  const SearchPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 7,
            valueColor: AlwaysStoppedAnimation<Color>(borderColorLightGrey),
            backgroundColor: backgroundColorGrey,
          ),
          Shimmer.fromColors(
            baseColor: (backgroundColorGrey),
            highlightColor: (borderColorLightGrey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ["", "", ""].map((shimmer) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        height: 200,
                        margin: const EdgeInsets.only(right: 35),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text(shimmer),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: const Text(''),
                          ),
                          Container(
                            width: 130,
                            height: 20,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: const Text(''),
                          ),
                          Container(
                            width: 130,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: const Text(''),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList()
            )
          )
        ],
      ),
    );
  }
}
