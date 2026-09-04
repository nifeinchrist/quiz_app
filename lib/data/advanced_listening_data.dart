import 'beginner_listening_data.dart';

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
  questions: [
    ...questions,
    _q('What is the listening passage mainly about?', [
      title,
      'An unrelated personal story',
      'A weather forecast only',
      'A fictional sports result',
    ], 0),
    _q('Which listening skill is most useful for this passage?', [
      'Identifying key evidence and explanations',
      'Ignoring the speaker\'s examples',
      'Remembering only the final word',
      'Guessing without listening',
    ], 0),
    _q('What should a careful listener distinguish?', [
      'Facts, reasons and conclusions',
      'Names from every sound',
      'Questions from punctuation only',
      'The speaker\'s accent from the topic',
    ], 0),
    _q('Why are examples included in the passage?', [
      'To support and clarify the central ideas',
      'To replace the main subject',
      'To make the information unreliable',
      'To avoid explaining causes',
    ], 0),
    _q('Which approach gives the most accurate summary?', [
      'Combine the main issue, evidence and consequence',
      'Repeat one minor detail',
      'Add information not stated',
      'Describe only the speaker\'s voice',
    ], 0),
  ],
  customResponseQuestions: [
    ...responses,
    _r(
      'State the central subject of the passage.',
      'The passage is about $title.',
    ),
    _r(
      'Give one important fact you heard.',
      'An important fact is explained in the passage about $title.',
    ),
    _r(
      'What evidence supports the main idea?',
      'The passage gives facts and explanations about $title.',
    ),
    _r(
      'What consequence or challenge is mentioned?',
      'The passage explains a consequence or challenge connected with $title.',
    ),
    _r(
      'Summarise the passage in one sentence.',
      'The passage explains the main issue, evidence and consequences of $title.',
    ),
  ],
);

