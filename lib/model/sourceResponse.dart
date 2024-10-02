class SourceResponse {
  // Non-nullable fields initialized via constructor or fromJson.
  String? _status;
  List<Sources>? _sources;

  // Constructor with named optional parameters.
  SourceResponse({
    String? status,
    List<Sources>? sources,
  }) {
    _status = status;
    _sources = sources;
  }

  // Named constructor for initializing from JSON.
  SourceResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
  }

  // CopyWith method for immutability.
  SourceResponse copyWith({
    String? status,
    List<Sources>? sources,
  }) =>
      SourceResponse(
        status: status ?? _status,
        sources: sources ?? _sources,
      );

  // Getters
  String? get status => _status;
  List<Sources>? get sources => _sources;

  // Convert object to JSON.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Sources {
  // Declare all fields with null safety.
  String? _id;
  String? _name;
  String? _description;
  String? _url;
  String? _category;
  String? _language;
  String? _country;

  // Constructor with named optional parameters.
  Sources({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _url = url;
    _category = category;
    _language = language;
    _country = country;
  }

  // Named constructor for initializing from JSON.
  Sources.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _url = json['url'];
    _category = json['category'];
    _language = json['language'];
    _country = json['country'];
  }

  // CopyWith method for immutability.
  Sources copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) =>
      Sources(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        url: url ?? _url,
        category: category ?? _category,
        language: language ?? _language,
        country: country ?? _country,
      );

  // Getters
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get url => _url;
  String? get category => _category;
  String? get language => _language;
  String? get country => _country;

  // Convert object to JSON.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['url'] = _url;
    map['category'] = _category;
    map['language'] = _language;
    map['country'] = _country;
    return map;
  }
}
