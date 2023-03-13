class Quotes {

  //parameters to take data from json
  final String quote; //for quote
  final String name; //for author name

  //Constructor to call and assign parameters
  Quotes({
    required this.quote,
    required this.name,
  });

  //factory constructor to convert raw data to custom data
  factory Quotes.fromMap({required Map data}) {
    return Quotes(quote: data['quoteText'], name: data['quoteAuthor']);
  }
}
