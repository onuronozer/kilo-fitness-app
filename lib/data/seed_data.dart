import '../models/models.dart';

const _row = Exercise(
  id: 'row',
  name: 'Oturarak Geniş Barı Göğse Çekiş',
  english: 'Wide Grip Seated Cable Row',
  sets: 3,
  minReps: 8,
  maxReps: 10,
  kind: 'row',
  tips: [
    'Barı göğüs/üst karına çek.',
    'Göğsünü açık tut.',
    'Belinden geriye savrulma.',
  ],
);
const _pulldown = Exercise(
  id: 'pulldown',
  name: 'Geniş Tutuş Göğse Çekiş',
  english: 'Lat Pulldown',
  sets: 3,
  minReps: 8,
  maxReps: 10,
  kind: 'pulldown',
  tips: [
    'Barı enseye değil üst göğse çek.',
    'Omuzlarını kulaklarından uzak tut.',
  ],
);
const _press = Exercise(
  id: 'press',
  name: 'Dambıl Göğüs Presi',
  english: 'Dumbbell Bench Press',
  sets: 3,
  minReps: 8,
  maxReps: 10,
  kind: 'bench',
  tips: ['Kürek kemiklerini sabitle.', 'Dambılları kontrollü indir.'],
);
const _lateral = Exercise(
  id: 'lateral',
  name: 'Yana Omuz Açış',
  english: 'Lateral Raise',
  sets: 3,
  minReps: 12,
  maxReps: 15,
  kind: 'lateral',
  tips: ['Savurma yapmadan kontrollü kaldır.', 'Dirsekleri hafif kır.'],
);
const _face = Exercise(
  id: 'face',
  name: 'Halatı Yüze Çekiş',
  english: 'Face Pull',
  sets: 3,
  minReps: 12,
  maxReps: 15,
  kind: 'face',
  tips: ['Halatı yüzünün iki yanına çek.', 'Dirsekleri dışarıda tut.'],
);
const _curl = Exercise(
  id: 'curl',
  name: 'Dambıl Kol Büküş',
  english: 'Dumbbell Curl',
  sets: 3,
  minReps: 10,
  maxReps: 12,
  kind: 'curl',
  tips: ['Dirsekleri gövdene yakın tut.', 'Belinden hız alma.'],
);
const _legPress = Exercise(
  id: 'leg_press',
  name: 'Makinede Bacak İtiş',
  english: 'Leg Press',
  sets: 4,
  minReps: 8,
  maxReps: 10,
  kind: 'legpress',
  tips: ['Belini mindere yasla.', 'Dizleri kilitlemeden it.'],
);
const _legCurl = Exercise(
  id: 'leg_curl',
  name: 'Oturarak Arka Bacak Büküş',
  english: 'Seated Leg Curl',
  sets: 3,
  minReps: 10,
  maxReps: 12,
  kind: 'legcurl',
  tips: ['Pedi topuğunla aşağı çek.', 'Kalçanı koltuktan kaldırma.'],
);
const _rdl = Exercise(
  id: 'rdl',
  name: 'Dambılla Romen Deadlift',
  english: 'Dumbbell Romanian Deadlift',
  sets: 3,
  minReps: 8,
  maxReps: 10,
  kind: 'hinge',
  tips: ['Kalçanı geriye gönder.', 'Sırtını nötr tut.'],
);
const _calf = Exercise(
  id: 'calf',
  name: 'Ayakta Baldır Yükselişi',
  english: 'Standing Calf Raise',
  sets: 3,
  minReps: 12,
  maxReps: 15,
  kind: 'calf',
  tips: ['En üstte kısa süre sık.', 'Topuğu kontrollü indir.'],
);
const _deadBug = Exercise(
  id: 'dead_bug',
  name: 'Karşı Kol ve Bacak İndirme',
  english: 'Dead Bug',
  sets: 3,
  minReps: 8,
  maxReps: 10,
  kind: 'deadbug',
  tips: ['Bel boşluğunu yere bastır.', 'Karşı kol ve bacağı yavaşça uzat.'],
);
const _birdDog = Exercise(
  id: 'bird_dog',
  name: 'Dört Ayakta Karşı Uzatma',
  english: 'Bird Dog',
  sets: 3,
  minReps: 8,
  maxReps: 10,
  kind: 'birddog',
  tips: ['Kalçanı döndürme.', 'Karşı kol ve bacağı aynı hizada uzat.'],
);
const _sidePlank = Exercise(
  id: 'side_plank',
  name: 'Yan Plank',
  english: 'Side Plank',
  sets: 3,
  minReps: 20,
  maxReps: 30,
  kind: 'sideplank',
  tips: ['Kalçanı yere düşürme.', 'Başından topuğuna düz çizgi kur.'],
);

