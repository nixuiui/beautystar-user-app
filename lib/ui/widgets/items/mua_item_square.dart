import 'package:beautystar_user_app/app/app_consts.dart';
import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/ui/views/mua_detail/mua_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_box.dart';
import 'package:nx_flutter_ui_starter_pack/nx_image.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';

class MuaItemSquare extends StatelessWidget {
  const MuaItemSquare({
    Key key,
    @required this.height,
    @required this.width,
    @required this.mua,
  }) : super(key: key);

  final double height;
  final double width;
  final Mua mua;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => MuaDetailView(mua: mua)
      )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.transparent, 
                  width: 0
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(mua?.portofolios?.first?.photo ?? "")
                )
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NxBox(
                gradient: AppConst.gradientType1,
                padding: 8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NxImage.avatar(
                      image: NetworkImage(mua?.user?.profilePhoto ?? ""), 
                      size: 28
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NxText(
                            mua?.brandName ?? "",
                            color: Colors.white
                          ),
                          NxText.small(
                            mua?.province?.name ?? "",
                            color: Colors.white
                          ),
                          NxText.small(
                            mua?.getRangePrice() ?? "",
                            color: Colors.white
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}