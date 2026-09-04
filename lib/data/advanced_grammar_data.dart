import 'beginner_grammar_data.dart';

GrammarQuestion _advancedQuestion(
  String question,
  List<String> options,
  int answerIndex,
) => GrammarQuestion(
  question: question,
  options: options,
  answerIndex: answerIndex,
);

final _advancedGrammarQuestions = <GrammarQuestion>[
  _advancedQuestion('Choose the correctly punctuated sentence.', [
    'After the match we went home.',
    'After the match, we went home.',
    'After, the match we went home.',
    'After the match we, went home.',
  ], 1),
  _advancedQuestion('Which sentence uses a semicolon correctly?', [
    'The rain stopped; the players returned to the pitch.',
    'The rain; stopped the players returned to the pitch.',
    'The rain stopped the; players returned to the pitch.',
    'The rain stopped; because the players returned.',
  ], 0),
  _advancedQuestion(
    'Choose the correct form: Neither the coach nor the players ___ ready.',
    ['was', 'is', 'were', 'be'],
    2,
  ),
  _advancedQuestion('Which sentence is written in the passive voice?', [
    'The council repaired the footbridge.',
    'The footbridge was repaired by the council.',
    'The council is repairing the footbridge.',
    'The footbridge needs repairs.',
  ], 1),
  _advancedQuestion(
    'Choose the correct relative pronoun: The author, ___ novel won the prize, thanked her editor.',
    ['who', 'which', 'whose', 'whom'],
    2,
  ),
  _advancedQuestion('Which sentence contains a subordinate clause?', [
    'The train arrived and the passengers boarded.',
    'The passengers boarded when the train arrived.',
    'The train arrived at noon.',
    'The passengers boarded quickly.',
  ], 1),
  _advancedQuestion(
    'Choose the correct tense: By next month, the researchers ___ the survey.',
    [
      'complete',
      'completed',
      'will have completed',
      'are completing yesterday',
    ],
    2,
  ),
  _advancedQuestion(
    'Which word is an adverbial in: In the evening, the lights shone across the harbour?',
    ['the lights', 'shone', 'In the evening', 'across'],
    2,
  ),
  _advancedQuestion('Choose the correct spelling for British English.', [
    'organize',
    'organise',
    'orginise',
    'organizee',
  ], 1),
  _advancedQuestion('Which sentence uses a colon correctly?', [
    'The museum displayed three objects: a coin, a vase and a map.',
    'The museum displayed: three objects a coin, a vase and a map.',
    'The museum: displayed three objects, a coin, a vase and a map.',
    'The museum displayed three: objects a coin, a vase and a map.',
  ], 0),
  _advancedQuestion(
    'What is the function of the modal verb in: Visitors must remain behind the barrier?',
    [
      'It expresses obligation.',
      'It expresses a past action.',
      'It names a person.',
      'It joins two nouns.',
    ],
    0,
  ),
  _advancedQuestion(
    'Choose the correct homophone: The hikers reached the mountain ___.',
    ['peak', 'peek', 'peke', 'peaque'],
    0,
  ),
  _advancedQuestion('Which sentence uses brackets correctly?', [
    'The library (which opened in 1895) is being restored.',
    'The library which (opened in 1895 is being restored).',
    'The library (which opened in 1895 is being restored.',
    'The library which opened) in 1895 (is being restored.',
  ], 0),
  _advancedQuestion('Choose the correct comparative form.', [
    'more carefully',
    'carefuller',
    'most carefully than',
    'carefulest',
  ], 0),
  _advancedQuestion(
    'Which word is an abstract noun in: Her determination impressed the judges?',
    ['Her', 'determination', 'impressed', 'judges'],
    1,
  ),
  _advancedQuestion('Choose the sentence with the correct apostrophe.', [
    'The childrens playground was closed.',
    'The childrens\' playground was closed.',
    'The children\'s playground was closed.',
    'The childrens playground\' was closed.',
  ], 2),
  _advancedQuestion(
    'Which sentence uses a hyphenated compound adjective correctly?',
    [
      'The well known artist visited Leeds.',
      'The well-known artist visited Leeds.',
      'The well known-artist visited Leeds.',
      'The well-known artist visited, Leeds.',
    ],
    1,
  ),
  _advancedQuestion(
    'Choose the correct word: The new policy will ___ all sixth-form students.',
    ['affect', 'effect', 'effekt', 'a ffect'],
    0,
  ),
  _advancedQuestion(
    'Which sentence uses the subjunctive correctly in formal English?',
    [
      'The head teacher recommended that he is present.',
      'The head teacher recommended that he be present.',
      'The head teacher recommended that he was present.',
      'The head teacher recommended that he being present.',
    ],
    1,
  ),
  _advancedQuestion(
    'Choose the clearest sentence with a correctly placed apostrophe and comma.',
    [
      'Maya, the team captain thanked the referee.',
      'Maya the team captain, thanked the referee.',
      'Maya, the team captain, thanked the referee.',
      'Maya the team captain thanked, the referee.',
    ],
    2,
  ),
];

final advancedGrammarTests = List<List<GrammarQuestion>>.generate(
  10,
  (_) => List<GrammarQuestion>.from(_advancedGrammarQuestions),
);
