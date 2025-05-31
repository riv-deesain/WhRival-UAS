class Dosen {
  final int id;
  final String nama;
  final String avatar;
  final List<Chat> chat;

  Dosen({
    required this.id,
    required this.nama,
    required this.avatar,
    required this.chat,
  });

  factory Dosen.fromJson(Map<String, dynamic> json) {
    return Dosen(
      id: json['id'],
      nama: json['name'],
      avatar: json['img'],
      chat: (json['details'] as List).map((e) => Chat.fromJson(e)).toList(),
    );
  }
}

class Chat {
  final int from; // 1 = saya, 0 = dosen
  final String isi;

  Chat({
    required this.from,
    required this.isi,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      from: json['role'] == 'saya' ? 1 : 0, // ✅ Ini benar
      isi: json['message'],
    );
  }
}
