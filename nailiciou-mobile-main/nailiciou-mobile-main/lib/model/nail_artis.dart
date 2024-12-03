class NailArtist {
  int? id;
  String? name;
  String? email;
  String? specialty;
  String? bio;
  String? photo;

  // Constructor
  NailArtist({
    this.id,
    this.name,
    this.email,
    this.specialty,
    this.bio,
    this.photo,
  });

  factory NailArtist.fromJson(Map<String, dynamic> json) {
    return NailArtist(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      specialty: json['specialty'],
      bio: json['bio'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'specialty': specialty,
      'bio': bio,
      'photo': photo,
    };
  }

  @override
  String toString() {
    return name!;
  }
}
