// ============================================================================
// WordList: https://github.com/iancoleman/bip39/blob/master/src/js/wordlist_chinese_simplified.js
// Language Code: https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
// ============================================================================
import 'chinese_simplified.dart' as chinese_simplified;
import 'chinese_traditional.dart' as chinese_traditional;
import 'czech.dart' as czech;
import 'english.dart' as english;
import 'french.dart' as french;
import 'italian.dart' as italian;
import 'japanese.dart' as japanese;
import 'korean.dart' as korean;
import 'portuguese.dart' as portuguese;
import 'spanish.dart' as spanish;

const String DEFAULT_LANGUAGE = "en";

const Map<String, List<String>> WORDLIST_MAP = {
  'zh-hans': chinese_simplified.WORDLIST,
  'zh-hant': chinese_traditional.WORDLIST,
  'cs': czech.WORDLIST,
  'en': english.WORDLIST,
  'fr': french.WORDLIST,
  'it': italian.WORDLIST,
  'ja': japanese.WORDLIST,
  'ko': korean.WORDLIST,
  'pt': portuguese.WORDLIST,
  'es': spanish.WORDLIST,
};

List<String> getWordList({String language = 'en'}) {
  if (WORDLIST_MAP.containsKey(language)) {
    return WORDLIST_MAP[language]!;
  } else {
    return WORDLIST_MAP[DEFAULT_LANGUAGE]!;
  }
}