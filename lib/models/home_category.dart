import 'dart:convert';

List<HomeCategory> homeCategoryFromJson(String str) => List<HomeCategory>.from(json.decode(str).map((x) => HomeCategory.fromJson(x)));

String homeCategoryToJson(List<HomeCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeCategory {
    HomeCategory({
        this.id,
        this.image,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.muaService,
    });

    int id;
    String image;
    int position;
    DateTime createdAt;
    DateTime updatedAt;
    MuaService muaService;

    factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        id: json["id"],
        image: json["image"],
        position: json["position"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        muaService: MuaService.fromJson(json["mua_service"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "position": position,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "mua_service": muaService.toJson(),
    };
}

class MuaService {
    MuaService({
        this.id,
        this.vendorCategoryId,
        this.parentId,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    int vendorCategoryId;
    dynamic parentId;
    String name;
    DateTime createdAt;
    dynamic updatedAt;
    dynamic deletedAt;

    factory MuaService.fromJson(Map<String, dynamic> json) => MuaService(
        id: json["id"],
        vendorCategoryId: json["vendor_category_id"],
        parentId: json["parent_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_category_id": vendorCategoryId,
        "parent_id": parentId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
    };
}
