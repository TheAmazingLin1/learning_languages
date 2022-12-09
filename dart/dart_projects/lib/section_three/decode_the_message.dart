String decodeMessage(String key, String message) {
    final alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    final decode = <String, String>{};
      decode[" "] = " ";
    for (final letter in alphabet) {
        for (int i = 0; i < key.length; i++) {
            if (decode.containsKey(key[i])) continue;
            decode[key[i]] = letter;
            break;
        }
    }

    var decrypted = "";

    for (int i = 0; i < message.length; i++) {
        decrypted += decode[message[i]] ?? "";
    }
    return decrypted;
}
