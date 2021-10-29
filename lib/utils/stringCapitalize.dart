extension StringExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String capitalize() {
    return "${this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.inCaps).join(" ")}";
  }
  RegExp regExp = new RegExp(
  r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789",
  caseSensitive: false,
  multiLine: false,
);
print("allMatches : "+regExp.allMatches("WS://127.0.0.1:56789").toString());
print("firstMatch : "+regExp.firstMatch("WS://127.0.0.1:56789").toString());
print("hasMatch : "+regExp.hasMatch("WS://127.0.0.1:56789").toString());
print("stringMatch : "+regExp.stringMatch("WS://127.0.0.1:56789").toString());
}
