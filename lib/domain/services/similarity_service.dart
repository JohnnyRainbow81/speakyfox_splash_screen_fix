class SimilarityService {
  //before adapting Juliens code, check this: 
  //https://pub.dev/packages/string_similarity  !!
  //https://pub.dev/packages/edit_distance

  static const String punctuation = "/[.,\/#!%\^&\*;:{}=\-_`~?]/g";
  //Ask Julien

  static void calculateSimilarity(String input, String target) {
    //https://pub.dev/documentation/edit_distance/latest/edit_distance/JaroWinkler-class.html

    final s1 = input.split(" ");
    final s2 = target.split(" ");
    throw UnimplementedError();
  }

  static cleanArray(dynamic a) {}

  static void orderSimilarity(dynamic v, dynamic otherLength) {}

  static dynamic similarityTable(dynamic a, dynamic b, dynamic options) {}

  static void bestMatch(dynamic table) {}

  static void exactScore(dynamic bm, dynamic a, dynamic b) {}

  static void matchScore() {}

  static lengthScore(dynamic a, dynamic b) {}

  static dynamic computeVectors(dynamic bm, dynamic a, dynamic b) {}

  static void similarity(dynamic ain, dynamic bin, dynamic options) {}

  static void calculateDifferences(String o, String n) {}
  static void diffString2(String o, String n) {}

  static void escape(dynamic s) {}

  static void randomColor(){}

  static void diff(dynamic o, dynamic n) {}


}
