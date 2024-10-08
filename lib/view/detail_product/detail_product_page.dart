import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore/controller/detail_product/detail_product_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:fakestore/view/ui/circular_progress.dart';
import 'package:fakestore/view/ui/fs_ratings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<DetailProductController>(
      init: DetailProductController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 280,
                      left: 10,
                      right: 10,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              _.product.title!,
                              style: TextStyle(fontFamily: "Montserrat",fontSize: 18,fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '\$ ${_.product.price.toString()}',
                                  style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ratings",
                                  style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${_.product.rating!.rate}',
                                          style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    FSRating(
                                      rating: _.product.rating!.rate!,

                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Votes",
                                  style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${_.product.rating!.count}',
                                      style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.thumb_up_alt_outlined,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: OutlinedButton(
                            //     onPressed: () => _.goCardBuy(),
                            //     child: Text(
                            //       "Buy",
                            //       style: const TextStyle().copyWith(
                            //         color: EColors.green,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Description',
                              style: TextStyle(fontFamily: "Montserrat",fontSize: 15,fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              _.product.description!,
                              style: TextStyle(fontFamily: "Montserrat",fontSize: 15,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 250,
                      decoration: BoxDecoration(
                        color: EColors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => _.goBackHome(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),

                            ],
                          ),
                          CircleAvatar(
                            radius: 90,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                width: double.maxFinite,
                                height: 160.0,
                                fit: BoxFit.scaleDown,
                                imageUrl: _.product.image!,
                                placeholder: (context, url) => SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: CircularProgress(
                                    width: 10,
                                    height: 10,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/sinimagen.png',
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