const workouts = [
  WorkoutDay('Upper A', 'Göğüs, sırt ve omuz', [
    _press,
    _row,
    _pulldown,
    _lateral,
    _curl,
  ]),
  WorkoutDay('Lower A', 'Bacak ve kalça', [_legPress, _legCurl, _rdl, _calf]),
  WorkoutDay('Upper B', 'Sırt, omuz ve kollar', [
    _pulldown,
    _row,
    _face,
    _lateral,
    _curl,
  ]),
  WorkoutDay('Lower B', 'Bacak ve arka zincir', [
    _legPress,
    _rdl,
    _legCurl,
    _calf,
  ]),
  WorkoutDay('Core A', 'Evde merkez bölge', [
    _deadBug,
    _sidePlank,
  ], walk: false),
  WorkoutDay('Core B', 'Denge ve merkez bölge', [
    _birdDog,
    _sidePlank,
  ], walk: false),
];

const recipeNames = [
  'Tavuklu cacıklı dürüm',
  'Kabak mücver + ızgara tavuk',
  'Etli bowl',
  'Fırında köfteli patlıcan',
  'Mantar soslu tavuk dürüm',
  'Ispanaklı tavuk dürüm',
  'Tavuk nohut ıspanak',
  'Yoğurt marineli baharatlı tavuk',
  'Kıymalı bowl',
  'Tavuk avokado dürüm',
  'Mantarlı tavuk + fırın patates',
  'Tavuk fajita bowl',
  'Whey shake',
  'Protein mug cake',
  'Çikolatalı whey mug cake',
  'Protein cheesecake',
  'Whey + yoğurt tatlısı',
];

