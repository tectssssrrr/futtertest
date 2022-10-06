
class News {
  String? reason;
  Result? result;
  int? errorCode;

   News({this.reason, this.result, this.errorCode});

  News.fromJson(Map<String, dynamic> json) {

    reason = json['reason'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['error_code'] = this.errorCode;
    return data;
  }
}

class Result {
  String? stat;
  List<Data>? data;
  String? page;
  String? pageSize;

  Result({this.stat, this.data, this.page, this.pageSize});

  Result.fromJson(Map<String, dynamic> json) {
    stat = json['stat'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    page = json['page'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stat'] = this.stat;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    return data;
  }
}

class Data {
  String? uniquekey;
  String? title;
  String? data;
  String? category;
  String? authorName;
  String? url;
  String? thumbnailPicS;
  String? thumbnailPicS02;
  String? thumbnailPicS03;
  String? isContent;

  Data({
    this.uniquekey,
    this.title,
    this.data,
    this.category,
    this.authorName,
    this.url,
    this.thumbnailPicS,
    this.thumbnailPicS02,
    this.thumbnailPicS03,
    this.isContent,
  });

  Data.fromJson(Map<String, dynamic> json) {
    uniquekey = json['uniquekey'];
    title = json['title'];
    data = json['data'];
    category = json['category'];
    authorName = json['author_name'];
    url = json['url'];
    thumbnailPicS = json['thumbnail_pic_s'];
    thumbnailPicS02 = json['thumbnail_pic_s02'];
    thumbnailPicS03 = json['thumbnail_pic_s03'];
    isContent = json['isContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniquekey'] = this.uniquekey;
    data['title'] = this.title;
    data['data'] = this.data;
    data['category'] = this.category;
    data['author_name'] = this.authorName;
    data['url'] = this.url;
    data['thumbnail_pic_s'] = this.thumbnailPicS;
    data['thumbnail_pic_s02'] = this.thumbnailPicS02;
    data['thumbnail_pic_s03'] = this.thumbnailPicS03;
    data['isContent'] = this.isContent;
    return data;
  }
}
