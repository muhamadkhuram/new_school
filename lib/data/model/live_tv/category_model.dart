
class TvCategories {
    bool? success;
    List<String>? categories;

    TvCategories({this.success, this.categories});

    TvCategories.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        if(categories != null) {
            _data["categories"] = categories;
        }
        return _data;
    }
}