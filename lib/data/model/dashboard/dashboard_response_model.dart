// // To parse this JSON data, do
// //
// //     final projectPlanResponseModel = projectPlanResponseModelFromJson(jsonString);

// import 'dart:convert';

// import 'package:play_lab/data/model/global/common_api_response_model.dart';

// DashBoardResponseModel projectPlanResponseModelFromJson(String str) => DashBoardResponseModel.fromJson(json.decode(str));

// String projectPlanResponseModelToJson(DashBoardResponseModel data) => json.encode(data.toJson());

// class DashBoardResponseModel {
//   String? remark;
//   String? status;
//   Message? message;
//   DashBoardResponseModelData? data;

//   DashBoardResponseModel({
//     this.remark,
//     this.status,
//     this.message,
//     this.data,
//   });

//   factory DashBoardResponseModel.fromJson(Map<String, dynamic> json) => DashBoardResponseModel(
//         remark: json["remark"],
//         status: json["status"],
//         message: json["message"] == null ? null : Message.fromJson(json["message"]),
//         data: json["data"] == null ? null : DashBoardResponseModelData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "remark": remark,
//         "status": status,
//         "message": message?.toJson(),
//         "data": data?.toJson(),
//       };
// }

// class DashBoardResponseModelData {
//   MainData? data;
//   Path? path;

//   DashBoardResponseModelData({
//     this.data,
//     this.path,
//   });

//   factory DashBoardResponseModelData.fromJson(Map<String, dynamic> json) => DashBoardResponseModelData(
//         data: json["data"] == null ? null : MainData.fromJson(json["data"]),
//         path: json["path"] == null ? null : Path.fromJson(json["path"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//         "path": path?.toJson(),
//       };
// }

// class MainData {
//   List<Slider>? sliders;
//   List<Television>? televisions;
//   List<Featured>? featured;
//   List<Featured>? recentlyAdded;
//   List<Featured>? latestSeries;
//   List<Featured>? single;
//   List<Featured>? trailer;
//   List<Featured>? rent;
//   List<Featured>? freeZone;
//   dynamic advertise;
//   MainData({
//     this.sliders,
//     this.televisions,
//     this.featured,
//     this.recentlyAdded,
//     this.latestSeries,
//     this.single,
//     this.trailer,
//     this.rent,
//     this.freeZone,
//     this.advertise,
//   });

//   factory MainData.fromJson(Map<String, dynamic> json) => MainData(
//         sliders: json["sliders"] == null ? [] : List<Slider>.from(json["sliders"]!.map((x) => Slider.fromJson(x))),
//         televisions: json["televisions"] == null ? [] : List<Television>.from(json["televisions"]!.map((x) => Television.fromJson(x))),
//         featured: json["featured"] == null ? [] : List<Featured>.from(json["featured"]!.map((x) => Featured.fromJson(x))),
//         recentlyAdded: json["recently_added"] == null ? [] : List<Featured>.from(json["recently_added"]!.map((x) => Featured.fromJson(x))),
//         latestSeries: json["latest_series"] == null ? [] : List<Featured>.from(json["latest_series"]!.map((x) => Featured.fromJson(x))),
//         single: json["single"] == null ? [] : List<Featured>.from(json["single"]!.map((x) => Featured.fromJson(x))),
//         trailer: json["trailer"] == null ? [] : List<Featured>.from(json["trailer"]!.map((x) => Featured.fromJson(x))),
//         rent: json["rent"] == null ? [] : List<Featured>.from(json["rent"]!.map((x) => Featured.fromJson(x))),
//         freeZone: json["free_zone"] == null ? [] : List<Featured>.from(json["free_zone"]!.map((x) => Featured.fromJson(x))),
//         advertise: json["advertise"],
//       );

//   Map<String, dynamic> toJson() => {
//         "sliders": sliders == null ? [] : List<dynamic>.from(sliders!.map((x) => x.toJson())),
//         "televisions": televisions == null ? [] : List<dynamic>.from(televisions!.map((x) => x.toJson())),
//         "featured": featured == null ? [] : List<dynamic>.from(featured!.map((x) => x.toJson())),
//         "recently_added": recentlyAdded == null ? [] : List<dynamic>.from(recentlyAdded!.map((x) => x.toJson())),
//         "latest_series": latestSeries == null ? [] : List<dynamic>.from(latestSeries!.map((x) => x.toJson())),
//         "single": single == null ? [] : List<dynamic>.from(single!.map((x) => x.toJson())),
//         "trailer": trailer == null ? [] : List<dynamic>.from(trailer!.map((x) => x.toJson())),
//         "rent": rent == null ? [] : List<dynamic>.from(rent!.map((x) => x.toJson())),
//         "free_zone": freeZone == null ? [] : List<dynamic>.from(freeZone!.map((x) => x.toJson())),
//         "advertise": advertise,
//       };
// }

