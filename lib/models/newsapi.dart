import 'dart:convert';

class NewsModel {
  static List<News>? new_piece;
}

class News {
  final String? date;
  final String? title;
  final String? content;
  News({
    this.date,
    this.title,
    this.content,
  });

  News copyWith({
    String? date,
    String? title,
    String? content,
  }) {
    return News(
      date: date ?? this.date,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'title': title,
      'content': content,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    var d = map['date'].replaceAll("T", "   ");
    d = d.replaceAll("+00:00", "");
    return News(
      date: d,
      title: map['title'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() => 'News(date: $date, title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.date == date &&
        other.title == title &&
        other.content == content;
  }

  @override
  int get hashCode => date.hashCode ^ title.hashCode ^ content.hashCode;
}
