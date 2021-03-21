import 'package:hive/hive.dart';

part 'library_model.g.dart';

@HiveType(typeId: 1)
class LibraryModel extends HiveObject {
    LibraryModel({
        this.id,
        this.name,
    });

    @HiveField(0)
    int id;
    @HiveField(1)
    String name;

    factory LibraryModel.fromJson(Map<String, dynamic> json) => LibraryModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}