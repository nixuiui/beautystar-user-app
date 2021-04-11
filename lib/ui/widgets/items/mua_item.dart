import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/ui/views/mua_detail/mua_detail_view.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_box.dart';
import 'package:nx_flutter_ui_starter_pack/nx_image.dart';
import 'package:nx_flutter_ui_starter_pack/nx_text.dart';

class MuaItem extends StatelessWidget {

  final Mua mua;

  const MuaItem({
    Key key,
    this.mua
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NxBox(
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => MuaDetailView(mua: mua)
      )),
      borderRadius: 12,
      borderColor: Colors.grey[300],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[100],
              child: AspectRatio(
                aspectRatio: 5/3,
                child: Carousel(
                  showIndicator: false,
                  autoplayDuration: Duration(seconds: 10),
                  images: List.generate((mua?.portofolios?.length ?? 0) > 4 ? 4 : mua?.portofolios?.length, (index) => AspectRatio(
                    aspectRatio: 5/3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.transparent, 
                          width: 0
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(mua?.portofolios[index]?.photo ?? "")
                        )
                      ),
                    ),
                  ))
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        NxImage.avatar(
                          image: NetworkImage(mua?.user?.profilePhoto ?? ""), 
                          size: 28,
                          borderColor: Colors.grey,
                          borderSize: 1,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NxText.bold(mua.brandName),
                              NxText(
                                (mua?.city?.name ?? "") + ", " + mua?.province?.name ?? "",
                                color: Colors.grey[500],
                                fontSize: 12,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NxText.small("Mulai dari"),
                        NxText.bold(mua?.getMinPrice()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}