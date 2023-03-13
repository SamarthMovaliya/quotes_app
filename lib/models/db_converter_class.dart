class db_Entry {
  //variables to store data in DB
  int? id;
  final String quote;
  final String name;

  //constructor to initialize variables
  db_Entry({
    this.id,
    required this.quote,
    required this.name,
  });

  //factory constructor to convert raw data to custom data and store in database data object
  factory db_Entry.fromMap(Map<String, dynamic> data) {
    return db_Entry(
      id: data['id'],
      quote: data['quote'],
      name: data['name'],
    );
  }
}

List category = [
  {'name': "Attitude", 'img': "assets/images/attitude.jpg"},
  {'name': "brave", 'img': "assets/images/brave.jpg"},
  {'name': "confidence", 'img': "assets/images/confidence.jpg"},
  {'name': "enterprenuer", 'img': "assets/images/enterprenuer.jpg"},
  {'name': "forgive", 'img': "assets/images/forgive.jpg"},
  {'name': "learning", 'img': "assets/images/learning.jpg"},
  {'name': "motivation", 'img': "assets/images/motivation.jpg"},
  {'name': "paitence", 'img': "assets/images/paitence.jpg"},
  {'name': "random", 'img': "assets/images/random.jpg"},
];
