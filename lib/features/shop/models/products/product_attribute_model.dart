class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  ///Convert model to json
  toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  ///Convert Json to model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
