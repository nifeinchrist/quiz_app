class GrammarQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;

  const GrammarQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}

const ks1GrammarQuestions = <GrammarQuestion>[
  GrammarQuestion(
    question: 'Choose the noun in this sentence: The dog ran home.',
    options: ['Choose', 'dog', 'ran', 'home'],
    answerIndex: 1,
  ),
  GrammarQuestion(
    question: 'Which word is a verb? The children skip to school.',
    options: ['children', 'to', 'skip', 'school'],
    answerIndex: 2,
  ),
  GrammarQuestion(
    question: 'Choose the correct word: The cat ___ on the mat.',
    options: ['sit', 'sits', 'sitting', 'sitted'],
    answerIndex: 1,
  ),
  GrammarQuestion(
    question: 'Which sentence starts with a capital letter?',
    options: [
      'my name is Aisha.',
      'My name is Aisha.',
      'my Name is Aisha.',
      'MY name is aisha.',
    ],
    answerIndex: 1,
  ),
  GrammarQuestion(
    question: 'Choose the correct plural of "box".',
    options: ['boxs', 'boxes', 'boxies', 'box'],
    answerIndex: 1,
  ),
  GrammarQuestion(
    question: 'Which word is an adjective? The bright sun shone.',
    options: ['bright', 'sun', 'shone', 'the'],
    answerIndex: 0,
  ),
  GrammarQuestion(
    question: 'Choose the correct pronoun: ___ are going to the park.',
    options: ['We', 'Us', 'Our', 'Ours'],
    answerIndex: 0,
  ),
  GrammarQuestion(
    question: 'Which punctuation mark ends this question: Where is Ben___',
    options: ['.', ',', '!', '?'],
    answerIndex: 3,
  ),
  GrammarQuestion(
    question: 'Choose the correct past tense: Yesterday, I ___ my room.',
    options: ['clean', 'cleans', 'cleaned', 'cleaning'],
    answerIndex: 2,
  ),
  GrammarQuestion(
    question: 'Choose the correct word: There ___ three apples in the bowl.',
    options: ['is', 'are', 'am', 'be'],
    answerIndex: 1,
  ),
];

