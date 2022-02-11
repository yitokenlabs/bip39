import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bip39_l10n/bip39.dart' as bip39;
import '../lib/src/wordlists/chinese_simplified.dart' as chinese_simplified;
import '../lib/src/wordlists/english.dart' as english;
import 'package:hex/hex.dart';
import 'package:test/test.dart';


void main() {
  final languages = bip39.WORDLIST_MAP.keys.toList();
  for (var language in languages) {
    testMnemonic(language);
  }

  convert();
}

void convert() {
  final mnemonic = 'jealous cruise bench powder junk movie mobile matter maid boat hedgehog eternal';
  final zhMnemonic = bip39.convertTo(mnemonic, 'en', 'zh-Hans');
  print('zhMnemonic: $zhMnemonic');
  print('entropy(en): ${bip39.mnemonicToEntropy(mnemonic)}');
  print('entropy(zh): ${bip39.mnemonicToEntropy(zhMnemonic, language: 'zh-Hans')}');

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
