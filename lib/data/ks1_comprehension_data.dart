class ComprehensionPassage {
  final String title;
  final String text;
  final List<MultipleChoiceQuestion> multipleChoiceQuestions;
  final List<WrittenQuestion> writtenQuestions;

  const ComprehensionPassage({
    required this.title,
    required this.text,
    required this.multipleChoiceQuestions,
    required this.writtenQuestions,
  });
}

class MultipleChoiceQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;

  const MultipleChoiceQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}

class WrittenQuestion {
  final String question;
  final String answer;

  const WrittenQuestion({required this.question, required this.answer});
}

const ks1ComprehensionPassages = <ComprehensionPassage>[
  ComprehensionPassage(
    title: 'The School Garden',
    text:
        'On Monday, Class 2 visited the school garden. Mrs Patel showed the children a row of tiny carrot plants. The children pulled out weeds and watered the soil. Ben found a red ladybird resting on a leaf. Before going back inside, everyone picked a ripe strawberry to share. The class decided to visit the garden again on Friday.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'Who showed the children the garden?',
        options: ['Mrs Patel', 'Ben', 'The head teacher', 'A gardener'],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'What plants were tiny?',
        options: [
          'Potato plants',
          'Carrot plants',
          'Bean plants',
          'Tomato plants',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What did the children pull out?',
        options: ['Flowers', 'Leaves', 'Weeds', 'Strawberries'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What colour was the ladybird?',
        options: ['Blue', 'Green', 'Yellow', 'Red'],
        answerIndex: 3,
      ),
      MultipleChoiceQuestion(
        question: 'When will the class visit again?',
        options: ['Tuesday', 'Wednesday', 'Friday', 'Monday'],
        answerIndex: 2,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'Where did Class 2 go?',
        answer: 'They went to the school garden.',
      ),
      WrittenQuestion(
        question: 'What did the children use to water?',
        answer: 'They watered the soil.',
      ),
      WrittenQuestion(
        question: 'What was resting on a leaf?',
        answer: 'A red ladybird was resting on a leaf.',
      ),
      WrittenQuestion(
        question: 'What fruit did everyone pick?',
        answer: 'Everyone picked a strawberry.',
      ),
      WrittenQuestion(
        question: 'Why do you think the children will visit again?',
        answer:
            'They enjoyed caring for the garden and wanted to see the plants grow.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'A Visit to the Library',
    text:
        'Amira walked to the library with her grandad after school. She returned two books and chose a new book about space. The librarian, Mr Jones, helped her find a quiet seat by the window. Amira read about the Moon, then drew a picture of an astronaut in her notebook. Before leaving, she borrowed the book for one week.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'Who went with Amira?',
        options: ['Her mum', 'Her teacher', 'Her grandad', 'Her friend'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'How many books did Amira return?',
        options: ['One', 'Two', 'Three', 'Four'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What was her new book about?',
        options: ['Animals', 'Space', 'Castles', 'Plants'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'Where did she sit?',
        options: ['By the door', 'On the stairs', 'By the window', 'Outside'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'How long could she borrow the book?',
        options: ['One day', 'One week', 'One month', 'One year'],
        answerIndex: 1,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'When did Amira go to the library?',
        answer: 'She went after school.',
      ),
      WrittenQuestion(
        question: 'What did she return?',
        answer: 'She returned two books.',
      ),
      WrittenQuestion(
        question: 'Who helped Amira?',
        answer: 'Mr Jones, the librarian, helped her.',
      ),
      WrittenQuestion(
        question: 'What did Amira draw?',
        answer: 'She drew a picture of an astronaut.',
      ),
      WrittenQuestion(
        question: 'Why do people borrow books from a library?',
        answer: 'They borrow books to read them and return them later.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'Life in the Pond',
    text:
        'A small pond sits behind the village hall. In spring, frogs lay eggs in the water. Soon, tiny tadpoles swim between the pond weeds. A dragonfly rests on a tall reed while water boatmen skim across the surface. The pond is home to many creatures, so children look carefully and never throw rubbish into it.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'Where is the pond?',
        options: [
          'Behind the village hall',
          'Beside the railway',
          'In a garden',
          'Near the beach',
        ],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'What do frogs lay?',
        options: ['Seeds', 'Eggs', 'Nests', 'Leaves'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What swims between the weeds?',
        options: ['Fish', 'Ducks', 'Tadpoles', 'Bees'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What rests on a reed?',
        options: ['A dragonfly', 'A frog', 'A snail', 'A bird'],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'What should children never throw into the pond?',
        options: ['Water', 'Rubbish', 'Reeds', 'Stones'],
        answerIndex: 1,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'When do frogs lay eggs?',
        answer: 'Frogs lay eggs in spring.',
      ),
      WrittenQuestion(
        question: 'What do tadpoles grow into?',
        answer: 'Tadpoles grow into frogs.',
      ),
      WrittenQuestion(
        question: 'Name one creature in the pond.',
        answer:
            'A frog, tadpole, dragonfly, or water boatman lives in the pond.',
      ),
      WrittenQuestion(
        question: 'Where does the dragonfly rest?',
        answer: 'It rests on a tall reed.',
      ),
      WrittenQuestion(
        question: 'Why should the pond be kept clean?',
        answer: 'It is home to many creatures that need a safe place to live.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'The Recycling Team',
    text:
        'Every Thursday, the eco team checks the bins at Oak Tree Primary School. They sort paper, plastic and tins into the correct containers. Today, Leo noticed that a clean yoghurt pot was in the general waste bin. He moved it to the plastic bin. The team made a poster reminding everyone to reduce, reuse and recycle.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'When does the eco team check the bins?',
        options: [
          'Every Monday',
          'Every Tuesday',
          'Every Thursday',
          'Every Friday',
        ],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What school do they attend?',
        options: [
          'Oak Tree Primary',
          'Green Hill School',
          'River School',
          'Oak Leaf Academy',
        ],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'Which item did Leo find?',
        options: [
          'A tin can',
          'A yoghurt pot',
          'A newspaper',
          'A glass bottle',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'Where should the pot go?',
        options: [
          'The paper bin',
          'The food bin',
          'The plastic bin',
          'The general waste bin',
        ],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What did the team make?',
        options: ['A song', 'A poster', 'A model', 'A book'],
        answerIndex: 1,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'What does the eco team sort?',
        answer: 'They sort paper, plastic and tins.',
      ),
      WrittenQuestion(
        question: 'What was wrong with the yoghurt pot?',
        answer: 'It was in the general waste bin instead of the plastic bin.',
      ),
      WrittenQuestion(
        question: 'Who moved the pot?',
        answer: 'Leo moved the pot.',
      ),
      WrittenQuestion(
        question: 'What three words were on the poster?',
        answer: 'Reduce, reuse and recycle.',
      ),
      WrittenQuestion(
        question: 'How can you help your school?',
        answer:
            'I can put rubbish in the correct bin and reuse things when possible.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'A Windy Day at the Seaside',
    text:
        'On Saturday, the Harris family visited Whitby beach. A strong wind blew across the sand, so Dad held the picnic blanket down with four stones. Mia built a castle with a moat while Sam searched for smooth shells. They watched fishing boats return to the harbour. Before going home, the family put every wrapper in a bin and brushed the sand from their shoes.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'Which beach did the family visit?',
        options: [
          'Brighton beach',
          'Whitby beach',
          'Blackpool beach',
          'Wales beach',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'Why did Dad use stones?',
        options: [
          'To build a wall',
          'To skip stones',
          'To hold the blanket down',
          'To mark a path',
        ],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What did Mia build?',
        options: [
          'A boat',
          'A sandcastle with a moat',
          'A bridge',
          'A sand shop',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What did Sam search for?',
        options: ['Crabs', 'Pebbles', 'Smooth shells', 'Treasure'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'Where did the fishing boats return?',
        options: ['The river', 'The harbour', 'The lake', 'The island'],
        answerIndex: 1,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'When did the family visit the beach?',
        answer: 'They visited on Saturday.',
      ),
      WrittenQuestion(
        question: 'How many stones held the blanket down?',
        answer: 'Four stones held it down.',
      ),
      WrittenQuestion(
        question: 'What did the family watch?',
        answer: 'They watched fishing boats return to the harbour.',
      ),
      WrittenQuestion(
        question: 'What did the family do with the wrappers?',
        answer: 'They put every wrapper in a bin.',
      ),
      WrittenQuestion(
        question: 'Describe the weather at the seaside.',
        answer: 'It was windy because a strong wind blew across the sand.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'The Lost Duckling',
    text:
        'Ella was walking beside the river when she heard a soft peep. A tiny duckling was hiding under a bush. It could not see its mother. Ella stayed still and called a park keeper. The keeper listened for the mother duck. Soon, a loud quack came from the reeds. The duckling waddled towards the sound and was safely reunited with its family.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'Where was Ella walking?',
        options: [
          'Beside the river',
          'Through a forest',
          'Along a beach',
          'In a playground',
        ],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'What did Ella hear?',
        options: ['A loud bark', 'A soft peep', 'A bell', 'A song'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'Where was the duckling hiding?',
        options: [
          'Under a bridge',
          'Behind a tree',
          'Under a bush',
          'In a box',
        ],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'Who did Ella call?',
        options: ['A farmer', 'A teacher', 'A park keeper', 'A vet'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What sound did the mother duck make?',
        options: ['A quack', 'A chirp', 'A hiss', 'A whistle'],
        answerIndex: 0,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'Why was the duckling hiding?',
        answer: 'It was hiding because it could not see its mother.',
      ),
      WrittenQuestion(
        question: 'What did Ella do to help?',
        answer: 'She stayed still and called a park keeper.',
      ),
      WrittenQuestion(
        question: 'Where was the mother duck?',
        answer: 'The mother duck was in the reeds.',
      ),
      WrittenQuestion(
        question: 'How did the duckling find its mother?',
        answer: 'It followed the sound of her quack.',
      ),
      WrittenQuestion(
        question: 'How do you think Ella felt at the end?',
        answer:
            'She probably felt happy and relieved because the duckling was safe.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'The Weather Station',
    text:
        'Class 1 made a weather station in the playground. A rain gauge measured the rain, and a windsock showed which way the wind blew. The children checked the instruments each morning. On Tuesday, the sky was cloudy but no rain fell. The windsock pointed towards the football field. The class recorded their findings on a chart.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'Where did Class 1 make the weather station?',
        options: [
          'In the hall',
          'In the playground',
          'On the roof',
          'At the park',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What measured the rain?',
        options: ['A thermometer', 'A windsock', 'A rain gauge', 'A ruler'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'What showed the direction of the wind?',
        options: ['A cloud', 'A windsock', 'A chart', 'A flag'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What was the sky like on Tuesday?',
        options: ['Sunny', 'Stormy', 'Cloudy', 'Snowy'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'Where did the windsock point?',
        options: [
          'Towards the gate',
          'Towards the classroom',
          'Towards the road',
          'Towards the football field',
        ],
        answerIndex: 3,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'When did the children check the instruments?',
        answer: 'They checked them each morning.',
      ),
      WrittenQuestion(
        question: 'Did it rain on Tuesday?',
        answer: 'No, no rain fell on Tuesday.',
      ),
      WrittenQuestion(
        question: 'What did the class record?',
        answer: 'They recorded their weather findings.',
      ),
      WrittenQuestion(
        question: 'Name one instrument at the weather station.',
        answer: 'A rain gauge or a windsock was at the weather station.',
      ),
      WrittenQuestion(
        question: 'Why is it useful to record the weather?',
        answer: 'It helps us notice and compare changes in the weather.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'The Little Seed',
    text:
        'Nia planted a sunflower seed in a small pot. She covered it with soil and placed the pot on a sunny windowsill. Each morning, she gave it a little water. After a week, a green shoot pushed through the soil. Nia measured it every Friday. She hoped it would grow tall enough to see over the garden fence.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'What did Nia plant?',
        options: ['A bean', 'A sunflower seed', 'A tree', 'A rose'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'Where did she put the pot?',
        options: [
          'In a cupboard',
          'On a sunny windowsill',
          'Under a bed',
          'Outside the gate',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What did Nia give the seed?',
        options: ['Milk', 'Sand', 'A little water', 'Leaves'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'When did the green shoot appear?',
        options: [
          'After a day',
          'After a week',
          'After a month',
          'After a year',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'How often did Nia measure the plant?',
        options: [
          'Every Friday',
          'Every Monday',
          'Every evening',
          'Once a year',
        ],
        answerIndex: 0,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'What did Nia cover the seed with?',
        answer: 'She covered it with soil.',
      ),
      WrittenQuestion(
        question: 'How did Nia care for the seed?',
        answer:
            'She placed it in the sun and gave it a little water each morning.',
      ),
      WrittenQuestion(
        question: 'What pushed through the soil?',
        answer: 'A green shoot pushed through the soil.',
      ),
      WrittenQuestion(
        question: 'Where did Nia hope the sunflower would grow?',
        answer: 'She hoped it would grow over the garden fence.',
      ),
      WrittenQuestion(
        question: 'What does a seed need to grow?',
        answer: 'A seed needs water, light, air and the right soil to grow.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'The Village Fair',
    text:
        'The village fair opened on a bright Saturday morning. There were colourful bunting, a cake stall and a ring-toss game. Yusuf helped his aunt sell lemonade. At midday, a brass band played near the village green. Yusuf used his pocket money to buy a warm cheese pasty. Before he left, he thanked his aunt and helped carry the empty boxes.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'When did the village fair open?',
        options: [
          'Saturday morning',
          'Sunday evening',
          'Monday afternoon',
          'Friday night',
        ],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'What was sold at one of the stalls?',
        options: ['Books', 'Lemonade', 'Shoes', 'Plants'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What game was at the fair?',
        options: ['Football', 'Ring-toss', 'Chess', 'Hide-and-seek'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What played near the village green?',
        options: ['A brass band', 'A choir', 'A radio', 'A drummer'],
        answerIndex: 0,
      ),
      MultipleChoiceQuestion(
        question: 'What did Yusuf buy?',
        options: ['A cake', 'A sausage roll', 'A cheese pasty', 'An ice cream'],
        answerIndex: 2,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'Who did Yusuf help?',
        answer: 'He helped his aunt.',
      ),
      WrittenQuestion(
        question: 'What did Yusuf help sell?',
        answer: 'He helped sell lemonade.',
      ),
      WrittenQuestion(
        question: 'Where did the band play?',
        answer: 'It played near the village green.',
      ),
      WrittenQuestion(
        question: 'What did Yusuf do before leaving?',
        answer: 'He thanked his aunt and helped carry the empty boxes.',
      ),
      WrittenQuestion(
        question: 'Which part of the fair would you like to visit and why?',
        answer: 'Answers may vary, but the choice should include a reason.',
      ),
    ],
  ),
  ComprehensionPassage(
    title: 'The Night Sky',
    text:
        'Mum and Arun stood in the garden after dinner to look at the night sky. The Moon was bright and nearly round. Arun spotted three stars that made a triangle. A bat flew quietly above the apple tree. Mum explained that stars are very far away, even though they look like tiny points of light. They went inside when the air became cold.',
    multipleChoiceQuestions: [
      MultipleChoiceQuestion(
        question: 'When did Mum and Arun look at the sky?',
        options: [
          'Before breakfast',
          'After dinner',
          'At lunchtime',
          'Before school',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What was the Moon like?',
        options: [
          'Dark and hidden',
          'Bright and nearly round',
          'Small and red',
          'Covered in clouds',
        ],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'How many stars did Arun spot?',
        options: ['Two', 'Three', 'Four', 'Five'],
        answerIndex: 1,
      ),
      MultipleChoiceQuestion(
        question: 'What flew above the apple tree?',
        options: ['An owl', 'A bird', 'A bat', 'A kite'],
        answerIndex: 2,
      ),
      MultipleChoiceQuestion(
        question: 'Why did they go inside?',
        options: [
          'It began to rain',
          'The air became cold',
          'They heard music',
          'The Moon disappeared',
        ],
        answerIndex: 1,
      ),
    ],
    writtenQuestions: [
      WrittenQuestion(
        question: 'Where did Mum and Arun stand?',
        answer: 'They stood in the garden.',
      ),
      WrittenQuestion(
        question: 'What shape did the stars make?',
        answer: 'The three stars made a triangle.',
      ),
      WrittenQuestion(
        question: 'What did Mum explain about the stars?',
        answer: 'She explained that stars are very far away.',
      ),
      WrittenQuestion(
        question: 'What kind of light did the stars look like?',
        answer: 'They looked like tiny points of light.',
      ),
      WrittenQuestion(
        question: 'Why do you think Arun enjoyed looking at the sky?',
        answer: 'He enjoyed discovering the Moon, stars and bat in the sky.',
      ),
    ],
  ),
];
