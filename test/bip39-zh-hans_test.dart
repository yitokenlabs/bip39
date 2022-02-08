import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:hex/hex.dart';
import 'package:test/test.dart';


void main() {
  final languages = [
    'zh-hans',
    'zh-hant',
    'cs',
    'en',
    'fr',
    'it',
    'ja',
    'ko',
    'pt',
    'es',
  ];
  for (var language in languages) {
    testMnemonic(language);
  }
}

void testMnemonic(String language) {
  String mnemonic = bip39.generateMnemonic(language: language);
  bool valid = bip39.validateMnemonic(mnemonic, language: language);
  String entropy = bip39.mnemonicToEntropy(mnemonic, language: language);

  print('mnemonic($language): $mnemonic');
  print('valid($language): $valid');
  print('entropy($language): $entropy \n\n');

  group('mnemonic', () {
    test('throws for mnemonic that is invalid', () {
      try {
        expect(bip39.entropyToMnemonic(entropy, language: language), equals(mnemonic));
      } catch (err) {
        expect((err as ArgumentError).message, "Invalid mnemonic");
      }
    });
  });
}
