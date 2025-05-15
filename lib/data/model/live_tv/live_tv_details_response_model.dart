import 'package:play_lab/data/model/global/common_api_response_model.dart';



class LiveTvDetailsResponseModel {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    LiveTvDetailsResponseModel({this.remark, this.status, this.message, this.data});

    LiveTvDetailsResponseModel.fromJson(Map<String, dynamic> json) {
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
    Tv? tv;
    List<RelatedTv>? relatedTv;
    String? imagePath;

    Data({this.tv, this.relatedTv, this.imagePath});

    Data.fromJson(Map<String, dynamic> json) {
        tv = json["tv"] == null ? null : Tv.fromJson(json["tv"]);
        relatedTv = json["related_tv"] == null ? null : (json["related_tv"] as List).map((e) => RelatedTv.fromJson(e)).toList();
        imagePath = json["image_path"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(tv != null) {
            _data["tv"] = tv?.toJson();
        }
        if(relatedTv != null) {
            _data["related_tv"] = relatedTv?.map((e) => e.toJson()).toList();
        }
        _data["image_path"] = imagePath;
        return _data;
    }
}

class RelatedTv {
    int? id;
    int? channelCategoryId;
    String? title;
    String? description;
    String? image;
    String? url;
    int? status;
    String? createdAt;
    String? updatedAt;

    RelatedTv({this.id, this.channelCategoryId, this.title, this.description, this.image, this.url, this.status, this.createdAt, this.updatedAt});

    RelatedTv.fromJson(Map<String, dynamic> json) {
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

class Tv {
    int? id;
    int? channelCategoryId;
    String? title;
    String? description;
    String? image;
    String? url;
    int? status;
    String? createdAt;
    String? updatedAt;
    Category? category;

    Tv({this.id, this.channelCategoryId, this.title, this.description, this.image, this.url, this.status, this.createdAt, this.updatedAt, this.category});

    Tv.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        channelCategoryId = json["channel_category_id"];
        title = json["title"];
        description = json["description"];
        image = json["image"];
        url = json["url"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        category = json["category"] == null ? null : Category.fromJson(json["category"]);
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
        if(category != null) {
            _data["category"] = category?.toJson();
        }
        return _data;
    }
}

class Category {
    int? id;
    String? name;
    String? price;
    int? status;
    String? createdAt;
    String? updatedAt;

    Category({this.id, this.name, this.price, this.status, this.createdAt, this.updatedAt});

    Category.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        price = json["price"];
        status = json["status"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["price"] = price;
        _data["status"] = status;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}

// class Message {
//     List<String>? success;


//     Message({this.success});

//     Message.fromJson(Map<String, dynamic> json) {
//         success = json["success"] == null ? null : List<String>.from(json["success"]);
//     }

//     Map<String, dynamic> toJson() {
//         final Map<String, dynamic> _data = <String, dynamic>{};
//         if(success != null) {
//             _data["success"] = success;
//         }
//         return _data;
//     }
// }

// class LiveTvDetailsResponseModel {
//   LiveTvDetailsResponseModel({
//     String? remark,
//     String? status,
//     Message? message,
//     Data? data,
//   }) {
//     _remark = remark;
//     _status = status;
//     _message = message;
//     _data = data;
//   }

//   LiveTvDetailsResponseModel.fromJson(dynamic json) {
//     _remark = json['remark'];
//     _status = json['status'].toString();
//     _message = json['message'] != null ? Message.fromJson(json['message']) : null;
//     _data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   String? _remark;
//   String? _status;
//   Message? _message;
//   Data? _data;

//   String? get remark => _remark;
//   String? get status => _status;
//   Message? get message => _message;
//   Data? get data => _data;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['remark'] = _remark;
//     map['status'] = _status;
//     if (_message != null) {
//       map['message'] = _message?.toJson();
//     }
//     if (_data != null) {
//       map['data'] = _data?.toJson();
//     }
//     return map;
//   }
// }

// class Data {
//   Data({
//     Tv? tv,
//     List<RelatedTv>? relatedTv,
//     String? imagePath,
//   }) {
//     _tv = tv;
//     _relatedTv = relatedTv;
//     _imagePath = imagePath;
//   }

//   Data.fromJson(dynamic json) {
//     _tv = json['tv'] != null ? Tv.fromJson(json['tv']) : null;
//     if (json['related_tv'] != null) {
//       _relatedTv = [];
//       json['related_tv'].forEach((v) {
//         _relatedTv?.add(RelatedTv.fromJson(v));
//       });
//     }
//     _imagePath = json['image_path'];
//   }
//   Tv? _tv;
//   List<RelatedTv>? _relatedTv;
//   String? _imagePath;

//   Tv? get tv => _tv;
//   List<RelatedTv>? get relatedTv => _relatedTv;
//   String? get imagePath => _imagePath;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_tv != null) {
//       map['tv'] = _tv?.toJson();
//     }
//     if (_relatedTv != null) {
//       map['related_tv'] = _relatedTv?.map((v) => v.toJson()).toList();
//     }
//     map['image_path'] = _imagePath;
//     return map;
//   }
// }

// class RelatedTv {
//   RelatedTv({
//     int? id,
//     String? title,
//     String? image,
//     String? url,
//     dynamic description,
//     String? status,
//     String? createdAt,
//     String? updatedAt,
//   }) {
//     _id = id;
//     _title = title;
//     _image = image;
//     _url = url;
//     _description = description;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//   }

//   RelatedTv.fromJson(dynamic json) {
//     _id = json['id'];
//     _title = json['title'];
//     _image = json['image'];
//     _url = json['url'];
//     _description = json['description'];
//     _status = json['status'].toString();
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//   int? _id;
//   String? _title;
//   String? _image;
//   String? _url;
//   dynamic _description;
//   String? _status;
//   String? _createdAt;
//   String? _updatedAt;

//   int? get id => _id;
//   String? get title => _title;
//   String? get image => _image;
//   String? get url => _url;
//   dynamic get description => _description;
//   String? get status => _status;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['title'] = _title;
//     map['image'] = _image;
//     map['url'] = _url;
//     map['description'] = _description;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
// }

// class Tv {
//   Tv({
//     int? id,
//     String? title,
//     String? image,
//     String? url,
//     dynamic description,
//     String? status,
//     String? createdAt,
//     String? updatedAt,
//   }) {
//     _id = id;
//     _title = title;
//     _image = image;
//     _url = url;
//     _description = description;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//   }

//   Tv.fromJson(dynamic json) {
//     _id = json['id'];
//     _title = json['title'];
//     _image = json['image'];
//     _url = json['url'];
//     _description = json['description'];
//     _status = json['status'].toString();
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//   int? _id;
//   String? _title;
//   String? _image;
//   String? _url;
//   dynamic _description;
//   String? _status;
//   String? _createdAt;
//   String? _updatedAt;

//   int? get id => _id;
//   String? get title => _title;
//   String? get image => _image;
//   String? get url => _url;
//   String? get description => _description;
//   String? get status => _status;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['title'] = _title;
//     map['image'] = _image;
//     map['url'] = _url;
//     map['description'] = _description;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
// }