const ks1GrammarTests = <List<GrammarQuestion>>[
  ks1GrammarQuestions,
  [
    GrammarQuestion(
      question: 'Which word is a noun? The rabbit hops.',
      options: ['rabbit', 'hops', 'the', 'is'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Choose the verb: Birds sing in trees.',
      options: ['Birds', 'sing', 'in', 'trees'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'The baby ___ loudly.',
      options: ['cry', 'cries', 'crying', 'cried'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correct sentence.',
      options: [
        'the sun is hot.',
        'The sun is hot.',
        'The Sun is hot.',
        'the Sun is hot.',
      ],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'What is the plural of "dish"?',
      options: ['dishs', 'dishies', 'dishes', 'dish'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Which word describes the ball? The red ball rolled.',
      options: ['ball', 'rolled', 'red', 'the'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: '___ is my friend.',
      options: ['Her', 'She', 'Hers', 'Them'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the ending mark: Stop___',
      options: ['?', '.', ',', ':'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Yesterday, we ___ to the shop.',
      options: ['walk', 'walks', 'walked', 'walking'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'There ___ a bird in the tree.',
      options: ['are', 'am', 'is', 'be'],
      answerIndex: 2,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Which word names a person? The teacher smiled.',
      options: ['teacher', 'smiled', 'the', 'a'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which word is an action? The frog jumps.',
      options: ['frog', 'the', 'jumps', 'is'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Mum ___ dinner every night.',
      options: ['cook', 'cooks', 'cooking', 'cooked'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the sentence with a capital I.',
      options: [
        'i like apples.',
        'I like apples.',
        'I Like apples.',
        'i Like Apples.',
      ],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'What is the plural of "fox"?',
      options: ['foxes', 'foxs', 'foxies', 'fox'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which word is an adjective? A small mouse ran.',
      options: ['mouse', 'ran', 'small', 'a'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Choose the pronoun: ___ have a red kite.',
      options: ['They', 'Them', 'Their', 'Theirs'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which mark ends a question?',
      options: ['!', '.', '?', ','],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Last night, Dad ___ a story.',
      options: ['read', 'reads', 'reading', 'reader'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'There ___ two pencils on the desk.',
      options: ['is', 'are', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Find the noun: The horse eats hay.',
      options: ['horse', 'eats', 'the', 'quickly'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Find the verb: The children laugh.',
      options: ['children', 'the', 'laugh', 'happy'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'The fox ___ fast.',
      options: ['run', 'runs', 'running', 'runned'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correctly written name.',
      options: ['mr smith', 'Mr smith', 'mr Smith', 'Mr Smith'],
      answerIndex: 3,
    ),
    GrammarQuestion(
      question: 'What is the plural of "baby"?',
      options: ['babys', 'babies', 'babyes', 'baby'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which word describes the flower? A yellow flower.',
      options: ['flower', 'yellow', 'a', 'is'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: '___ am ready for school.',
      options: ['Me', 'I', 'My', 'Mine'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correct punctuation: What a surprise___',
      options: ['.', '?', '!', ','],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'We ___ our hands before lunch.',
      options: ['wash', 'washes', 'washed', 'washing'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'The dogs ___ barking.',
      options: ['is', 'are', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Which word is a place? We went to London.',
      options: ['went', 'to', 'London', 'we'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Choose the verb: The girl paints a picture.',
      options: ['girl', 'paints', 'picture', 'a'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'A bird ___ in the nest.',
      options: ['sleep', 'sleeps', 'sleeping', 'slept'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correct sentence.',
      options: [
        'Tom has a ball.',
        'tom has a ball.',
        'Tom Has a ball.',
        'tom Has A Ball.',
      ],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'What is the plural of "church"?',
      options: ['churchs', 'churches', 'churchies', 'church'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which word is an adjective? The noisy bus arrived.',
      options: ['bus', 'arrived', 'noisy', 'the'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: '___ are playing outside.',
      options: ['Us', 'We', 'Our', 'Ours'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which mark ends a statement?',
      options: ['.', '?', '!', ','],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Sam ___ his coat yesterday.',
      options: ['find', 'finds', 'found', 'finding'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'There ___ one apple left.',
      options: ['are', 'is', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Which word is a thing? The book is open.',
      options: ['book', 'is', 'open', 'the'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which word shows an action? The dog barked.',
      options: ['dog', 'the', 'barked', 'a'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'She ___ a song.',
      options: ['sing', 'sings', 'singing', 'sang'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the capital letter sentence.',
      options: [
        'we live in England.',
        'We live in England.',
        'We live in england.',
        'we live in england.',
      ],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'What is the plural of "bus"?',
      options: ['buses', 'buss', 'busies', 'bus'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which word describes the cake? A delicious cake.',
      options: ['cake', 'delicious', 'a', 'the'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'That pencil belongs to ___.',
      options: ['I', 'me', 'my', 'mine'],
      answerIndex: 3,
    ),
    GrammarQuestion(
      question: 'Choose the punctuation: Please sit down___',
      options: ['.', '?', '!', ','],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'They ___ football on Saturday.',
      options: ['play', 'plays', 'played', 'playing'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'There ___ many stars in the sky.',
      options: ['is', 'are', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Find the noun: A fish swims.',
      options: ['fish', 'swims', 'a', 'quickly'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Find the verb: The baby crawls.',
      options: ['baby', 'the', 'crawls', 'small'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'The sun ___ brightly.',
      options: ['shine', 'shines', 'shining', 'shone'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correct sentence.',
      options: [
        'my dog is called Max.',
        'My dog is called Max.',
        'My Dog is called max.',
        'my Dog is called Max.',
      ],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'What is the plural of "potato"?',
      options: ['potatos', 'potatoes', 'potatoies', 'potato'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which word is an adjective? The long train arrived.',
      options: ['train', 'arrived', 'long', 'the'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: '___ likes to read books.',
      options: ['Him', 'He', 'His', 'Himself'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which mark ends this question: Are you ready___',
      options: ['.', ',', '!', '?'],
      answerIndex: 3,
    ),
    GrammarQuestion(
      question: 'I ___ my teeth this morning.',
      options: ['brush', 'brushes', 'brushed', 'brushing'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'There ___ a rainbow in the sky.',
      options: ['are', 'is', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Which word names an animal? The sheep grazes.',
      options: ['sheep', 'grazes', 'the', 'green'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Choose the verb: The wind blows.',
      options: ['wind', 'the', 'blows', 'cold'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'The flowers ___ in spring.',
      options: ['grow', 'grows', 'growing', 'grew'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Choose the sentence with a capital letter.',
      options: [
        'my birthday is in May.',
        'My birthday is in May.',
        'My Birthday is in may.',
        'my Birthday is in May.',
      ],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'What is the plural of "class"?',
      options: ['class', 'classies', 'classes', 'classs'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Which word describes the room? The tidy room.',
      options: ['room', 'tidy', 'the', 'is'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: '___ is coming with us.',
      options: ['They', 'Them', 'Their', 'Theirs'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Choose the mark: Hooray___',
      options: ['.', '?', '!', ','],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Last week, we ___ Grandma.',
      options: ['visit', 'visits', 'visited', 'visiting'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'There ___ four children outside.',
      options: ['is', 'are', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Find the noun: The queen waved.',
      options: ['queen', 'waved', 'the', 'kind'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Find the verb: The clock ticks.',
      options: ['clock', 'the', 'ticks', 'loud'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'The horse ___ over the fence.',
      options: ['jump', 'jumps', 'jumping', 'jumped'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correct sentence.',
      options: [
        'A cat sat on the mat.',
        'a cat sat on the mat.',
        'A Cat sat on the mat.',
        'a Cat Sat On The Mat.',
      ],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'What is the plural of "toy"?',
      options: ['toys', 'toies', 'toys', 'toy'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which word is an adjective? The cold water.',
      options: ['water', 'cold', 'the', 'is'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Give the book to ___.',
      options: ['she', 'her', 'hers', 'herself'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which mark ends a question?',
      options: ['!', ',', '.', '?'],
      answerIndex: 3,
    ),
    GrammarQuestion(
      question: 'We ___ a story last night.',
      options: ['read', 'reads', 'reading', 'reader'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'There ___ two cups on the table.',
      options: ['is', 'are', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
  [
    GrammarQuestion(
      question: 'Which word is a noun? The rain falls.',
      options: ['rain', 'falls', 'the', 'softly'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Which word is a verb? The children dance.',
      options: ['children', 'the', 'dance', 'happy'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Ben ___ his lunch.',
      options: ['eat', 'eats', 'eating', 'eaten'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Choose the correctly punctuated sentence.',
      options: [
        'Where is Lily?',
        'Where is Lily.',
        'where is Lily?',
        'Where is lily?',
      ],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'What is the plural of "leaf"?',
      options: ['leafs', 'leaves', 'leafes', 'leaf'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: 'Which word describes the puppy? A playful puppy.',
      options: ['puppy', 'playful', 'a', 'the'],
      answerIndex: 1,
    ),
    GrammarQuestion(
      question: '___ have finished our work.',
      options: ['We', 'Us', 'Our', 'Ours'],
      answerIndex: 0,
    ),
    GrammarQuestion(
      question: 'Choose the punctuation: Watch out___',
      options: ['.', '?', '!', ','],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'Mia ___ a picture yesterday.',
      options: ['draw', 'draws', 'drew', 'drawing'],
      answerIndex: 2,
    ),
    GrammarQuestion(
      question: 'There ___ an orange in my bag.',
      options: ['are', 'is', 'am', 'be'],
      answerIndex: 1,
    ),
  ],
];
