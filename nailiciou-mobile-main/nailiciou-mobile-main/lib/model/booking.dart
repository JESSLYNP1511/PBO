class Booking {
  int? id;
  int? userId;
  int? artistId;
  int? serviceId;
  String? status;
  String? note;
  DateTime? bookingTime;
  String? serviceName;
  String? artistName;
  int? price;

  // Constructor
  Booking({
    this.id,
    this.userId,
    this.artistId,
    this.serviceId,
    this.status,
    this.note,
    this.bookingTime,
    this.serviceName,
    this.artistName,
    this.price,
  });

  // Factory constructor for creating a Booking instance from JSON
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['user_id'],
      artistId: json['artist_id'],
      serviceId: json['service_id'],
      status: json['status'],
      note: json['note'],
      bookingTime: json['booking_time'] != null
          ? DateTime.parse(json['booking_time'])
          : null,
      serviceName: json['service_name'],
      artistName: json['artist_name'],
      price: json['price'],
    );
  }

  // Method for converting a Booking instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'artist_id': artistId,
      'service_id': serviceId,
      'status': status,
      'note': note,
      'booking_time': bookingTime?.toIso8601String(),
      'service_name': serviceName,
      'artist_name': artistName,
      'price': price,
    };
  }

  // For debugging and logging purposes
  @override
  String toString() {
    return 'Booking(id: $id, userId: $userId, artistId: $artistId, serviceId: $serviceId, status: $status, note: $note, bookingTime: $bookingTime, serviceName: $serviceName, artistName: $artistName, price: $price)';
  }
}
