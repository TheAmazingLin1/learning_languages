int mostWordsFound(List<String> sentences) {
  int maxWords = 0;
  for (final sentence in sentences) {
        int spacesCount = 0;
        for (int i = 0; i < sentence.length; i++) {
            if (sentence[i] == " ") {
              spacesCount++;
            }
        }
        maxWords = max(maxWords, spacesCount + 1);
    }
    return maxWords;
}
