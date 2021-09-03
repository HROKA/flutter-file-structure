encrypt(key, str) {
  var s = [];
  var j = 0;
  var x = 0;
  var res = '';
  var i = 0;

  for (i = 0; i < 256; i++) {
    s.add(i);
  }
  for (i = 0; i < 256; i++) {
    j = int.parse('${(j + s[i] + key.codeUnitAt(i % key.length)) % 256}');
    x = s[i];
    s[i] = s[j];
    s[j] = x;
  }
  i = 0;
  j = 0;

  for (var y = 0; y < str.length; y++) {
    i = (i + 1) % 256;
    j = int.parse('${(j + s[i]) % 256}');
    x = s[i];
    s[i] = s[j];
    s[j] = x;
    res += '${str.codeUnitAt(y) ^ s[(s[i] + s[j]) % 256]}';
  }
  return res;
}

generatorKeyScript(TenantLevel, TenantKey, ClientPrefix, SecretPhrase) {
  var CallTime = DateTime.now().millisecondsSinceEpoch / (1000 * 60).round();
  var forEnc =
      '${'$TenantLevel$TenantKey$ClientPrefix'.toUpperCase()}$CallTime${'A' * 50}'
          .substring(0, 40);
  return encrypt(forEnc, SecretPhrase);
}
