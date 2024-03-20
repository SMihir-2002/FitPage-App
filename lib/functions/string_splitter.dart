
stringSplitter({required String text}) {
  List<String> resultList = [];
  RegExp regExp = RegExp(r'(\$[0-9]+)');

  List<RegExpMatch> matches = regExp.allMatches(text).toList();
  int lastIndex = 0;

  for (RegExpMatch match in matches) {
    resultList.add(text.substring(lastIndex, match.start));
    resultList.add(match.group(0)!);
    lastIndex = match.end;
  }

  // Add the remaining part of the string
  resultList.add(text.substring(lastIndex));

  return resultList;
}