// class Featured {
//   int? id; //
//   String? categoryId; //
//   String? subCategoryId; //
//   String? slug;
//   String? title;
//   String? previewText;
//   String? description;
//   Team? team;
//   Image? image;
//   String? itemType; //
//   String? status; //
//   String? single; //
//   String? trending; //
//   String? featured; //
//   String? version; //
//   String? tags;
//   String? ratings;
//   String? view; //
//   String? isTrailer; //
//   String? rentPrice;
//   String? rentalPeriod; //
//   String? excludePlan; //
//   String? createdAt;
//   String? updatedAt;
//   Category? category;
//   Category? subCategory;

//   Featured({
//     this.id,
//     this.categoryId,
//     this.subCategoryId,
//     this.slug,
//     this.title,
//     this.previewText,
//     this.description,
//     this.team,
//     this.image,
//     this.itemType,
//     this.status,
//     this.single,
//     this.trending,
//     this.featured,
//     this.version,
//     this.tags,
//     this.ratings,
//     this.view,
//     this.isTrailer,
//     this.rentPrice,
//     this.rentalPeriod,
//     this.excludePlan,
//     this.createdAt,
//     this.updatedAt,
//     this.category,
//     this.subCategory,
//   });

//   factory Featured.fromJson(Map<String, dynamic> json) => Featured(
//         id: json["id"] ?? -1,
//         categoryId: json["category_id"].toString(),
//         subCategoryId: json["sub_category_id"].toString(),
//         slug: json["slug"],
//         title: json["title"],
//         previewText: json["preview_text"],
//         description: json["description"],
//         team: json["team"] == null ? null : Team.fromJson(json["team"]),
//         image: json["image"] == null ? null : Image.fromJson(json["image"]),
//         itemType: json["item_type"].toString(),
//         status: json["status"].toString(),
//         single: json["single"].toString(),
//         trending: json["trending"].toString(),
//         featured: json["featured"].toString(),
//         version: json["version"].toString(),
//         tags: json["tags"],
//         ratings: json["ratings"],
//         view: json["view"].toString(),
//         isTrailer: json["is_trailer"].toString(),
//         rentPrice: json["rent_price"].toString(),
//         rentalPeriod: json["rental_period"].toString(),
//         excludePlan: json["exclude_plan"].toString(),
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         category: json["category"] == null ? null : Category.fromJson(json["category"]),
//         subCategory: json["sub_category"] == null ? null : Category.fromJson(json["sub_category"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_id": categoryId,
//         "sub_category_id": subCategoryId,
//         "slug": slug,
//         "title": title,
//         "preview_text": previewText,
//         "description": description,
//         "team": team?.toJson(),
//         "image": image?.toJson(),
//         "item_type": itemType,
//         "status": status,
//         "single": single,
//         "trending": trending,
//         "featured": featured,
//         "version": version,
//         "tags": tags,
//         "ratings": ratings,
//         "view": view,
//         "is_trailer": isTrailer,
//         "rent_price": rentPrice,
//         "rental_period": rentalPeriod,
//         "exclude_plan": excludePlan,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "category": category?.toJson(),
//         "sub_category": subCategory?.toJson(),
//       };
// }

// class Category {
//   int? id; //
//   String? name;
//   String? status; //
//   String? createdAt;
//   String? updatedAt;
//   String? categoryId; //