final advancedListeningExercises = <ListeningExercise>[
  _exercise(
    'The Thames Barrier and Rising Seas',
    'The Thames Barrier was designed to protect London from exceptionally high tides and storm surges. Its steel gates normally lie flat on the riverbed, allowing ships to travel along the Thames. When forecasts indicate dangerous conditions, operators raise the gates to form a protective wall. The barrier is only one part of London\'s flood-defence system; embankments, flood walls, forecasting and emergency planning also matter.\n\nClimate change is making long-term planning more complex. Rising sea levels can increase the background risk, while heavier rainfall may overwhelm drainage systems. Engineers must consider whether existing defences can be adapted, strengthened or supplemented. They also have to protect transport links, historic buildings, homes and businesses.\n\nThe challenge is not simply to build a higher wall. A successful plan must use reliable evidence, allow the river to remain a working waterway and prepare communities for events that cannot be predicted perfectly. The barrier demonstrates how technology, geography and public decision-making must work together.',
    [
      _q('What normally happens to the barrier gates?', [
        'They lie flat on the riverbed.',
        'They block every ship.',
        'They remain upright.',
        'They are removed.',
      ], 0),
      _q('What can cause a dangerous surge?', [
        'Storm conditions and high tides',
        'A railway delay',
        'A dry summer',
        'Low river traffic',
      ], 0),
      _q('Why is the barrier not a complete solution?', [
        'It is part of a wider system.',
        'It only protects farms.',
        'It cannot move.',
        'It creates rainfall.',
      ], 0),
      _q('What makes long-term planning harder?', [
        'Rising seas and heavier rainfall',
        'Fewer buildings',
        'Lower tides',
        'Shorter rivers',
      ], 0),
      _q('What is the main idea?', [
        'Flood protection requires engineering and planning.',
        'The Thames should be closed.',
        'Forecasts are always perfect.',
        'Only walls prevent floods.',
      ], 0),
    ],
    [
      _r(
        'What is a storm surge?',
        'A storm surge is an abnormal rise of water caused by a storm.',
      ),
      _r(
        'Name two other flood-defence measures.',
        'Embankments and flood walls are two other measures.',
      ),
      _r(
        'Why must the river remain a working waterway?',
        'Ships and transport still need to use the Thames.',
      ),
      _r(
        'How might climate change affect flood risk?',
        'Rising seas and heavier rainfall can increase flood risk.',
      ),
      _r(
        'What wider skills are needed for the problem?',
        'The problem needs evidence, engineering, geography and public planning.',
      ),
    ],
  ),
  _exercise(
    'Restoring Peatlands in the Pennines',
    'Peatlands are waterlogged landscapes formed from partially decomposed plants. In the Pennines, layers of peat have developed over thousands of years. They store carbon, hold water and provide habitats for specialist plants and birds. When peat dries out, it can erode, release stored carbon and carry brown sediment into streams.\n\nRestoration teams block drainage channels with small dams made from natural materials. They re-wet the ground and sometimes plant sphagnum moss, which helps peat-forming conditions return. The work is delicate: machinery must avoid damaging the surface, and recovery may take many years.\n\nPeatland restoration benefits more than wildlife. Healthy bogs can slow the movement of rainwater, reduce the amount of sediment entering reservoirs and help communities understand how upland landscapes function. Scientists monitor water levels, vegetation and carbon, because careful evidence is needed to judge whether restoration is succeeding.',
    [
      _q('How is peat formed?', [
        'From partially decomposed plants',
        'From melted rock',
        'From sea salt',
        'From manufactured plastic',
      ], 0),
      _q('What can dry peat release?', [
        'Stored carbon',
        'Fresh snow',
        'Oxygen only',
        'Metal',
      ], 0),
      _q('What do restoration teams block?', [
        'Drainage channels',
        'Railway tunnels',
        'Coastal roads',
        'Factory doors',
      ], 0),
      _q('Which plant may be introduced?', [
        'Sphagnum moss',
        'Oak trees only',
        'Wheat',
        'Seaweed',
      ], 0),
      _q('Why is monitoring important?', [
        'It provides evidence of recovery.',
        'It speeds every storm.',
        'It removes all plants.',
        'It replaces planning.',
      ], 0),
    ],
    [
      _r(
        'Give two benefits of peatlands.',
        'They store carbon, hold water and provide habitats.',
      ),
      _r(
        'Why are drainage channels blocked?',
        'Blocking them re-wets the peat and supports peat-forming conditions.',
      ),
      _r(
        'Why can machinery be harmful?',
        'It can damage the fragile peat surface.',
      ),
      _r(
        'What might scientists measure?',
        'They might measure water levels, vegetation and carbon.',
      ),
      _r(
        'Why can recovery take time?',
        'Peat formed over thousands of years, so its conditions recover slowly.',
      ),
    ],
  ),
  _exercise(
    'The Bristol Bus Boycott',
    'In 1963, campaigners in Bristol challenged a policy that prevented Black people from working as bus crews. Guy Bailey was refused a job because of his race, and local activists organised a boycott. Paul Stephenson, Roy Hackett and Prince Brown helped coordinate the campaign, which drew inspiration from wider civil-rights struggles.\n\nFor several months, many Black residents and supporters avoided the buses. They walked, cycled or shared lifts, accepting inconvenience in order to expose the unfair policy. Newspapers reported the campaign, and national attention increased pressure on the Bristol Omnibus Company.\n\nIn September 1963, the company agreed to employ Black and Asian staff. The boycott did not end racism, but it demonstrated how organised peaceful protest could challenge discrimination. It is remembered as an important event in the history of race equality in Britain and as an example of local action influencing national debate.',
    [
      _q('What policy was challenged?', [
        'A policy excluding Black bus crews',
        'A railway timetable',
        'A school uniform rule',
        'A parking charge',
      ], 0),
      _q('Why was Guy Bailey refused a job?', [
        'Because of his race',
        'Because of his age',
        'Because he moved house',
        'Because he missed a train',
      ], 0),
      _q('What did people do during the boycott?', [
        'They avoided buses.',
        'They bought extra tickets.',
        'They closed the harbour.',
        'They joined the company.',
      ], 0),
      _q('What did the campaign attract?', [
        'National attention',
        'Heavy snowfall',
        'A new canal',
        'A royal visit',
      ], 0),
      _q('What did the boycott demonstrate?', [
        'Peaceful organisation can create pressure for change.',
        'All discrimination ends immediately.',
        'Only governments can protest.',
        'Transport is unnecessary.',
      ], 0),
    ],
    [
      _r(
        'What is a boycott?',
        'A boycott is a deliberate refusal to buy or use something as a protest.',
      ),
      _r(
        'Why did participants accept inconvenience?',
        'They wanted to expose and challenge the unfair policy.',
      ),
      _r(
        'Name two organisers.',
        'Paul Stephenson and Roy Hackett were organisers.',
      ),
      _r(
        'What changed in September 1963?',
        'The company agreed to employ Black and Asian staff.',
      ),
      _r(
        'Why is the event historically important?',
        'It shows how local peaceful protest challenged racial discrimination.',
      ),
    ],
  ),
  _exercise(
    'Renewable Energy on the Yorkshire Coast',
    'The Yorkshire coast has strong winds and existing ports that can support offshore wind development. Turbines placed at sea can generate electricity without using land needed for homes or agriculture. Their blades turn a generator, and cables carry the electricity to the national grid.\n\nOffshore wind is not without challenges. Construction can disturb seabirds and marine mammals, while cables and vessels must be planned carefully. Wind output also changes with weather, so engineers need storage, interconnectors and other flexible sources to keep supply reliable.\n\nA balanced decision considers climate targets, jobs, energy prices, fishing, tourism and wildlife. Public consultation is important because a project affects people who may value the same coastline for different reasons. Renewable energy is therefore both an engineering opportunity and a question of responsible planning.',
    [
      _q('Why is the Yorkshire coast suitable for offshore wind?', [
        'It has strong winds and ports.',
        'It has no sea.',
        'It has no communities.',
        'It has constant sunlight.',
      ], 0),
      _q('What carries electricity to the grid?', [
        'Cables',
        'Fishing nets',
        'Roads',
        'Lifeboats',
      ], 0),
      _q('What can construction disturb?', [
        'Seabirds and marine mammals',
        'Only mountains',
        'Rail passengers',
        'Museum visitors',
      ], 0),
      _q('Why is storage useful?', [
        'Wind output changes.',
        'It creates more coastline.',
        'It stops all fishing.',
        'It removes cables.',
      ], 0),
      _q('What should a balanced decision consider?', [
        'Climate, jobs, prices and wildlife',
        'Only profit',
        'Only tourism',
        'Only machinery',
      ], 0),
    ],
    [
      _r(
        'What is offshore wind?',
        'Offshore wind is electricity generated by turbines located at sea.',
      ),
      _r(
        'Why can offshore turbines reduce land pressure?',
        'They generate electricity at sea rather than using land for turbines.',
      ),
      _r(
        'Name two groups that may be affected.',
        'Fishers and tourism businesses may be affected.',
      ),
      _r(
        'Why is public consultation important?',
        'Different people value and use the coastline in different ways.',
      ),
      _r(
        'How can engineers keep supply reliable?',
        'They can use storage, interconnectors and flexible sources.',
      ),
    ],
  ),
  _exercise(
    'The Science of Vaccination',
    'Vaccination prepares the immune system to recognise a pathogen without causing the full disease. A vaccine may contain an inactive form, a harmless part or instructions that allow cells to produce a recognisable antigen. The immune system responds by producing antibodies and memory cells.\n\nIf the real pathogen later enters the body, memory cells can support a faster response. Vaccination does not guarantee that nobody will be infected, but it can reduce severe illness and sometimes reduce transmission. When many people are protected, vulnerable people who cannot be vaccinated may gain indirect protection.\n\nPublic-health decisions require evidence about safety, effectiveness and disease spread. Listening carefully to scientific explanations means distinguishing between a treatment that is helpful but imperfect and a claim that promises certainty without evidence.',
    [
      _q('What does vaccination prepare?', [
        'The immune system',
        'The skeleton',
        'The weather',
        'The road network',
      ], 0),
      _q('What can memory cells support?', [
        'A faster response',
        'A slower heartbeat',
        'More rainfall',
        'Stronger buildings',
      ], 0),
      _q('Does vaccination guarantee no infection?', [
        'No',
        'Yes, always',
        'Only in summer',
        'Only for adults',
      ], 0),
      _q('Who may gain indirect protection?', [
        'Vulnerable people unable to be vaccinated',
        'Only athletes',
        'Only researchers',
        'No one',
      ], 0),
      _q('What should public-health decisions use?', [
        'Evidence',
        'Rumour alone',
        'Guesswork',
        'Advertising only',
      ], 0),
    ],
    [
      _r(
        'What is a pathogen?',
        'A pathogen is an organism or agent that can cause disease.',
      ),
      _r(
        'What do antibodies do?',
        'They help the immune system recognise and respond to a pathogen.',
      ),
      _r(
        'Why is vaccination not a perfect guarantee?',
        'It does not guarantee that nobody will become infected.',
      ),
      _r(
        'Explain indirect protection.',
        'High community protection can reduce spread and help protect vulnerable people.',
      ),
      _r(
        'Name two types of evidence that matter.',
        'Safety and effectiveness are two important types of evidence.',
      ),
    ],
  ),
  _exercise(
    'Managing Coastal Erosion at Holderness',
    'The Holderness coast in East Yorkshire is made largely of soft boulder clay, so waves can erode it rapidly, especially during storms. Longshore drift moves sediment along the shore. A sea wall or groyne may protect one settlement while reducing sediment available further along the coast.\n\nEngineers use groynes, rock armour and sea walls in some locations, but these defences cost money and require maintenance. Managed realignment offers another approach: selected defences are moved inland or removed, allowing the sea to create intertidal habitat.\n\nCoastal managers must weigh protection for homes and infrastructure against environmental change and public cost. The best decision is often not the most dramatic structure, but the plan that uses evidence to consider how the whole coastline may change over time.',
    [
      _q('What is Holderness made largely from?', [
        'Soft boulder clay',
        'Granite',
        'Concrete',
        'Marble',
      ], 0),
      _q('What moves sediment along the shore?', [
        'Longshore drift',
        'A railway',
        'A glacier only',
        'A road',
      ], 0),
      _q('What can a groyne do?', [
        'Trap sediment',
        'Stop every storm',
        'Create mountains',
        'Remove the sea',
      ], 0),
      _q('What can managed realignment create?', [
        'Intertidal habitat',
        'A motorway',
        'A desert',
        'A tunnel',
      ], 0),
      _q('What must coastal managers balance?', [
        'Protection, cost and the environment',
        'Only tourism',
        'Only engineering',
        'Only property prices',
      ], 0),
    ],
    [
      _r(
        'Why does the coast erode quickly?',
        'Soft boulder clay is easily worn away by waves.',
      ),
      _r(
        'What is longshore drift?',
        'It is the movement of sediment along the shore.',
      ),
      _r(
        'Why can a defence affect another place?',
        'It can interrupt the movement of sediment.',
      ),
      _r(
        'What is managed realignment?',
        'It is moving or removing selected defences to let the sea move inland.',
      ),
      _r(
        'Why is whole-coast planning necessary?',
        'Coastal processes connect different locations over time.',
      ),
    ],
  ),
  _exercise(
    'The Rule of Law in Britain',
    'The rule of law means that everyone, including people in government, is subject to the law. It requires laws to be publicly known and applied through fair procedures. In the United Kingdom, Parliament makes laws, courts interpret them and the executive puts policies into practice.\n\nThese functions overlap, but their separation helps prevent power from becoming concentrated. Citizens can vote, contact representatives and challenge some decisions through legal processes. Independent courts are important because they can consider evidence and legal arguments without simply following political instructions.\n\nDemocracy is therefore more than majority rule. It also requires accountability, rights and institutions that can question those in authority. Disagreement will remain, but lawful procedures provide a peaceful way to manage it.',
    [
      _q('What does the rule of law require?', [
        'Everyone to be subject to law',
        'Only citizens to obey',
        'No public rules',
        'Courts to make all policies',
      ], 0),
      _q('What does Parliament do?', [
        'Makes and debates laws',
        'Runs every business',
        'Forecasts storms',
        'Commands every court',
      ], 0),
      _q('What do courts interpret?', [
        'Laws in individual cases',
        'Weather systems',
        'Railway routes',
        'Election posters',
      ], 0),
      _q('Why separate functions?', [
        'To prevent concentrated power',
        'To end all debate',
        'To remove voting',
        'To avoid evidence',
      ], 0),
      _q('What else does democracy require?', [
        'Accountability and rights',
        'Silence',
        'One opinion',
        'No institutions',
      ], 0),
    ],
    [
      _r(
        'Who is subject to the law?',
        'Everyone, including people in government, is subject to the law.',
      ),
      _r(
        'Name two ways citizens can participate.',
        'They can vote and contact representatives.',
      ),
      _r(
        'Why are independent courts important?',
        'They can consider evidence and legal arguments independently.',
      ),
      _r(
        'What does accountability mean?',
        'It means people with power can be questioned and held responsible.',
      ),
      _r(
        'How can lawful procedures help disagreement?',
        'They provide peaceful and fair ways to manage disagreement.',
      ),
    ],
  ),
  _exercise(
    'The Industrial Revolution in Manchester',
    'Manchester grew into a major centre of cotton manufacture during the Industrial Revolution. Machines increased production, while canals and railways moved raw cotton and finished cloth. Employment attracted people to the city, changing its population and landscape.\n\nGrowth brought serious problems. Housing became overcrowded, smoke darkened the air and industrial waste polluted rivers. Some children worked long hours because families depended on their wages. Reformers investigated these conditions and argued that employers and government had responsibilities.\n\nThe Factory Act of 1833 restricted children\'s working hours and required some education for younger workers. Industrialisation therefore created wealth and opportunity while also producing inequalities that demanded social and political reform.',
    [
      _q('What did Manchester manufacture?', [
        'Cotton goods',
        'Aircraft',
        'Computer chips',
        'Silk maps only',
      ], 0),
      _q('What helped move goods?', [
        'Canals and railways',
        'Only footpaths',
        'Hot-air balloons',
        'Mountain tracks',
      ], 0),
      _q('What problem accompanied growth?', [
        'Overcrowded housing',
        'Empty factories',
        'Cleaner rivers',
        'Fewer workers',
      ], 0),
      _q('What did reformers investigate?', [
        'Working conditions',
        'Sea levels',
        'Space travel',
        'Medieval castles',
      ], 0),
      _q('What did the 1833 Act restrict?', [
        'Children\'s working hours',
        'Train speeds',
        'Cotton colours',
        'River depth',
      ], 0),
    ],
    [
      _r(
        'Why did families depend on factory wages?',
        'Factory wages provided income for families.',
      ),
      _r(
        'Name two problems caused by industrial growth.',
        'Overcrowding and polluted rivers were two problems.',
      ),
      _r(
        'How did transport support industry?',
        'It moved raw materials and finished goods.',
      ),
      _r(
        'What did the Factory Act require besides shorter hours?',
        'It required some education for younger workers.',
      ),
      _r(
        'Why did industrialisation lead to reform debates?',
        'Its wealth was accompanied by dangerous and unequal conditions.',
      ),
    ],
  ),
  _exercise(
    'How Memory Supports Learning',
    'Memory is not a perfect recording. Attention helps information enter working memory, while rehearsal and meaningful connections can support transfer into long-term memory. If attention is divided, less information may be processed accurately.\n\nRetrieval is more than a final test. Recalling information strengthens later recall and reveals what a learner has not understood. Forgetting can happen when memories are not revisited or when similar information interferes. Memories can also be reconstructed, so confidence does not guarantee that every detail is correct.\n\nEffective revision uses spaced practice, retrieval questions and careful checking of sources. These methods require active thinking rather than the comforting feeling of reading the same page repeatedly.',
    [
      _q('What helps information enter working memory?', [
        'Attention',
        'Noise',
        'Distance',
        'Rainfall',
      ], 0),
      _q('What supports long-term memory?', [
        'Meaningful connections',
        'Constant distraction',
        'Avoiding practice',
        'Ignoring context',
      ], 0),
      _q('What can retrieval strengthen?', [
        'Later recall',
        'River flow',
        'Road surfaces',
        'Wind speed',
      ], 0),
      _q('What can interfere with memory?', [
        'Similar information',
        'Fresh air',
        'Clear sources',
        'Spaced practice',
      ], 0),
      _q('Which revision method is recommended?', [
        'Spaced practice',
        'Rereading only',
        'No testing',
        'Guessing',
      ], 0),
    ],
    [
      _r(
        'What is working memory?',
        'It temporarily holds and processes information receiving attention.',
      ),
      _r(
        'How do meaningful connections help?',
        'They link new information to existing understanding.',
      ),
      _r(
        'Why is retrieval useful?',
        'It strengthens later recall and reveals gaps in understanding.',
      ),
      _r(
        'Why can confidence be misleading?',
        'Memory can be reconstructed and details can be wrong.',
      ),
      _r(
        'Name two effective revision methods.',
        'Spaced practice and retrieval questions are effective methods.',
      ),
    ],
  ),
  _exercise(
    'The National Health Service',
    'The National Health Service was established in the United Kingdom in 1948 after the Beveridge Report and years of political debate. Its founding principle was that healthcare should be available according to need rather than ability to pay. It brought hospitals, doctors, nurses and other services into a publicly organised system.\n\nThe NHS has changed as medicine, technology and population needs have developed. It faces pressures including an ageing population, rising costs and limited staff and resources. Decisions about funding and priorities can be difficult because different communities have different needs.\n\nThe history of the NHS shows how a public institution can express collective responsibility. It also shows that values must be matched by practical planning if services are to remain accessible, effective and fair.',
    [
      _q('When was the NHS established?', ['1948', '1918', '1968', '2008'], 0),
      _q('What was its founding principle?', [
        'Care according to need',
        'Care only for the wealthy',
        'No public care',
        'Care only abroad',
      ], 0),
      _q('What did it bring together?', [
        'Hospitals and health services',
        'Railway companies',
        'Courts and prisons',
        'Schools only',
      ], 0),
      _q('Which is a pressure on the NHS?', [
        'Rising costs',
        'No patients',
        'Unlimited staff',
        'Falling medical knowledge',
      ], 0),
      _q('What does collective responsibility suggest?', [
        'Society shares responsibility for care',
        'People never help one another',
        'Only one person decides',
        'Care is always private',
      ], 0),
    ],
    [
      _r(
        'What document influenced the NHS?',
        'The Beveridge Report influenced its creation.',
      ),
      _r(
        'What does “according to need” mean?',
        'People should receive healthcare based on their needs rather than wealth.',
      ),
      _r(
        'Name two pressures on the NHS.',
        'An ageing population and rising costs are two pressures.',
      ),
      _r(
        'Why do funding decisions create debate?',
        'Resources are limited and communities have different needs.',
      ),
      _r(
        'What does the NHS represent?',
        'It represents a belief in collective responsibility for healthcare.',
      ),
    ],
  ),
];
