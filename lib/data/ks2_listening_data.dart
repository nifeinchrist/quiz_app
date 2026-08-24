import 'ks1_listening_data.dart';

ListeningQuestion _q(String question, List<String> options, int answerIndex) =>
    ListeningQuestion(
      question: question,
      options: options,
      answerIndex: answerIndex,
    );

ListeningResponseQuestion _r(String question, String answer) =>
    ListeningResponseQuestion(question: question, answer: answer);

ListeningExercise _exercise(
  String title,
  String passage,
  List<ListeningQuestion> questions,
  List<ListeningResponseQuestion> responses,
) => ListeningExercise(
  title: title,
  passage: passage,
  questions: questions,
  customResponseQuestions: responses,
);

final ks2ListeningExercises = <ListeningExercise>[
  _exercise(
    'The Thames Barrier',
    'The Thames Barrier protects London from exceptionally high tides and storm surges. It stretches across the River Thames at Woolwich and contains several enormous steel gates. Most of the time, the gates rest flat on the riverbed so ships can pass. When the Environment Agency forecasts a dangerous surge, operators raise the gates into position. The barrier does not prevent ordinary river flooding on its own; it is part of a wider system that includes walls, embankments, forecasting and emergency planning. Engineers inspect and maintain the structure carefully because millions of people live and work in the floodplain. The barrier is a striking example of how scientific forecasts and large-scale engineering can work together to protect a historic city while allowing the river to remain an important transport route.',
    [
      _q('What does the Thames Barrier protect London from?', [
        'Droughts',
        'High tides and storm surges',
        'Snowfall',
        'Traffic',
      ], 1),
      _q('Where is the barrier?', ['Woolwich', 'Keswick', 'York', 'Bath'], 0),
      _q('What do the gates do normally?', [
        'Float away',
        'Rest flat on the riverbed',
        'Block every ship',
        'Stay permanently upright',
      ], 1),
      _q('Who forecasts dangerous surges?', [
        'The Environment Agency',
        'The National Gallery',
        'The railway company',
        'The Royal Mail',
      ], 0),
      _q('Why are the gates raised?', [
        'To allow fishing',
        'To protect against a dangerous surge',
        'To clean the river',
        'To create a road',
      ], 1),
      _q('What else helps protect London?', [
        'Forecasting and emergency planning',
        'Only boats',
        'Only sunshine',
        'Underground trains',
      ], 0),
      _q('Why is maintenance important?', [
        'Millions live and work nearby',
        'The gates are made of wood',
        'Ships never use the river',
        'The river is dry',
      ], 0),
      _q('What can pass when the gates are flat?', [
        'Ships',
        'Aeroplanes',
        'Trains',
        'Buses',
      ], 0),
      _q('What does floodplain mean here?', [
        'Land that may flood beside a river',
        'A high mountain',
        'A dry road',
        'A harbour wall',
      ], 0),
      _q('What is the main point of the passage?', [
        'Engineering and forecasting help protect London',
        'The Thames is closed to ships',
        'Flooding happens every day',
        'The barrier is a tourist railway',
      ], 0),
    ],
    [
      _r(
        'What is a storm surge?',
        'A storm surge is an abnormal rise of sea or river water caused by a storm.',
      ),
      _r(
        'Why can ships usually pass the barrier?',
        'The gates normally rest flat on the riverbed.',
      ),
      _r(
        'Name two parts of the wider flood protection system.',
        'It includes walls, embankments, forecasting and emergency planning.',
      ),
      _r(
        'Why must operators respond to forecasts?',
        'They need time to raise the gates before a dangerous surge arrives.',
      ),
      _r(
        'How does the barrier balance protection and transport?',
        'It closes during danger but allows ships to pass at other times.',
      ),
    ],
  ),
  _exercise(
    'The Pennine Way',
    'The Pennine Way is a long-distance footpath running for about 268 miles from Edale in Derbyshire to Kirk Yetholm in the Scottish Borders. Opened in 1965, it crosses some of Britain’s most dramatic upland landscapes, including parts of the Peak District, the Yorkshire Dales and the North Pennines. Walkers encounter moorland, limestone valleys, reservoirs and exposed ridges. The route can be demanding because weather changes quickly and some sections are remote. Responsible walkers carry a map, follow marked paths, close gates and take litter home. In wet conditions, peat soil can be damaged easily, so visitors are encouraged to use repaired paths or paving where provided. The trail is more than a challenge for hikers: it connects communities, supports local businesses and gives people an opportunity to understand the value of protected landscapes.',
    [
      _q('Where does the Pennine Way begin?', [
        'Edale',
        'Kirk Yetholm',
        'London',
        'Swanage',
      ], 0),
      _q('Where does it end?', [
        'The Scottish Borders',
        'Cornwall',
        'Norfolk',
        'The Isle of Wight',
      ], 0),
      _q('When did it open?', ['1965', '1951', '1830', '1928'], 0),
      _q('Which landscape is mentioned?', [
        'Moorland',
        'Rainforest',
        'Desert',
        'Coral reef',
      ], 0),
      _q('Why can the route be demanding?', [
        'Weather changes quickly and some sections are remote',
        'It is entirely underground',
        'There are no hills',
        'It is only one mile long',
      ], 0),
      _q('What should walkers do with gates?', [
        'Leave them open',
        'Close them',
        'Remove them',
        'Paint them',
      ], 1),
      _q('Why can peat be damaged?', [
        'Wet soil is vulnerable',
        'It is made of steel',
        'It grows on roads',
        'It cannot hold water',
      ], 0),
      _q('What should walkers take home?', [
        'Litter',
        'Gates',
        'Rocks from walls',
        'Maps belonging to others',
      ], 0),
      _q('How does the trail help communities?', [
        'It supports local businesses',
        'It closes villages',
        'It stops tourism',
        'It removes footpaths',
      ], 0),
      _q('What is the main message?', [
        'The trail offers challenge while requiring responsible care',
        'The trail is suitable only for cars',
        'The route has no wildlife',
        'All British paths are identical',
      ], 0),
    ],
    [
      _r(
        'Why should walkers carry a map?',
        'A map helps walkers navigate a long and sometimes remote route.',
      ),
      _r(
        'Name two areas crossed by the path.',
        'It crosses the Peak District, Yorkshire Dales and North Pennines.',
      ),
      _r(
        'Why are repaired paths used in wet areas?',
        'They help prevent damage to vulnerable peat soil.',
      ),
      _r(
        'Give two examples of responsible walking.',
        'Walkers should follow paths, close gates and take litter home.',
      ),
      _r(
        'How can a footpath support local communities?',
        'Walkers use local businesses such as shops, cafés and accommodation.',
      ),
    ],
  ),
  _exercise(
    'The Bristol Bus Boycott',
    'In 1963, campaigners in Bristol challenged a policy that prevented Black people from working as bus crews. The Bristol Bus Boycott began after Guy Bailey was refused a job because of his race. Local activists, including Paul Stephenson, Roy Hackett and Prince Brown, organised a campaign inspired by earlier civil rights action in the United States. For several months, many Black residents and supporters avoided the buses, walking, cycling or sharing lifts instead. The boycott attracted national attention and placed pressure on the bus company. In September 1963, the company agreed to employ Black and Asian staff. The campaign did not end every form of discrimination, but it demonstrated the power of organised peaceful protest. It is remembered as an important event in the history of race equality in Britain.',
    [
      _q('What did the bus policy prevent?', [
        'Black people working as bus crews',
        'Children using parks',
        'Women voting',
        'Ships entering Bristol',
      ], 0),
      _q('Why was Guy Bailey refused a job?', [
        'His race',
        'His age',
        'His accent',
        'His address',
      ], 0),
      _q('What did many people do during the boycott?', [
        'Avoided buses',
        'Bought more tickets',
        'Closed the harbour',
        'Moved abroad',
      ], 0),
      _q('Who helped organise the campaign?', [
        'Paul Stephenson and others',
        'Only bus drivers',
        'Roman soldiers',
        'Railway engineers',
      ], 0),
      _q('What happened in September 1963?', [
        'The company agreed to employ Black and Asian staff',
        'The buses stopped forever',
        'The campaign moved to Scotland',
        'A new railway opened',
      ], 0),
      _q('What type of protest was it?', [
        'Organised and peaceful',
        'Secret and violent',
        'Accidental',
        'A sporting event',
      ], 0),
      _q('What did the boycott attract?', [
        'National attention',
        'Snow',
        'A new river',
        'A royal wedding',
      ], 0),
      _q('What does discrimination mean?', [
        'Unfair treatment',
        'A bus timetable',
        'A celebration',
        'A kind of transport',
      ], 0),
      _q('What did the campaign demonstrate?', [
        'Organised protest can create pressure for change',
        'Buses are unnecessary everywhere',
        'All problems end immediately',
        'Only governments can protest',
      ], 0),
      _q('Where did this event happen?', [
        'Bristol',
        'Manchester',
        'Dover',
        'Inverness',
      ], 0),
    ],
    [
      _r(
        'Why did people walk or share lifts?',
        'They avoided buses as part of the boycott.',
      ),
      _r(
        'How did the campaign place pressure on the company?',
        'Many people stopped using the buses and attracted public attention.',
      ),
      _r(
        'Why is the boycott historically important?',
        'It helped challenge racial discrimination in Britain.',
      ),
      _r(
        'What limitation does the passage mention?',
        'It did not end every form of discrimination.',
      ),
      _r(
        'What made the protest organised?',
        'Activists planned it and people worked together for a clear change.',
      ),
    ],
  ),
  _exercise(
    'The Forth Rail Bridge',
    'The Forth Bridge, completed in 1890, carries railway lines across the Firth of Forth in Scotland. Its distinctive cantilever design allowed engineers to span a wide stretch of water without building supports in the deepest channel. The bridge is made mainly from steel, held together by millions of rivets. Construction was dangerous and required workers to operate high above the water in difficult weather. When it opened, the bridge was celebrated as a major achievement of Victorian engineering. It remains in use, although modern inspections and maintenance are essential. In 2015, the Forth Bridge became a UNESCO World Heritage Site because of its engineering importance and the way it represents the confidence and ambition of the industrial age. Its red structure is now one of Scotland’s most recognisable landmarks.',
    [
      _q('What does the bridge carry?', [
        'Railway lines',
        'Canals',
        'Aircraft',
        'Underground trains',
      ], 0),
      _q('Where is it?', [
        'Across the Firth of Forth',
        'Across the Thames',
        'In the Lake District',
        'Near Stonehenge',
      ], 0),
      _q('What design did engineers use?', [
        'Cantilever',
        'Domed',
        'Underground',
        'Floating',
      ], 0),
      _q('Why was the design useful?', [
        'It avoided supports in the deepest channel',
        'It made the bridge invisible',
        'It stopped trains',
        'It used no materials',
      ], 0),
      _q('What holds the steel together?', [
        'Rivets',
        'Rope',
        'Clay',
        'Paper',
      ], 0),
      _q('When was it completed?', ['1890', '1965', '1215', '1830'], 0),
      _q('Why was construction dangerous?', [
        'Workers operated high above water',
        'The bridge was underground',
        'There was no steel',
        'It was built indoors',
      ], 0),
      _q('What happened in 2015?', [
        'It became a UNESCO World Heritage Site',
        'It closed permanently',
        'It moved to England',
        'It was painted blue',
      ], 0),
      _q('Why is maintenance essential?', [
        'The bridge remains in use',
        'No trains cross it',
        'Steel never changes',
        'The river has disappeared',
      ], 0),
      _q('What is the main focus of the passage?', [
        'The bridge’s engineering achievement and continuing importance',
        'Scottish farming',
        'Victorian theatre',
        'Modern road signs',
      ], 0),
    ],
    [
      _r(
        'Why were deep-water supports avoided?',
        'The cantilever design allowed the bridge to span the water without them.',
      ),
      _r('Why are rivets important?', 'They hold the steel parts together.'),
      _r(
        'What does UNESCO recognition show?',
        'It shows the bridge has outstanding cultural or engineering importance.',
      ),
      _r(
        'Why must the bridge be inspected?',
        'It still carries trains and needs to remain safe.',
      ),
      _r(
        'How does the bridge represent the industrial age?',
        'Its scale and steel design show Victorian engineering ambition.',
      ),
    ],
  ),
  _exercise(
    'A Night at the Royal Observatory',
    'At Greenwich, the Royal Observatory has helped people measure time and study the heavens for more than three centuries. The observatory stands on a hill in Greenwich Park, overlooking London. Its location became associated with the Prime Meridian, the line marked as zero degrees longitude. Modern visitors can see instruments, clocks and displays explaining how sailors once used careful observations of stars to navigate. Accurate time was particularly important: comparing the time at sea with the time at a known location helped sailors calculate longitude. Today, satellites and digital systems perform navigation tasks far more quickly, but the observatory remains a place where history, mathematics and astronomy meet. On a clear evening, visitors may also look towards the sky and consider how earlier scientists made sense of the same stars without modern technology.',
    [
      _q('Where is the observatory?', [
        'Greenwich',
        'Bristol',
        'Edale',
        'Woolwich',
      ], 0),
      _q('What is the Prime Meridian?', [
        'Zero degrees longitude',
        'A type of telescope',
        'A clockmaker',
        'A river crossing',
      ], 0),
      _q('Why did sailors observe stars?', [
        'To navigate',
        'To grow crops',
        'To build bridges',
        'To predict bus times',
      ], 0),
      _q('What did comparing times help calculate?', [
        'Longitude',
        'Temperature',
        'Rainfall',
        'Speed of trains',
      ], 0),
      _q('What is used today for navigation?', [
        'Satellites and digital systems',
        'Only candles',
        'Roman roads',
        'Paper sails',
      ], 0),
      _q('What can visitors see?', [
        'Instruments and clocks',
        'Only sports pitches',
        'A working canal',
        'A railway tunnel',
      ], 0),
      _q('Why was accurate time important?', [
        'It helped sailors work out position',
        'It made stars brighter',
        'It stopped tides',
        'It changed the seasons',
      ], 0),
      _q('What subjects meet at the observatory?', [
        'History, mathematics and astronomy',
        'Cooking and drama',
        'Law and farming',
        'Music and geology only',
      ], 0),
      _q('What does navigate mean?', [
        'Find and follow a route',
        'Measure rainfall',
        'Repair a clock',
        'Paint a building',
      ], 0),
      _q('What is the passage mainly about?', [
        'How Greenwich connects time, navigation and astronomy',
        'How to sail a boat',
        'Why London has no hills',
        'How satellites are built',
      ], 0),
    ],
    [
      _r(
        'Why did sailors need accurate time?',
        'They compared times to calculate their longitude and position.',
      ),
      _r(
        'What is longitude?',
        'Longitude is a measurement of position east or west of the Prime Meridian.',
      ),
      _r(
        'How has navigation changed?',
        'Satellites and digital systems now perform tasks more quickly.',
      ),
      _r(
        'Why is the observatory still valuable?',
        'It connects visitors with the history and ideas of science.',
      ),
      _r(
        'What could earlier scientists do without modern technology?',
        'They could observe the stars and use mathematics to understand and navigate.',
      ),
    ],
  ),
  _exercise(
    'The Severn Bore',
    'The Severn Estuary has one of the world’s largest tidal ranges, and under the right conditions its incoming tide forms a wave known as the Severn Bore. The wave travels upstream along the River Severn, sometimes reaching several metres in height. It is created when the funnel-shaped estuary forces a large volume of water into a narrowing channel. The bore is not equally strong every day: its size depends on the tide, the shape of the river and weather conditions. Surfers and spectators are attracted by the spectacle, but the river can be dangerous. Strong currents, hidden obstacles and rapidly changing water levels mean that people must follow local safety advice. The bore is both a natural event and a useful reminder that the sea’s movement can travel far inland.',
    [
      _q('What is the Severn Bore?', [
        'A tidal wave moving upstream',
        'A bridge',
        'A type of fish',
        'A railway engine',
      ], 0),
      _q('Where does the wave travel?', [
        'Upstream along the River Severn',
        'Across a desert',
        'Through a tunnel',
        'Into the Lake District',
      ], 0),
      _q('What shape helps create it?', [
        'A funnel-shaped estuary',
        'A circular lake',
        'A straight canal',
        'A mountain valley',
      ], 0),
      _q('What happens in a narrowing channel?', [
        'Water is forced together',
        'The tide disappears',
        'The river freezes',
        'Ships fly',
      ], 0),
      _q('Does the bore have equal strength every day?', [
        'No',
        'Yes, always',
        'Only in winter',
        'Only at night',
      ], 0),
      _q('What can affect its size?', [
        'Tide, river shape and weather',
        'Only sunshine',
        'Only boats',
        'Only temperature',
      ], 0),
      _q('Why are spectators attracted?', [
        'It is a striking natural spectacle',
        'It is a music festival',
        'It is a railway race',
        'It is a market',
      ], 0),
      _q('What makes the river dangerous?', [
        'Strong currents and hidden obstacles',
        'There is no water',
        'It has no banks',
        'The wave is imaginary',
      ], 0),
      _q('What does upstream mean?', [
        'Towards the source of a river',
        'Towards the sea only',
        'Across a bridge',
        'Under the ground',
      ], 0),
      _q('What is the main idea?', [
        'Tidal forces can create a powerful, changing and risky river wave',
        'Every tide forms the same wave',
        'The Severn is a mountain',
        'Surfers control the weather',
      ], 0),
    ],
    [
      _r(
        'Why does the estuary’s shape matter?',
        'Its funnel shape forces water into a narrower channel.',
      ),
      _r(
        'Why does the bore vary in size?',
        'It depends on the tide, river shape and weather conditions.',
      ),
      _r(
        'Why must visitors follow safety advice?',
        'Strong currents, obstacles and changing water levels are dangerous.',
      ),
      _r(
        'What is an estuary?',
        'An estuary is where a river meets the sea and its water is affected by tides.',
      ),
      _r(
        'What does the bore demonstrate about tides?',
        'It demonstrates that the sea’s movement can travel far inland.',
      ),
    ],
  ),
  _exercise(
    'The National Health Service',
    'The National Health Service began in Britain in 1948 with the aim of providing healthcare based on need rather than ability to pay. Before its creation, access to doctors and hospitals varied widely, and many families worried about the cost of treatment. The NHS brought different services into a national system, although it has changed repeatedly as medicine and society have developed. General practitioners, nurses, dentists, paramedics, pharmacists and many other staff now work across hospitals and community services. The organisation faces pressure from an ageing population, rising demand and limited resources. Public health also depends on prevention, including vaccinations, healthy choices and early medical advice. The NHS is often discussed in terms of cost and policy, but at its centre is a practical principle: people should be able to receive care when they are ill.',
    [
      _q('When did the NHS begin?', ['1948', '1914', '1963', '2000'], 0),
      _q('What principle guided its creation?', [
        'Healthcare based on need',
        'Treatment based on wealth',
        'Care only for workers',
        'Free travel',
      ], 0),
      _q('What worried families before it began?', [
        'The cost of treatment',
        'Too many parks',
        'Train delays',
        'Lack of theatres',
      ], 0),
      _q('Who works in the NHS?', [
        'Many healthcare professionals',
        'Only doctors',
        'Only dentists',
        'Only drivers',
      ], 0),
      _q('What creates pressure on the NHS?', [
        'Ageing population and rising demand',
        'Fewer patients everywhere',
        'Too many rivers',
        'Shorter days',
      ], 0),
      _q('What is prevention?', [
        'Actions that reduce the chance of illness',
        'A hospital building',
        'A type of medicine only',
        'A financial tax',
      ], 0),
      _q('Which is an example of prevention?', [
        'Vaccination',
        'Ignoring symptoms',
        'Avoiding advice',
        'Breaking a prescription',
      ], 0),
      _q('Why has the NHS changed?', [
        'Medicine and society have developed',
        'Britain lost all hospitals',
        'Doctors stopped working',
        'It moved overseas',
      ], 0),
      _q('What is the central principle?', [
        'People should receive care when ill',
        'Only wealthy people need care',
        'Prevention is impossible',
        'Hospitals should close',
      ], 0),
      _q('What is the passage mainly explaining?', [
        'The purpose, development and pressures of the NHS',
        'How to become a nurse',
        'The history of British railways',
        'How to build a clinic',
      ], 0),
    ],
    [
      _r(
        'Why was the NHS created?',
        'It was created to provide healthcare based on need rather than ability to pay.',
      ),
      _r(
        'Name two NHS workers.',
        'Examples include doctors, nurses, dentists, paramedics and pharmacists.',
      ),
      _r(
        'Why can an ageing population increase demand?',
        'Older people may need more medical care and support.',
      ),
      _r(
        'How can public health prevention help?',
        'It can reduce illness through vaccination, healthy choices and early advice.',
      ),
      _r(
        'Why is the NHS described as a national system?',
        'It brings healthcare services together across Britain.',
      ),
    ],
  ),
  _exercise(
    'The Mary Rose',
    'The Mary Rose was a Tudor warship built for Henry VIII’s navy. It sank in the Solent in 1545 during a battle against a French fleet. For centuries, the ship lay protected beneath layers of mud, which helped preserve thousands of objects, including tools, weapons, clothing and personal belongings. Archaeologists began serious investigation of the wreck in the twentieth century, and the ship was raised in 1982 in a remarkable feat of marine archaeology. The preserved objects give historians evidence about ordinary sailors as well as the wealthy people who commanded them. The Mary Rose Museum in Portsmouth displays the ship and many finds. Studying the wreck is valuable because written records often describe kings and battles, while objects can reveal how people worked, ate, travelled and lived.',
    [
      _q('Who was the Mary Rose built for?', [
        'Henry VIII',
        'William Shakespeare',
        'George Stephenson',
        'Isaac Newton',
      ], 0),
      _q('Where did it sink?', [
        'The Solent',
        'The Firth of Forth',
        'The Thames',
        'The Severn',
      ], 0),
      _q('When did it sink?', ['1545', '1215', '1890', '1948'], 0),
      _q('What helped preserve objects?', [
        'Layers of mud',
        'Dry sand',
        'Sunlight',
        'Fire',
      ], 0),
      _q('When was the ship raised?', ['1982', '1963', '1830', '2015'], 0),
      _q('What field investigated the wreck?', [
        'Marine archaeology',
        'Meteorology',
        'Botany',
        'Linguistics',
      ], 0),
      _q('What can the objects reveal?', [
        'How people lived and worked',
        'Only the king’s name',
        'Future weather',
        'Modern traffic',
      ], 0),
      _q('Where is the museum?', [
        'Portsmouth',
        'Birmingham',
        'Greenwich',
        'Edale',
      ], 0),
      _q('Why are ordinary objects important?', [
        'They provide evidence about ordinary sailors',
        'They are all made of gold',
        'They prove no one lived aboard',
        'They replace the ship',
      ], 0),
      _q('What is the main message?', [
        'The wreck provides evidence about Tudor life beyond royal records',
        'The ship still sails every day',
        'Mud destroys every object',
        'Only battles matter to historians',
      ], 0),
    ],
    [
      _r(
        'Why did mud help preserve the ship?',
        'Mud protected the ship and objects from damage for centuries.',
      ),
      _r(
        'Name two objects found on the wreck.',
        'Examples include tools, weapons, clothing and personal belongings.',
      ),
      _r(
        'Why was raising the ship remarkable?',
        'It was a difficult feat of marine archaeology.',
      ),
      _r(
        'How can objects complement written records?',
        'They reveal details of ordinary life that written records may omit.',
      ),
      _r(
        'Why is the Mary Rose useful to historians?',
        'It provides evidence about Tudor sailors, work, food and daily life.',
      ),
    ],
  ),
  _exercise(
    'The Eden Project',
    'The Eden Project in Cornwall was built in a former china clay pit. Instead of hiding the scarred landscape, designers transformed it into a series of enormous biomes: transparent domes containing plants from different climate zones. Visitors can move from a Mediterranean landscape to a warm, humid rainforest environment and learn how plants support people and ecosystems. The project also uses its site to discuss climate change, sustainable materials, water and responsible energy use. Its educational purpose is important, but it is also a successful visitor attraction that brings employment and income to the region. Eden demonstrates how a damaged industrial landscape can be given a new purpose. It encourages people to see environmental problems as challenges that require imagination, scientific understanding and cooperation rather than as reasons to give up.',
    [
      _q('What was the site before Eden?', [
        'A china clay pit',
        'A railway station',
        'A royal palace',
        'A natural rainforest',
      ], 0),
      _q('What are the large domes called?', [
        'Biomes',
        'Barriers',
        'Barges',
        'Boroughs',
      ], 0),
      _q('What do the biomes contain?', [
        'Plants from different climate zones',
        'Only sculptures',
        'Trains',
        'Fishing boats',
      ], 0),
      _q('Which environment can visitors experience?', [
        'Rainforest',
        'Arctic ocean only',
        'Desert road only',
        'Underground tunnel',
      ], 0),
      _q('What topics does the project discuss?', [
        'Climate change and sustainability',
        'Only Tudor battles',
        'Bus timetables',
        'Football results',
      ], 0),
      _q('How does Eden help Cornwall?', [
        'It brings employment and income',
        'It removes all visitors',
        'It closes businesses',
        'It stops education',
      ], 0),
      _q('What does sustainable mean?', [
        'Able to continue without causing unacceptable harm',
        'Very expensive',
        'Made only of steel',
        'Impossible to repair',
      ], 0),
      _q('What happened to the damaged landscape?', [
        'It was transformed and given a new purpose',
        'It was abandoned completely',
        'It became a railway',
        'It was moved abroad',
      ], 0),
      _q('What is the project’s educational purpose?', [
        'To help people understand plants and environmental challenges',
        'To teach only ancient languages',
        'To train bus drivers',
        'To sell ships',
      ], 0),
      _q('What is the main message?', [
        'Imagination and science can help restore damaged places',
        'Industrial land can never change',
        'Plants grow only outdoors',
        'Visitors should avoid all domes',
      ], 0),
    ],
    [
      _r(
        'Why were different biomes created?',
        'They allow visitors to experience plants from different climate zones.',
      ),
      _r(
        'Name two issues discussed at Eden.',
        'It discusses climate change, sustainable materials, water and energy.',
      ),
      _r(
        'How does Eden benefit the local area?',
        'It brings employment and income through visitors.',
      ),
      _r(
        'Why is the project more than a visitor attraction?',
        'It teaches people about plants, ecosystems and environmental responsibility.',
      ),
      _r(
        'What does Eden demonstrate about damaged land?',
        'Damaged industrial land can be transformed and given a useful new purpose.',
      ),
    ],
  ),
  _exercise(
    'The Scottish Parliament',
    'The Scottish Parliament meets at Holyrood in Edinburgh and makes decisions about matters devolved from the United Kingdom Parliament. These include areas such as education, health and aspects of transport. Members of the Scottish Parliament are elected by the public, and the building welcomes visitors who want to learn how debates and committees work. Devolution does not mean that every decision is made in Scotland: some responsibilities, including defence and foreign affairs, remain matters for the UK Parliament. The Parliament’s work involves questioning ministers, examining proposed laws and representing different views. Listening carefully is essential because a democratic chamber contains disagreement as well as agreement. Its purpose is not simply to produce speeches; it is to scrutinise decisions and make public policy more accountable to the people affected by it.',
    [
      _q('Where does the Scottish Parliament meet?', [
        'Holyrood',
        'Cardiff Bay',
        'Westminster Hall',
        'Runnymede',
      ], 0),
      _q('What does devolved mean?', [
        'Powers transferred to a national or local parliament',
        'A type of election poster',
        'A royal ceremony',
        'A railway timetable',
      ], 0),
      _q('Which is a devolved area mentioned?', [
        'Education',
        'Defence',
        'Foreign affairs',
        'Monarchy',
      ], 0),
      _q('Who elects Members of the Scottish Parliament?', [
        'The public',
        'Only ministers',
        'Judges',
        'Tourists',
      ], 0),
      _q('What remains a UK Parliament responsibility?', [
        'Defence',
        'School meals only',
        'Local parks',
        'Every bus route',
      ], 0),
      _q('What do members examine?', [
        'Proposed laws',
        'Weather clouds',
        'Roman roads',
        'Museum tickets',
      ], 0),
      _q('Why is listening important?', [
        'Democratic chambers contain different views',
        'There are no debates',
        'Everyone always agrees',
        'It replaces voting',
      ], 0),
      _q('What does scrutinise mean?', [
        'Examine carefully',
        'Ignore completely',
        'Celebrate loudly',
        'Travel quickly',
      ], 0),
      _q('What makes policy accountable?', [
        'Questioning and representing affected people',
        'Avoiding all questions',
        'Hiding decisions',
        'Ending elections',
      ], 0),
      _q('What is the passage mainly about?', [
        'How devolution and democratic scrutiny work in Scotland',
        'How to visit a castle',
        'Why transport has stopped',
        'The history of Roman Britain',
      ], 0),
    ],
    [
      _r(
        'Name two devolved areas.',
        'Education, health and aspects of transport are devolved areas.',
      ),
      _r(
        'Name two responsibilities that remain with the UK Parliament.',
        'Defence and foreign affairs remain UK responsibilities.',
      ),
      _r(
        'Why do committees matter?',
        'They allow members to examine issues and proposed laws carefully.',
      ),
      _r(
        'Why is disagreement expected in a democracy?',
        'People represent different views and do not always agree.',
      ),
      _r(
        'How can Parliament make policy accountable?',
        'Members question ministers, examine laws and represent the public.',
      ),
    ],
  ),
];
