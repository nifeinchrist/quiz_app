class ListeningQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;

  const ListeningQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}

class ListeningResponseQuestion {
  final String question;
  final String answer;

  const ListeningResponseQuestion({
    required this.question,
    required this.answer,
  });
}

class ListeningExercise {
  final String title;
  final String passage;
  final List<ListeningQuestion> questions;
  final List<ListeningResponseQuestion>? customResponseQuestions;

  const ListeningExercise({
    required this.title,
    required this.passage,
    required this.questions,
    this.customResponseQuestions,
  });

  List<ListeningResponseQuestion> get responseQuestions =>
      customResponseQuestions ?? ks1ListeningResponseQuestions[title]!;
}

const ks1ListeningExercises = <ListeningExercise>[
  ListeningExercise(
    title: 'The Morning Bus',
    passage:
        'On Monday morning, Ruby waited for the bus with her dad. She wore a yellow coat because the air was chilly. The bus arrived at eight o’clock. Ruby sat beside the window and waved to her dad as the bus drove away.',
    questions: [
      ListeningQuestion(
        question: 'Who waited with Ruby?',
        options: ['Her mum', 'Her dad', 'Her teacher'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What colour was Ruby’s coat?',
        options: ['Blue', 'Green', 'Yellow'],
        answerIndex: 2,
      ),
      ListeningQuestion(
        question: 'What time did the bus arrive?',
        options: ['Seven o’clock', 'Eight o’clock', 'Nine o’clock'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Where did Ruby sit?',
        options: ['Beside the window', 'Beside the door', 'At the front'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did Ruby do as the bus drove away?',
        options: ['She sang', 'She waved', 'She slept'],
        answerIndex: 1,
      ),
    ],
  ),
  ListeningExercise(
    title: 'A Picnic in the Park',
    passage:
        'Maya and her brother took a picnic to the park. They packed sandwiches, apples and a bottle of water. After lunch, Maya played on the swings. Her brother fed a few crumbs to the ducks near the pond.',
    questions: [
      ListeningQuestion(
        question: 'Where did Maya go?',
        options: ['The park', 'The beach', 'The library'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'Which fruit did they pack?',
        options: ['Bananas', 'Apples', 'Pears'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What did Maya play on?',
        options: ['The slide', 'The swings', 'The roundabout'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Who fed crumbs to the ducks?',
        options: ['Maya', 'Her brother', 'Her dad'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What did they take to the park?',
        options: ['A picnic', 'A football', 'A tent'],
        answerIndex: 0,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The Red Kite',
    passage:
        'After school, Oliver flew a red kite on the village green. A gentle wind lifted it high above the trees. Oliver held the string tightly. When dark clouds appeared, he carefully wound the string and carried the kite home.',
    questions: [
      ListeningQuestion(
        question: 'What colour was the kite?',
        options: ['Red', 'White', 'Orange'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'Where did Oliver fly it?',
        options: ['The playground', 'The village green', 'The garden'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Why did Oliver go home?',
        options: [
          'It started raining',
          'Dark clouds appeared',
          'He lost the string',
        ],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What lifted the kite?',
        options: ['A gentle wind', 'A bird', 'A balloon'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did Oliver hold tightly?',
        options: ['A stick', 'The string', 'His coat'],
        answerIndex: 1,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The Baker’s Shop',
    passage:
        'Mrs Khan opened her bakery early on Saturday. The smell of warm bread filled the shop. She placed six iced buns on a tray and three loaves beside them. A customer bought two buns for her children.',
    questions: [
      ListeningQuestion(
        question: 'When did Mrs Khan open the bakery?',
        options: ['Saturday', 'Sunday', 'Friday'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What filled the shop?',
        options: [
          'The smell of flowers',
          'The smell of warm bread',
          'The sound of music',
        ],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'How many iced buns were on the tray?',
        options: ['Three', 'Five', 'Six'],
        answerIndex: 2,
      ),
      ListeningQuestion(
        question: 'How many loaves were beside the buns?',
        options: ['Two', 'Three', 'Six'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Who bought the buns for her children?',
        options: ['A customer', 'Mrs Khan', 'A baker'],
        answerIndex: 0,
      ),
    ],
  ),
  ListeningExercise(
    title: 'A Trip to the Museum',
    passage:
        'Class 2 visited the town museum. Their guide showed them an old steam train and a room full of fossils. Sam liked the dinosaur tooth best. Before leaving, the children drew one thing they had seen.',
    questions: [
      ListeningQuestion(
        question: 'Who visited the museum?',
        options: ['Class 1', 'Class 2', 'Class 3'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What kind of train did they see?',
        options: ['An electric train', 'A steam train', 'A toy train'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What did Sam like best?',
        options: ['A shell', 'A dinosaur tooth', 'A painting'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What other object did the guide show them?',
        options: ['A steam train', 'A boat', 'A castle'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did the children draw before leaving?',
        options: ['A friend', 'One thing they had seen', 'The museum door'],
        answerIndex: 1,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The Rainy Walk',
    passage:
        'Ella and her grandmother went for a walk before lunch. Halfway along the path, rain began to fall. Ella opened her purple umbrella. They hurried past the church and stopped at a cafe for hot chocolate.',
    questions: [
      ListeningQuestion(
        question: 'Who walked with Ella?',
        options: ['Her grandmother', 'Her sister', 'Her aunt'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What colour was the umbrella?',
        options: ['Purple', 'Pink', 'Black'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'Where did they stop?',
        options: ['A shop', 'A cafe', 'A station'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'When did the walk happen?',
        options: ['Before lunch', 'After dinner', 'Before breakfast'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did they drink?',
        options: ['Tea', 'Hot chocolate', 'Juice'],
        answerIndex: 1,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The Little Hedgehog',
    passage:
        'One evening, Noah saw a little hedgehog near the garden fence. He watched quietly while it sniffed the grass. Noah called his mum, who brought a shallow dish of water. The hedgehog drank and then disappeared beneath the leaves.',
    questions: [
      ListeningQuestion(
        question: 'What animal did Noah see?',
        options: ['A rabbit', 'A hedgehog', 'A fox'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Where was it?',
        options: ['Near the garden fence', 'Under the table', 'By the pond'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did it drink?',
        options: ['Milk', 'Rain', 'Water'],
        answerIndex: 2,
      ),
      ListeningQuestion(
        question: 'Who brought the dish?',
        options: ['Noah', 'Noah’s mum', 'A neighbour'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Where did the hedgehog disappear?',
        options: ['Under the leaves', 'Into the pond', 'Behind the shed'],
        answerIndex: 0,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The School Orchestra',
    passage:
        'The school orchestra practised in the hall on Wednesday. Priya played the violin, while Ben tapped a small drum. Their teacher asked them to play softly first and loudly at the end. Everyone clapped when the tune was finished.',
    questions: [
      ListeningQuestion(
        question: 'Where did the orchestra practise?',
        options: ['In the hall', 'In the classroom', 'In the playground'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'Which instrument did Priya play?',
        options: ['A drum', 'A violin', 'A piano'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'When did they play loudly?',
        options: ['At the beginning', 'In the middle', 'At the end'],
        answerIndex: 2,
      ),
      ListeningQuestion(
        question: 'What did Ben tap?',
        options: ['A small drum', 'A violin', 'A triangle'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did everyone do when the tune finished?',
        options: ['They left', 'They clapped', 'They danced'],
        answerIndex: 1,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The Busy Ants',
    passage:
        'A line of ants marched across the patio. Each ant carried a tiny crumb towards a crack in the wall. Lily counted twelve ants before a breeze blew the crumbs away. The ants quickly began their work again.',
    questions: [
      ListeningQuestion(
        question: 'Where did the ants march?',
        options: ['Across the patio', 'Across the road', 'Across the carpet'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What did each ant carry?',
        options: ['A leaf', 'A crumb', 'A flower'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'How many ants did Lily count?',
        options: ['Ten', 'Twelve', 'Twenty'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'Where were the ants going?',
        options: [
          'Towards a crack in the wall',
          'Towards the pond',
          'Towards a tree',
        ],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'What blew the crumbs away?',
        options: ['Rain', 'A breeze', 'A bird'],
        answerIndex: 1,
      ),
    ],
  ),
  ListeningExercise(
    title: 'The New Classroom Plant',
    passage:
        'Mr Evans brought a small fern into the classroom. He placed it beside the bright window, away from the radiator. Each Friday, a different child watered the fern. By the end of term, three new leaves had grown.',
    questions: [
      ListeningQuestion(
        question: 'What plant did Mr Evans bring?',
        options: ['A fern', 'A sunflower', 'A cactus'],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'Where did he place it?',
        options: [
          'Beside the bright window',
          'On the radiator',
          'Outside the door',
        ],
        answerIndex: 0,
      ),
      ListeningQuestion(
        question: 'When did a child water it?',
        options: ['Every Monday', 'Each Friday', 'Every day'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'What was the plant kept away from?',
        options: ['The window', 'The radiator', 'The classroom'],
        answerIndex: 1,
      ),
      ListeningQuestion(
        question: 'How many new leaves grew?',
        options: ['One', 'Two', 'Three'],
        answerIndex: 2,
      ),
    ],
  ),
];

const ks1ListeningResponseQuestions = <String, List<ListeningResponseQuestion>>{
  'The Morning Bus': [
    ListeningResponseQuestion(
      question: 'What day did Ruby wait for the bus?',
      answer: 'Monday',
    ),
    ListeningResponseQuestion(question: 'Who waved goodbye?', answer: 'Ruby'),
    ListeningResponseQuestion(
      question: 'Why did Ruby wear a coat?',
      answer: 'The air was chilly',
    ),
    ListeningResponseQuestion(
      question: 'Where was Ruby sitting?',
      answer: 'Beside the window',
    ),
    ListeningResponseQuestion(
      question: 'What happened after the bus arrived?',
      answer: 'Ruby sat beside the window and waved to her dad',
    ),
  ],
  'A Picnic in the Park': [
    ListeningResponseQuestion(
      question: 'Who went to the park with Maya?',
      answer: 'Her brother',
    ),
    ListeningResponseQuestion(
      question: 'Name one thing they packed.',
      answer: 'Sandwiches, apples or water',
    ),
    ListeningResponseQuestion(
      question: 'Where were the ducks?',
      answer: 'Near the pond',
    ),
    ListeningResponseQuestion(
      question: 'What did Maya do after lunch?',
      answer: 'She played on the swings',
    ),
    ListeningResponseQuestion(
      question: 'What did Maya’s brother feed the ducks?',
      answer: 'A few crumbs',
    ),
  ],
  'The Red Kite': [
    ListeningResponseQuestion(
      question: 'When did Oliver fly the kite?',
      answer: 'After school',
    ),
    ListeningResponseQuestion(
      question: 'What lifted the kite high?',
      answer: 'A gentle wind',
    ),
    ListeningResponseQuestion(
      question: 'What appeared in the sky?',
      answer: 'Dark clouds',
    ),
    ListeningResponseQuestion(
      question: 'How did Oliver carry the kite home?',
      answer: 'He wound the string and carried it home',
    ),
    ListeningResponseQuestion(
      question: 'Where was the kite flying?',
      answer: 'Above the trees',
    ),
  ],
  'The Baker’s Shop': [
    ListeningResponseQuestion(
      question: 'What was Mrs Khan’s shop?',
      answer: 'A bakery',
    ),
    ListeningResponseQuestion(question: 'What was warm?', answer: 'The bread'),
    ListeningResponseQuestion(
      question: 'How many loaves were there?',
      answer: 'Three',
    ),
    ListeningResponseQuestion(
      question: 'How many buns did the customer buy?',
      answer: 'Two',
    ),
    ListeningResponseQuestion(
      question: 'Who were the buns for?',
      answer: 'Her children',
    ),
  ],
  'A Trip to the Museum': [
    ListeningResponseQuestion(
      question: 'Where did Class 2 go?',
      answer: 'The town museum',
    ),
    ListeningResponseQuestion(
      question: 'Who showed them around?',
      answer: 'Their guide',
    ),
    ListeningResponseQuestion(
      question: 'What filled one room?',
      answer: 'Fossils',
    ),
    ListeningResponseQuestion(
      question: 'What did Sam like best?',
      answer: 'The dinosaur tooth',
    ),
    ListeningResponseQuestion(
      question: 'What did the children do before leaving?',
      answer: 'They drew one thing they had seen',
    ),
  ],
  'The Rainy Walk': [
    ListeningResponseQuestion(
      question: 'Who went for a walk with Ella?',
      answer: 'Her grandmother',
    ),
    ListeningResponseQuestion(
      question: 'When did they walk?',
      answer: 'Before lunch',
    ),
    ListeningResponseQuestion(question: 'What began to fall?', answer: 'Rain'),
    ListeningResponseQuestion(
      question: 'What did Ella open?',
      answer: 'Her purple umbrella',
    ),
    ListeningResponseQuestion(
      question: 'What did they have at the cafe?',
      answer: 'Hot chocolate',
    ),
  ],
  'The Little Hedgehog': [
    ListeningResponseQuestion(
      question: 'When did Noah see the hedgehog?',
      answer: 'One evening',
    ),
    ListeningResponseQuestion(
      question: 'What did the hedgehog sniff?',
      answer: 'The grass',
    ),
    ListeningResponseQuestion(
      question: 'Who did Noah call?',
      answer: 'His mum',
    ),
    ListeningResponseQuestion(
      question: 'What kind of dish did she bring?',
      answer: 'A shallow dish',
    ),
    ListeningResponseQuestion(
      question: 'What did the hedgehog do after drinking?',
      answer: 'It disappeared beneath the leaves',
    ),
  ],
  'The School Orchestra': [
    ListeningResponseQuestion(
      question: 'When did the orchestra practise?',
      answer: 'Wednesday',
    ),
    ListeningResponseQuestion(
      question: 'Who played the violin?',
      answer: 'Priya',
    ),
    ListeningResponseQuestion(
      question: 'What instrument did Ben play?',
      answer: 'A small drum',
    ),
    ListeningResponseQuestion(
      question: 'How did they play first?',
      answer: 'Softly',
    ),
    ListeningResponseQuestion(
      question: 'What did everyone do at the end?',
      answer: 'They clapped',
    ),
  ],
  'The Busy Ants': [
    ListeningResponseQuestion(
      question: 'Where did the ants march?',
      answer: 'Across the patio',
    ),
    ListeningResponseQuestion(
      question: 'What did they carry?',
      answer: 'Tiny crumbs',
    ),
    ListeningResponseQuestion(
      question: 'Where were they taking the crumbs?',
      answer: 'Towards a crack in the wall',
    ),
    ListeningResponseQuestion(
      question: 'What blew the crumbs away?',
      answer: 'A breeze',
    ),
    ListeningResponseQuestion(
      question: 'What did the ants do next?',
      answer: 'They began their work again',
    ),
  ],
  'The New Classroom Plant': [
    ListeningResponseQuestion(
      question: 'What kind of plant was brought in?',
      answer: 'A fern',
    ),
    ListeningResponseQuestion(
      question: 'Who brought the plant?',
      answer: 'Mr Evans',
    ),
    ListeningResponseQuestion(
      question: 'What was the plant kept away from?',
      answer: 'The radiator',
    ),
    ListeningResponseQuestion(
      question: 'How often was it watered?',
      answer: 'Each Friday',
    ),
    ListeningResponseQuestion(
      question: 'How many new leaves grew?',
      answer: 'Three',
    ),
  ],
};
