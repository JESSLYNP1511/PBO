class Service {
  int? id;
  String? name;
  String? description;
  double? price;

  // Constructor
  Service({
    this.id,
    this.name,
    this.description,
    this.price,
  });

  // Factory constructor for creating a Service instance from JSON
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
    );
  }

  // Method for converting a Service instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  // For debugging and logging purposes
  @override
  String toString() {
    return name!;
  }
}
