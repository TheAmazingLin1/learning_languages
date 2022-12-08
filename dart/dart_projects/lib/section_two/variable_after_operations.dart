int finalValueAfterOperations(List<String> operations) {
    int x = 0;
    for (final str in operations) {
        if (str[1] == "+") {
          x++;
        } else {
            x--;
        }
    }
    return x;
}
