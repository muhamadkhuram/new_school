 import 'package:play_lab/data/model/global/common_api_response_model.dart';

// class LiveTvResponseModel {
//   LiveTvResponseModel({
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

//   LiveTvResponseModel.fromJson(dynamic json) {
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
//     Televisions? televisions,
//     String? imagePath,
//   }) {
//     _televisions = televisions;
//     _imagePath = imagePath;
//   }

//   Data.fromJson(dynamic json) {
//     _televisions = json['televisions'] != null ? Televisions.fromJson(json['televisions']) : null;
//     _imagePath = json['image_path'];
//   }
//   Televisions? _televisions;
//   String? _imagePath;

//   Televisions? get televisions => _televisions;
//   String? get imagePath => _imagePath;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_televisions != null) {
//       map['televisions'] = _televisions?.toJson();
//     }
//     map['image_path'] = _imagePath;
//     return map;
//   }
// }

// class Televisions {
//   Televisions({List<MainTelevisionModel>? data, dynamic nextPageUrl}) {
//     _data = data;
//     _nextPageUrl = nextPageUrl;
//   }

//   Televisions.fromJson(dynamic json) {
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(MainTelevisionModel.fromJson(v));
//       });
//     }
//     _nextPageUrl = json['next_page_url'];
//   }

//   List<MainTelevisionModel>? _data;
//   dynamic _nextPageUrl;

//   List<MainTelevisionModel>? get data => _data;
//   dynamic get nextPageUrl => _nextPageUrl;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_data != null) {
//       map['data'] = _data?.map((v) => v.toJson()).toList();
//     }
//     map['next_page_url'] = _nextPageUrl;
//     return map;
//   }
// }

// class MainTelevisionModel {
//   MainTelevisionModel({
//     int? id,
//     String? title,
//     String? image,
//     String? url,
//     String? status,
//     String? createdAt,
//     String? updatedAt,
//   }) {
//     _id = id;
//     _title = title;
//     _image = image;
//     _url = url;
//     _status = status;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//   }

//   MainTelevisionModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _title = json['title'];
//     _image = json['image'];
//     _url = json['url'];
//     _status = json['status'].toString();
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//   int? _id;
//   String? _title;
//   String? _image;
//   String? _url;
//   String? _status;
//   String? _createdAt;
//   String? _updatedAt;

//   int? get id => _id;
//   String? get title => _title;
//   String? get image => _image;
//   String? get url => _url;
//   String? get status => _status;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['title'] = _title;
//     map['image'] = _image;
//     map['url'] = _url;
//     map['status'] = _status;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
// }



  

class LiveTvResponseModel {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    LiveTvResponseModel({this.remark, this.status, this.message, this.data});

    LiveTvResponseModel.fromJson(Map<String, dynamic> json) {
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
    Televisions? televisions;
    String? imagePath;

    Data({this.televisions, this.imagePath});

    Data.fromJson(Map<String, dynamic> json) {
        televisions = json["televisions"] == null ? null : Televisions.fromJson(json["televisions"]);
        imagePath = json["image_path"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(televisions != null) {
            _data["televisions"] = televisions?.toJson();
        }
        _data["image_path"] = imagePath;
        return _data;
    }
}

class Televisions {
    int? currentPage;
    List<MainTelevisionModel>? data;
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
        data = json["data"] == null ? null : (json["data"] as List).map((e) => MainTelevisionModel.fromJson(e)).toList();
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

class MainTelevisionModel {
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

    MainTelevisionModel({this.id, this.channelCategoryId, this.title, this.description, this.image, this.url, this.status, this.createdAt, this.updatedAt, this.category});

    MainTelevisionModel.fromJson(Map<String, dynamic> json) {
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

class Message {
    List<String>? success;

    Message({this.success});

    Message.fromJson(Map<String, dynamic> json) {
        success = json["success"] == null ? null : List<String>.from(json["success"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(success != null) {
            _data["success"] = success;
        }
        return _data;
    }
}