List<Meal> buildMeals() {
  const mains = [
    (
      'Tavuklu cacıklı dürüm',
      '180 g çiğ tavuk, 1 tam buğday lavaş, 150 g yoğurt, salatalık, dereotu',
      'Tavuğu ızgarada pişir. Cacığı karıştırıp lavaşa tavukla birlikte sar.',
      610,
      55.0,
      56.0,
      18.0,
    ),
    (
      'Kabak mücver + ızgara tavuk',
      '200 g çiğ tavuk, 200 g kabak, 1 yumurta, 30 g yulaf',
      'Mücver harcını fırınla; tavuğu ızgara yapıp yanında servis et.',
      590,
      61.0,
      39.0,
      20.0,
    ),
    (
      'Etli bowl',
      '170 g çiğ yağsız dana, 70 g kuru pirinç, biber, yoğurt',
      'Eti sotele, pirinci haşla ve sebzelerle kasede birleştir.',
      670,
      48.0,
      72.0,
      21.0,
    ),
    (
      'Fırında köfteli patlıcan',
      '180 g çiğ az yağlı kıyma, 250 g patlıcan, domates, 10 g zeytinyağı',
      'Köfte ve patlıcanı dizip domates sosuyla fırınla.',
      620,
      47.0,
      42.0,
      27.0,
    ),
    (
      'Mantar soslu tavuk dürüm',
      '180 g çiğ tavuk, 120 g mantar, 1 lavaş, 80 g yoğurt',
      'Tavuk ve mantarı sotele; yoğurt sosuyla lavaşa sar.',
      600,
      56.0,
      54.0,
      18.0,
    ),
    (
      'Ispanaklı tavuk dürüm',
      '180 g çiğ tavuk, 100 g ıspanak, 1 lavaş, 30 g peynir',
      'Tavuk ve ıspanağı sotele, peynirle lavaşa sar.',
      605,
      57.0,
      51.0,
      19.0,
    ),
    (
      'Tavuk nohut ıspanak',
      '180 g çiğ tavuk, 120 g haşlanmış nohut, 120 g ıspanak',
      'Tavuğu mühürle; nohut ve ıspanakla kısık ateşte pişir.',
      640,
      60.0,
      55.0,
      18.0,
    ),
    (
      'Yoğurt marineli baharatlı tavuk',
      '200 g çiğ tavuk, 100 g yoğurt, 70 g kuru bulgur, baharat',
      'Tavuğu yoğurt ve baharatla marine edip ızgara yap; bulgurla sun.',
      650,
      65.0,
      65.0,
      14.0,
    ),
    (
      'Kıymalı bowl',
      '170 g çiğ az yağlı kıyma, 70 g kuru bulgur, domates, marul',
      'Kıymayı sotele, bulgur ve salatayla kasede birleştir.',
      660,
      47.0,
      68.0,
      23.0,
    ),
    (
      'Tavuk avokado dürüm',
      '180 g çiğ tavuk, 60 g avokado, 1 lavaş, yeşillik',
      'Tavuğu pişir, avokadoyu ez ve yeşillikle lavaşa sar.',
      650,
      54.0,
      53.0,
      24.0,
    ),
    (
      'Mantarlı tavuk + fırın patates',
      '190 g çiğ tavuk, 150 g mantar, 250 g patates',
      'Patatesi fırınla; tavuk ve mantarı tavada pişir.',
      630,
      58.0,
      67.0,
      15.0,
    ),
    (
      'Tavuk fajita bowl',
      '180 g çiğ tavuk, 70 g kuru pirinç, renkli biber, soğan',
      'Tavuk ve sebzeyi yüksek ateşte sotele, pirinç üzerinde sun.',
      650,
      57.0,
      73.0,
      15.0,
    ),
  ];
  const snacks = [
    (
      'Whey shake',
      '30 g whey, 250 ml süt, 100 g muz',
      'Tüm malzemeleri blenderdan geçir.',
      310,
      32.0,
      39.0,
      5.0,
    ),
    (
      'Protein mug cake',
      '30 g whey, 30 g yulaf, 1 yumurta, 50 ml süt',
      'Karıştırıp kupada mikrodalgada 60–90 saniye pişir.',
      330,
      34.0,
      30.0,
      9.0,
    ),
    (
      'Çikolatalı whey mug cake',
      '30 g çikolatalı whey, 25 g yulaf, 5 g kakao, 1 yumurta',
      'Karıştırıp kupada kontrollü şekilde pişir.',
      325,
      34.0,
      27.0,
      9.0,
    ),
    (
      'Protein cheesecake',
      '200 g süzme yoğurt, 25 g whey, 1 yumurta, 15 g yulaf',
      'Karıştırıp küçük kalıpta 170°C’de yaklaşık 25 dakika pişir.',
      350,
      42.0,
      27.0,
      8.0,
    ),
    (
      'Whey + yoğurt tatlısı',
      '200 g yoğurt, 25 g whey, 100 g orman meyvesi',
      'Whey ve yoğurdu karıştır; meyveyi ekle.',
      300,
      36.0,
      29.0,
      5.0,
    ),
  ];
  final out = <Meal>[];
  for (var d = 1; d <= 15; d++) {
    final b = snacks[(d + 1) % snacks.length],
        main = mains[(d - 1) % mains.length],
        snack = snacks[(d - 1) % snacks.length];
    out.add(
      Meal(
        id: 'd${d}b',
        name: b.$1,
        mealType: 'Kahvaltı',
        ingredients: b.$2,
        instructions: b.$3,
        calories: b.$4,
        protein: b.$5,
        carbs: b.$6,
        fat: b.$7,
        dayNumber: d,
        alternatives: [
          snacks[(d) % snacks.length].$1,
          snacks[(d + 2) % snacks.length].$1,
        ],
      ),
    );
    out.add(
      Meal(
        id: 'd${d}m',
        name: main.$1,
        mealType: 'Ana öğün',
        ingredients: main.$2,
        instructions: main.$3,
        calories: main.$4,
        protein: main.$5,
        carbs: main.$6,
        fat: main.$7,
        dayNumber: d,
        alternatives: [
          mains[d % mains.length].$1,
          mains[(d + 4) % mains.length].$1,
        ],
      ),
    );
    out.add(
      Meal(
        id: 'd${d}s',
        name: snack.$1,
        mealType: 'Ara öğün',
        ingredients: snack.$2,
        instructions: snack.$3,
        calories: snack.$4,
        protein: snack.$5,
        carbs: snack.$6,
        fat: snack.$7,
        dayNumber: d,
        alternatives: [snacks[d % snacks.length].$1],
      ),
    );
  }
  return out;
}
