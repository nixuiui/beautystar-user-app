import 'package:beautystar_user_app/models/mua.dart';
import 'package:beautystar_user_app/ui/views/mua_detail/mua_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class MuaBrandItem extends StatelessWidget {

  final Mua mua;

  const MuaBrandItem({
    Key key,
    this.mua
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NxBox(
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => MuaDetailView(mua: mua)
      )),
      padding: 16,
      child: Row(
        children: [
          NxImage.avatar(
            image: NetworkImage(mua?.user?.profilePhoto ?? ""), 
            size: 28,
            borderColor: Colors.grey,
            borderSize: 1,
          ),
          SizedBox(width: 16),
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
    );
  }
}