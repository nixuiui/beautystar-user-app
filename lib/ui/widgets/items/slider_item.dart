import 'package:beautystar_user_app/app/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';

class SliderItem extends StatelessWidget {

  final double aspectRatio;

  const SliderItem({
    Key key,
    this.aspectRatio
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.network(
            "http://www.beautystar.id/image/makeup-6.jpg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: NxBox(
            padding: 16,
            gradient: AppConst.gradientType1,
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NxText.small(
                            "Mulai",
                            color: Colors.grey[300]
                          ),
                          NxText.title(
                            "Rp 300.000",
                            color: Colors.white
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          NxImage.avatar(
                            image: NetworkImage("http://www.beautystar.id/storage/profile/201912291652541577613174.jpeg"), 
                            size: 28
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NxText(
                                "Andhita Irianto",
                                color: Colors.white
                              ),
                              NxText.small(
                                "Lampung",
                                color: Colors.white
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}