//   Category({
//     this.id,
//     this.name,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.categoryId,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"] ?? -1,
//         name: json["name"],
//         status: json["status"].toString(),
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         categoryId: json["category_id"].toString(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "category_id": categoryId,
//       };
// }

// class Image {
//   String? landscape;
//   String? portrait;

//   Image({
//     this.landscape,
//     this.portrait,
//   });

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         landscape: json["landscape"],
//         portrait: json["portrait"],
//       );

//   Map<String, dynamic> toJson() => {
//         "landscape": landscape,
//         "portrait": portrait,
//       };
// }

// class Team {
//   String? director;
//   String? producer;
//   String? casts;
//   String? genres;
//   String? language;

//   Team({
//     this.director,
//     this.producer,
//     this.casts,
//     this.genres,
//     this.language,
//   });

//   factory Team.fromJson(Map<String, dynamic> json) => Team(
//         director: json["director"],
//         producer: json["producer"],
//         casts: json["casts"],
//         genres: json["genres"],
//         language: json["language"],
//       );

//   Map<String, dynamic> toJson() => {
//         "director": director,
//         "producer": producer,
//         "casts": casts,
//         "genres": genres,
//         "language": language,
//       };
// }

// class Slider {
//   int? id; //
//   String? itemId; //
//   String? image;
//   String? captionShow; //
//   String? status; //
//   String? createdAt;
//   String? updatedAt;
//   Featured? item;

//   Slider({
//     this.id,
//     this.itemId,
//     this.image,
//     this.captionShow,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.item,
//   });

//   factory Slider.fromJson(Map<String, dynamic> json) => Slider(
//         id: json["id"] ?? -1,
//         itemId: json["item_id"].toString(),
//         image: json["image"],
//         captionShow: json["caption_show"].toString(),
//         status: json["status"].toString(),
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//         item: json["item"] == null ? null : Featured.fromJson(json["item"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "item_id": itemId,
//         "image": image,
//         "caption_show": captionShow,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "item": item?.toJson(),
//       };
// }

// class Television {
//   int? id; //
//   String? title;
//   String? description;
//   String? image;
//   String? url;
//   String? status; //
//   String? createdAt;
//   String? updatedAt;

//   Television({
//     this.id,
//     this.title,
//     this.description,
//     this.image,
//     this.url,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Television.fromJson(Map<String, dynamic> json) => Television(
//         id: json["id"] ?? -1,
//         title: json["title"],
//         description: json["description"],
//         image: json["image"],
//         url: json["url"],
//         status: json["status"].toString(),
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "image": image,
//         "url": url,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// class Path {
//   String? portrait;
//   String? landscape;
//   String? television;
//   String? ads;

//   Path({
//     this.portrait,
//     this.landscape,
//     this.television,
//     this.ads,
//   });

//   factory Path.fromJson(Map<String, dynamic> json) => Path(
//         portrait: json["portrait"],
//         landscape: json["landscape"],
//         television: json["television"],
//         ads: json["ads"],
//       );

//   Map<String, dynamic> toJson() => {
//         "portrait": portrait,
//         "landscape": landscape,
//         "television": television,
//         "ads": ads,
//       };
// }

class DashBoardResponseModel {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    DashBoardResponseModel({this.remark, this.status, this.message, this.data});

    DashBoardResponseModel.fromJson(Map<String, dynamic> json) {
        remark = json["remark"];
        status = json["status"];
        message = json["message"] == null ? null : Message.fromJson(json["message"]);
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["remark"] = remark;
        _data["status"] = status;
        if(message != null) {
            _data["message"] = message?.toJson();
        }
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }
}

class Data {
    Data1? data;
    Path? path;

    Data({this.data, this.path});

    Data.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Data1.fromJson(json["data"]);
        path = json["path"] == null ? null : Path.fromJson(json["path"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        if(path != null) {
            _data["path"] = path?.toJson();
        }
        return _data;
    }
}

class Path {
    String? tournament;
    String? portrait;
    String? landscape;
    String? television;
    String? ads;

    Path({this.tournament, this.portrait, this.landscape, this.television, this.ads});

    Path.fromJson(Map<String, dynamic> json) {
        tournament = json["tournament"];
        portrait = json["portrait"];
        landscape = json["landscape"];
        television = json["television"];
        ads = json["ads"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["tournament"] = tournament;
        _data["portrait"] = portrait;
        _data["landscape"] = landscape;
        _data["television"] = television;
        _data["ads"] = ads;
        return _data;
    }
}

class Data1 {
    List<Sliders>? sliders;
    Televisions? televisions;
    List<Featured>? featured;
    List<RecentlyAdded>? recentlyAdded;
    List<LatestSeries>? latestSeries;
    List<Single>? single;
    List<Trailer>? trailer;
    List<Rent>? rent;
    List<FreeZone>? freeZone;
    dynamic advertise;
    List<dynamic>? tournaments;

    Data1({this.sliders, this.televisions, this.featured, this.recentlyAdded, this.latestSeries, this.single, this.trailer, this.rent, this.freeZone, this.advertise, this.tournaments});

    Data1.fromJson(Map<String, dynamic> json) {
        sliders = json["sliders"] == null ? null : (json["sliders"] as List).map((e) => Sliders.fromJson(e)).toList();
        televisions = json["televisions"] == null ? null : Televisions.fromJson(json["televisions"]);
        featured = json["featured"] == null ? null : (json["featured"] as List).map((e) => Featured.fromJson(e)).toList();
        recentlyAdded = json["recently_added"] == null ? null : (json["recently_added"] as List).map((e) => RecentlyAdded.fromJson(e)).toList();
        latestSeries = json["latest_series"] == null ? null : (json["latest_series"] as List).map((e) => LatestSeries.fromJson(e)).toList();
        single = json["single"] == null ? null : (json["single"] as List).map((e) => Single.fromJson(e)).toList();
        trailer = json["trailer"] == null ? null : (json["trailer"] as List).map((e) => Trailer.fromJson(e)).toList();
        rent = json["rent"] == null ? null : (json["rent"] as List).map((e) => Rent.fromJson(e)).toList();
        freeZone = json["free_zone"] == null ? null : (json["free_zone"] as List).map((e) => FreeZone.fromJson(e)).toList();
        advertise = json["advertise"];
        tournaments = json["tournaments"] ?? [];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(sliders != null) {
            _data["sliders"] = sliders?.map((e) => e.toJson()).toList();
        }
        if(televisions != null) {
            _data["televisions"] = televisions?.toJson();
        }
        if(featured != null) {
            _data["featured"] = featured?.map((e) => e.toJson()).toList();
        }
        if(recentlyAdded != null) {
            _data["recently_added"] = recentlyAdded?.map((e) => e.toJson()).toList();
        }
        if(latestSeries != null) {
            _data["latest_series"] = latestSeries?.map((e) => e.toJson()).toList();
        }
        if(single != null) {
            _data["single"] = single?.map((e) => e.toJson()).toList();
        }
        if(trailer != null) {
            _data["trailer"] = trailer?.map((e) => e.toJson()).toList();
        }
        if(rent != null) {
            _data["rent"] = rent?.map((e) => e.toJson()).toList();
        }
        if(freeZone != null) {
            _data["free_zone"] = freeZone?.map((e) => e.toJson()).toList();
        }
        _data["advertise"] = advertise;
        if(tournaments != null) {
            _data["tournaments"] = tournaments;
        }
        return _data;
    }
}

class FreeZone {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team7? team;
    Image7? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;

    FreeZone({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt});

    FreeZone.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team7.fromJson(json["team"]);
        image = json["image"] == null ? null : Image7.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image7 {
    String? landscape;
    String? portrait;

    Image7({this.landscape, this.portrait});

    Image7.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team7 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team7({this.director, this.producer, this.casts, this.genres, this.language});

    Team7.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class Rent {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team6? team;
    Image6? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;

    Rent({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt});

    Rent.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team6.fromJson(json["team"]);
        image = json["image"] == null ? null : Image6.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image6 {
    String? landscape;
    String? portrait;

    Image6({this.landscape, this.portrait});

    Image6.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team6 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team6({this.director, this.producer, this.casts, this.genres, this.language});

    Team6.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class Trailer {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team5? team;
    Image5? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;

    Trailer({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt});

    Trailer.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team5.fromJson(json["team"]);
        image = json["image"] == null ? null : Image5.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image5 {
    String? landscape;
    String? portrait;

    Image5({this.landscape, this.portrait});

    Image5.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team5 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team5({this.director, this.producer, this.casts, this.genres, this.language});

    Team5.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class Single {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team4? team;
    Image4? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;
    Category1? category;

    Single({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt, this.category});

    Single.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team4.fromJson(json["team"]);
        image = json["image"] == null ? null : Image4.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        category = json["category"] == null ? null : Category1.fromJson(json["category"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        if(category != null) {
            _data["category"] = category?.toJson();
        }
        return _data;
    }
}

class Category1 {
    int? id;
    String? name;
    int? status;
    String? createdAt;
    String? updatedAt;

    Category1({this.id, this.name, this.status, this.createdAt, this.updatedAt});

    Category1.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image4 {
    String? landscape;
    String? portrait;

    Image4({this.landscape, this.portrait});

    Image4.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team4 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team4({this.director, this.producer, this.casts, this.genres, this.language});

    Team4.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class LatestSeries {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team3? team;
    Image3? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;

    LatestSeries({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt});

    LatestSeries.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team3.fromJson(json["team"]);
        image = json["image"] == null ? null : Image3.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image3 {
    String? landscape;
    String? portrait;

    Image3({this.landscape, this.portrait});

    Image3.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team3 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team3({this.director, this.producer, this.casts, this.genres, this.language});

    Team3.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class RecentlyAdded {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team2? team;
    Image2? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;

    RecentlyAdded({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt});

    RecentlyAdded.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team2.fromJson(json["team"]);
        image = json["image"] == null ? null : Image2.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image2 {
    String? landscape;
    String? portrait;

    Image2({this.landscape, this.portrait});

    Image2.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team2 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team2({this.director, this.producer, this.casts, this.genres, this.language});

    Team2.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class Featured {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team1? team;
    Image1? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;

    Featured({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt});

    Featured.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team1.fromJson(json["team"]);
        image = json["image"] == null ? null : Image1.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image1 {
    String? landscape;
    String? portrait;

    Image1({this.landscape, this.portrait});

    Image1.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team1 {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team1({this.director, this.producer, this.casts, this.genres, this.language});

    Team1.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class Televisions {
    int? currentPage;
    List<TelevisionMain>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Links>? links;
    String? nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Televisions({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

    Televisions.fromJson(Map<String, dynamic> json) {
        currentPage = json["current_page"];
        data = json["data"] == null ? null : (json["data"] as List).map((e) => TelevisionMain.fromJson(e)).toList();
        firstPageUrl = json["first_page_url"];
        from = json["from"];
        lastPage = json["last_page"];
        lastPageUrl = json["last_page_url"];
        links = json["links"] == null ? null : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
        nextPageUrl = json["next_page_url"];
        path = json["path"];
        perPage = json["per_page"];
        prevPageUrl = json["prev_page_url"];
        to = json["to"];
        total = json["total"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["current_page"] = currentPage;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["first_page_url"] = firstPageUrl;
        _data["from"] = from;
        _data["last_page"] = lastPage;
        _data["last_page_url"] = lastPageUrl;
        if(links != null) {
            _data["links"] = links?.map((e) => e.toJson()).toList();
        }
        _data["next_page_url"] = nextPageUrl;
        _data["path"] = path;
        _data["per_page"] = perPage;
        _data["prev_page_url"] = prevPageUrl;
        _data["to"] = to;
        _data["total"] = total;
        return _data;
    }
}

class Links {
    dynamic url;
    String? label;
    bool? active;

    Links({this.url, this.label, this.active});

    Links.fromJson(Map<String, dynamic> json) {
        url = json["url"];
        label = json["label"];
        active = json["active"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["label"] = label;
        _data["active"] = active;
        return _data;
    }
}

class TelevisionMain {
    int? id;
    int? channelCategoryId;
    String? title;
    String? description;
    String? image;
    String? url;
    int? status;
    String? createdAt;
    String? updatedAt;

    TelevisionMain({this.id, this.channelCategoryId, this.title, this.description, this.image, this.url, this.status, this.createdAt, this.updatedAt});

    TelevisionMain.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        channelCategoryId = json["channel_category_id"];
        title = json["title"];
        description = json["description"];
        image = json["image"];
        url = json["url"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["channel_category_id"] = channelCategoryId;
        _data["title"] = title;
        _data["description"] = description;
        _data["image"] = image;
        _data["url"] = url;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Sliders {
    int? id;
    int? itemId;
    String? image;
    int? captionShow;
    int? status;
    String? createdAt;
    String? updatedAt;
    Item? item;

    Sliders({this.id, this.itemId, this.image, this.captionShow, this.status, this.createdAt, this.updatedAt, this.item});

    Sliders.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        itemId = json["item_id"];
        image = json["image"];
        captionShow = json["caption_show"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        item = json["item"] == null ? null : Item.fromJson(json["item"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["item_id"] = itemId;
        _data["image"] = image;
        _data["caption_show"] = captionShow;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        if(item != null) {
            _data["item"] = item?.toJson();
        }
        return _data;
    }
}

class Item {
    int? id;
    int? categoryId;
    int? subCategoryId;
    String? slug;
    String? title;
    String? previewText;
    String? description;
    Team? team;
    Image? image;
    int? itemType;
    int? status;
    int? single;
    int? trending;
    int? featured;
    int? version;
    String? tags;
    String? ratings;
    int? view;
    int? isTrailer;
    String? rentPrice;
    int? rentalPeriod;
    int? excludePlan;
    String? createdAt;
    String? updatedAt;
    Category? category;
    SubCategory? subCategory;

    Item({this.id, this.categoryId, this.subCategoryId, this.slug, this.title, this.previewText, this.description, this.team, this.image, this.itemType, this.status, this.single, this.trending, this.featured, this.version, this.tags, this.ratings, this.view, this.isTrailer, this.rentPrice, this.rentalPeriod, this.excludePlan, this.createdAt, this.updatedAt, this.category, this.subCategory});

    Item.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryId = json["category_id"];
        subCategoryId = json["sub_category_id"];
        slug = json["slug"];
        title = json["title"];
        previewText = json["preview_text"];
        description = json["description"];
        team = json["team"] == null ? null : Team.fromJson(json["team"]);
        image = json["image"] == null ? null : Image.fromJson(json["image"]);
        itemType = json["item_type"];
        status = json["status"];
        single = json["single"];
        trending = json["trending"];
        featured = json["featured"];
        version = json["version"];
        tags = json["tags"];
        ratings = json["ratings"];
        view = json["view"];
        isTrailer = json["is_trailer"];
        rentPrice = json["rent_price"];
        rentalPeriod = json["rental_period"];
        excludePlan = json["exclude_plan"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        category = json["category"] == null ? null : Category.fromJson(json["category"]);
        subCategory = json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_id"] = categoryId;
        _data["sub_category_id"] = subCategoryId;
        _data["slug"] = slug;
        _data["title"] = title;
        _data["preview_text"] = previewText;
        _data["description"] = description;
        if(team != null) {
            _data["team"] = team?.toJson();
        }
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["item_type"] = itemType;
        _data["status"] = status;
        _data["single"] = single;
        _data["trending"] = trending;
        _data["featured"] = featured;
        _data["version"] = version;
        _data["tags"] = tags;
        _data["ratings"] = ratings;
        _data["view"] = view;
        _data["is_trailer"] = isTrailer;
        _data["rent_price"] = rentPrice;
        _data["rental_period"] = rentalPeriod;
        _data["exclude_plan"] = excludePlan;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        if(category != null) {
            _data["category"] = category?.toJson();
        }
        if(subCategory != null) {
            _data["sub_category"] = subCategory?.toJson();
        }
        return _data;
    }
}

class SubCategory {
    int? id;
    String? name;
    int? categoryId;
    int? status;
    String? createdAt;
    String? updatedAt;

    SubCategory({this.id, this.name, this.categoryId, this.status, this.createdAt, this.updatedAt});

    SubCategory.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        categoryId = json["category_id"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["category_id"] = categoryId;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Category {
    int? id;
    String? name;
    int? status;
    String? createdAt;
    String? updatedAt;

    Category({this.id, this.name, this.status, this.createdAt, this.updatedAt});

    Category.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

class Image {
    String? landscape;
    String? portrait;

    Image({this.landscape, this.portrait});

    Image.fromJson(Map<String, dynamic> json) {
        landscape = json["landscape"];
        portrait = json["portrait"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["landscape"] = landscape;
        _data["portrait"] = portrait;
        return _data;
    }
}

class Team {
    String? director;
    String? producer;
    String? casts;
    String? genres;
    String? language;

    Team({this.director, this.producer, this.casts, this.genres, this.language});

    Team.fromJson(Map<String, dynamic> json) {
        director = json["director"];
        producer = json["producer"];
        casts = json["casts"];
        genres = json["genres"];
        language = json["language"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["director"] = director;
        _data["producer"] = producer;
        _data["casts"] = casts;
        _data["genres"] = genres;
        _data["language"] = language;
        return _data;
    }
}

class Message {
    String? success;

    Message({this.success});

    Message.fromJson(Map<String, dynamic> json) {
        success = json["success"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        return _data;
    }
}
