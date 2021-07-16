extension StringExtension on String {
  String get firstLetter {
    return this[0].toUpperCase();
  }

  String get firstLetterToUpperCase {
    return this[0].toUpperCase() + this.substring(1);
  }

  String get firstWord {
    List<String> words = this.split(' ');
    if (words.length > 0) {
      return words[0];
    } else {
      return this;
    }
  }

  String capitalize({bool allWords = true}) {
    if (this.isEmpty) {
      return '';
    }
    var input = this.toLowerCase();
    if (allWords) {
      List<String> words = input.split(' ');
      var capitalized = words.map((word) {
        if (word.isEmpty) {
          return '';
        }
        return word[0].toUpperCase() + word.substring(1);
      }).join(' ');
      return capitalized;
    } else {
      return input[0].toUpperCase() + input.substring(1);
    }
  }
}
