import '../models/models.dart';

Exercise _e(
  String id,
  String name,
  String english,
  int sets,
  int min,
  int max,
  List<String> tips, {
  String? prescription,
}) => Exercise(
  id: id,
  name: name,
  english: english,
  sets: sets,
  minReps: min,
  maxReps: max,
  tips: tips,
  prescription: prescription,
);

final inclinePress = _e(
  'incline_chest_press',
  'Eğimli Sehpada Göğüs Press',
  'Incline Bench / Chest Press',
  3,
  6,
  8,
  [
    'Kürek kemiklerini sehpaya sabitle.',
    'Çoğu sette 1–2 tekrar yedekte bırak.',
  ],
);
final singleRow = _e(
  'chest_supported_single_arm_row',
  'Göğüs Destekli Tek Kol Sırt Çekiş',
  'Chest-Supported Single-Arm Row',
  3,
  8,
  10,
  ['Göğsünü desteğe sabitle.', 'Dirseğini kalçana doğru çek.'],
);
final closePulldown = _e(
  'close_grip_lat_pulldown',
  'Dar Tutuş Yukarıdan Göğse Çekiş',
  'Close-Grip Lat Pulldown',
  3,
  8,
  12,
  ['Barı üst göğse çek.', 'Gövdeni geriye savurma.'],
);
final pecDeck = _e(
  'pec_deck',
  'Göğüs Açış Makinesi',
  'Pec Deck / Chest Fly',
  2,
  12,
  15,
  ['Dirsek açısını koru.', 'Kolları kontrollü birleştir.'],
);
final shoulderPress = _e(
  'machine_shoulder_press',
  'Oturarak Omuz Press Makinesi',
  'Shoulder Press Machine',
  2,
  8,
  10,
  ['Belini mindere yasla.', 'Dirsekleri kilitleme.'],
);
final lateral = _e(
  'lateral_raise',
  'Kolları Yana Açış',
  'Lateral Raise',
  3,
  12,
  18,
  ['Savurmadan omuz hizasına kaldır.', 'Dirsekleri hafif kır.'],
);
final cableCurl = _e(
  'cable_curl',
  'Kabloda Biceps Curl',
  'Cable Curl',
  2,
  10,
  15,
  ['Dirsekleri gövdene yakın tut.', 'Belinden hız alma.'],
);
final vbar = _e(
  'vbar_triceps_pushdown',
  'V-Barı Aşağı İtiş',
  'V-Bar Triceps Pushdown',
  2,
  10,
  15,
  ['Dirsekleri sabit tut.', 'Alt noktada tricepsi sık.'],
);
final legPress = _e('leg_press', 'Bacak İtiş Makinesi', 'Leg Press', 3, 8, 10, [
  'Belini mindere yasla.',
  'Dizleri kilitlemeden it.',
]);
final walkingLunge = _e('walking_lunge', 'Öne Adım Çöküş', 'Lunge', 3, 8, 12, [
  'Ön dizini ayak yönünde tut.',
  'Her bacak için tekrarları tamamla.',
], prescription: '3 × 8–12 / bacak');
final legExtension = _e(
  'leg_extension',
  'Oturarak Dizi Açma',
  'Leg Extension',
  3,
  10,
  15,
  ['Dizini kontrollü aç.', 'Ağırlığı savurmadan indir.'],
);
final legCurl = _e(
  'seated_leg_curl',
  'Bacağı Arkaya Bükme',
  'Seated / Lying Leg Curl',
  3,
  10,
  15,
  ['Pedi topuğunla çek.', 'Kalçanı koltuktan kaldırma.'],
);
final adductor = _e(
  'hip_adduction_machine',
  'İç Bacak Kapatma',
  'Adductor Machine',
  2,
  12,
  18,
  ['Bacakları kontrollü kapat.', 'Dönüşü yavaşlat.'],
);
final calf = _e(
  'standing_calf_raise',
  'Parmak Ucuna Yükselme',
  'Calf Raise',
  3,
  10,
  15,
  ['En üstte kısa süre sık.', 'Topuğu kontrollü indir.'],
);
final wideRow = _e(
  'wide_grip_seated_cable_row',
  'Oturarak Geniş Barı Göğse Çekiş',
  'Wide-Grip Seated Cable Row',
  3,
  8,
  12,
  ['Barı göğüs/üst karına çek.', 'Belinden geriye savrulma.'],
);
final pulldown = _e(
  'lat_pulldown',
  'Yukarıdan Barı Göğse Çekiş',
  'Lat Pulldown',
  3,
  8,
  12,
  ['Barı enseye değil üst göğse çek.', 'Omuzlarını kulaklarından uzak tut.'],
);
final crossover = _e(
  'cable_crossover',
  'Kabloları Önde Birleştirme',
  'Cable Crossover',
  2,
  12,
  15,
  ['Kolları göğüs önünde birleştir.', 'Ağırlığın dönüşünü kontrol et.'],
);
final facePull = _e(
  'face_pull',
  'Halatı Yüze Doğru Çekiş',
  'Face Pull',
  3,
  12,
  18,
  ['Halatı yüzünün iki yanına çek.', 'Dirsekleri dışarıda tut.'],
);
final lateralB = _e(
  'lateral_raise',
  'Kolları Yana Açış',
  'Lateral Raise',
  3,
  12,
  20,
  ['Savurmadan omuz hizasına kaldır.', 'Boynunu rahat tut.'],
);
final hammer = _e(
  'hammer_curl',
  'Dambılı Çekiç Tutuşla Kaldırma',
  'Hammer Curl',
  3,
  10,
  12,
  ['Avuçları birbirine dönük tut.', 'Dirsekleri sabitle.'],
);
final dip = _e(
  'assisted_dip',
  'Dips Makinesinde Aşağı İtiş',
  'Dips Machine',
  2,
  10,
  15,
  ['Omuzlarını aşağıda tut.', 'Dirsekleri kontrollü bük.'],
);
final oneArmPush = _e(
  'one_arm_cable_pushdown',
  'Tek Elle Kabloyu Aşağı İtiş',
  'One-Arm Cable Pushdown',
  2,
  10,
  15,
  ['Dirseği gövde yanında sabitle.', 'Her kolu ayrı tamamla.'],
  prescription: '2 × 10–15 / kol',
);
final reverseLunge = _e(
  'reverse_lunge',
  'Geri Adım Çöküş',
  'Reverse Lunge',
  2,
  10,
  10,
  ['Geriye kontrollü adım at.', 'Her bacağı ayrı tamamla.'],
  prescription: '2 × 10 / bacak',
);
final deadBug = _e(
  'dead_bug',
  'Sırtüstü Çapraz Kol-Bacak Uzatma',
  'Dead Bug',
  3,
  10,
  10,
  ['Bel boşluğunu yere bastır.', 'Her tarafı kontrollü tamamla.'],
  prescription: '3 × 10 / taraf',
);
final sidePlankA = _e('side_plank', 'Yan Plank', 'Side Plank', 3, 25, 45, [
  'Kalçanı düşürme.',
  'İki tarafı da tamamla.',
], prescription: '3 × 25–45 sn / taraf');
final birdDog = _e(
  'bird_dog',
  'Dört Ayakta Çapraz Kol-Bacak Uzatma',
  'Bird Dog',
  3,
  8,
  10,
  ['Kalçanı döndürme.', 'Her tarafı kontrollü tamamla.'],
  prescription: '3 × 8–10 / taraf',
);
final plank = _e('plank', 'Dirsek Plank', 'Plank', 2, 30, 60, [
  'Başından topuğuna düz çizgi kur.',
  'Nefesini tutma.',
], prescription: '2 × 30–60 sn');
final reverseCrunch = _e(
  'reverse_crunch',
  'Dizleri Göğse Çekerek Kalçayı Kaldırma',
  'Reverse Crunch',
  3,
  12,
  15,
  ['Kalçayı karın gücüyle kaldır.', 'Hızla sallanma.'],
);
final heelTouch = _e(
  'heel_touch',
  'Yana Uzanıp Topuğa Dokunma',
  'Heel Touch',
  3,
  16,
  20,
  ['Gövdeni sırayla iki yana uzat.', 'Toplam tekrar sayısını tamamla.'],
  prescription: '3 × 16–20 toplam',
);
final sidePlankB = _e('side_plank', 'Yan Plank', 'Side Plank', 2, 30, 45, [
  'Kalçanı düşürme.',
  'İki tarafı da tamamla.',
], prescription: '2 × 30–45 sn / taraf');
final deadBugB = _e(
  'dead_bug',
  'Sırtüstü Çapraz Kol-Bacak Uzatma',
  'Dead Bug',
  2,
  10,
  10,
  ['Bel boşluğunu yere bastır.', 'Her tarafı kontrollü tamamla.'],
  prescription: '2 × 10 / taraf',
);
final mountain = _e(
  'mountain_climber',
  'Plankte Dizleri Sırayla Göğse Çekme',
  'Mountain Climber',
  2,
  20,
  30,
  ['Kalçayı sabit tut.', 'Bel rahatsız olursa Bird Dog yap.'],
  prescription: '2 × 20–30 sn',
);

final upperA = WorkoutDay('Upper A', 'Pazartesi • Çoğu sette RIR 1–2', [
  inclinePress,
  singleRow,
  closePulldown,
  pecDeck,
  shoulderPress,
  lateral,
  cableCurl,
  vbar,
]);
final lowerA = WorkoutDay(
  'Lower A',
  'Çarşamba • Leg Press alternatifi: Smith Squat',
  [legPress, walkingLunge, legExtension, legCurl, adductor, calf],
);
final upperB = WorkoutDay('Upper B', 'Cuma', [
  wideRow,
  pulldown,
  Exercise(
    id: inclinePress.id,
    name: 'Eğimli Göğüs Press',
    english: 'Incline Chest Press',
    sets: 3,
    minReps: 8,
    maxReps: 10,
    tips: inclinePress.tips,
    prescription: '2–3 × 8–10',
  ),
  crossover,
  facePull,
  lateralB,
  hammer,
  dip,
  oneArmPush,
]);
final lowerB = WorkoutDay('Lower B', 'Cumartesi • Yaklaşık RIR 2 bırak', [
  Exercise(
    id: legPress.id,
    name: legPress.name,
    english: legPress.english,
    sets: 2,
    minReps: 10,
    maxReps: 12,
    tips: legPress.tips,
  ),
  reverseLunge,
  Exercise(
    id: legExtension.id,
    name: legExtension.name,
    english: legExtension.english,
    sets: 2,
    minReps: 12,
    maxReps: 15,
    tips: legExtension.tips,
  ),
  Exercise(
    id: legCurl.id,
    name: legCurl.name,
    english: legCurl.english,
    sets: 2,
    minReps: 12,
    maxReps: 15,
    tips: legCurl.tips,
  ),
  Exercise(
    id: adductor.id,
    name: adductor.name,
    english: adductor.english,
    sets: 2,
    minReps: 15,
    maxReps: 18,
    tips: adductor.tips,
  ),
  Exercise(
    id: calf.id,
    name: calf.name,
    english: calf.english,
    sets: 3,
    minReps: 12,
    maxReps: 15,
    tips: calf.tips,
    prescription: '2–3 × 12–15',
  ),
]);
final coreA = WorkoutDay('Evde Core A', 'Salı', [
  deadBug,
  sidePlankA,
  birdDog,
  plank,
], walk: false);
final coreB = WorkoutDay(
  'Evde Core B',
  'Perşembe • Mountain Climber rahatsız ederse Bird Dog 2×8–10',
  [reverseCrunch, heelTouch, sidePlankB, deadBugB, mountain],
  walk: false,
);
final restDay = WorkoutDay(
  'Tam dinlenme',
  'Pazar • Toparlanma günü',
  const [],
  walk: false,
);
final workouts = [upperA, coreA, lowerA, coreB, upperB, lowerB, restDay];
WorkoutDay workoutForDate(DateTime date) => workouts[date.weekday - 1];

Meal _m(
  int day,
  String slot,
  String name,
  String ingredients,
  String instructions,
  int kcal,
  double p,
  double c,
  double f, {
  List<String> alternatives = const [],
}) => Meal(
  id: 'v2-d$day-$slot',
  name: name,
  mealType: {'b': 'Kahvaltı', 'l': 'Öğle', 's': 'Ara', 'd': 'Akşam'}[slot]!,
  ingredients: ingredients,
  instructions: instructions,
  calories: kcal,
  protein: p,
  carbs: c,
  fat: f,
  dayNumber: day,
  alternatives: alternatives,
);
List<Meal> buildMeals() {
  final meals = <Meal>[];
  void add(
    int d,
    String slot,
    String name,
    String ing,
    int kcal,
    double p,
    double c,
    double f,
  ) {
    meals.add(
      _m(
        d,
        slot,
        name,
        ing,
        'Malzemeleri belirtilen gramajlarla hazırla; yağ miktarını plana göre ölç.',
        kcal,
        p,
        c,
        f,
        alternatives: slot == 's'
            ? ['200 g yoğurt + meyve', 'Kefir + meyve']
            : const [],
      ),
    );
  }

  add(
    1,
    'b',
    '4 yumurta + yulaflı omlet',
    '4 yumurta, 40 g yulaf, sebze',
    520,
    33,
    35,
    26,
  );
  add(
    1,
    'l',
    'Tavuk şiş + pirinç',
    '200 g çiğ tavuk, 70 g kuru pirinç, salata',
    650,
    55,
    65,
    14,
  );
  add(1, 's', 'Muz + yoğurt', '1 muz, 200 g yoğurt', 250, 12, 38, 5);
  add(
    1,
    'd',
    'Tavuklu cacıklı tam buğday dürüm',
    '200 g çiğ tavuk, tam buğday lavaş, 150 g yoğurt, salatalık',
    620,
    60,
    54,
    17,
  );
  add(
    2,
    'b',
    '4 haşlanmış yumurta + lavaş',
    '4 yumurta, 1 tam buğday lavaş, sebze',
    540,
    32,
    42,
    26,
  );
  add(
    2,
    'l',
    'Tavuk şiş + salata + ayran',
    '200 g çiğ tavuk, büyük salata, 250 ml ayran',
    500,
    57,
    20,
    17,
  );
  add(2, 's', 'Whey shake', '30 g whey, 250 ml süt veya su', 220, 28, 14, 5);
  add(
    2,
    'd',
    'Kabak mücver + ızgara tavuk',
    '200 g kabak, 1 yumurta, 30 g yulaf, 200 g çiğ tavuk, salata',
    650,
    68,
    38,
    22,
  );
  add(
    3,
    'b',
    'Zeytinyağlı omlet + lavaş',
    '4 yumurta, yaklaşık 5 g zeytinyağı, tam buğday lavaş',
    590,
    32,
    40,
    32,
  );
  add(
    3,
    'l',
    'Tavuk şiş + bulgur/pirinç + cacık',
    '200 g çiğ tavuk, 70 g kuru bulgur veya pirinç, 150 g cacık',
    690,
    62,
    68,
    16,
  );
  add(
    3,
    's',
    'Yoğurt + meyve',
    '200 g yoğurt, 1 porsiyon meyve',
    240,
    12,
    34,
    5,
  );
  add(
    3,
    'd',
    'Yağsız dana etli bowl',
    '180 g çiğ yağsız dana, 70 g kuru pirinç, sebze, cacık',
    720,
    53,
    71,
    22,
  );
  add(
    4,
    'b',
    '4 haşlanmış yumurta + sebze',
    '4 yumurta, bol sebze',
    370,
    28,
    12,
    24,
  );
  add(
    4,
    'l',
    'Tavuk şiş + büyük salata + yoğurt',
    '200 g çiğ tavuk, büyük salata, 200 g yoğurt',
    520,
    65,
    22,
    17,
  );
  add(
    4,
    's',
    'Protein mug cake',
    '30 g whey, 30 g yulaf, 1 yumurta, 50 ml süt',
    330,
    34,
    30,
    9,
  );
  add(
    4,
    'd',
    'Fırında köfteli patlıcan',
    '180 g çiğ az yağlı kıyma, 250 g patlıcan, yoğurt sos, salata',
    620,
    48,
    36,
    29,
  );
  add(
    5,
    'b',
    '4 yumurta + lavaş + sebze',
    '4 yumurta, tam buğday lavaş, sebze',
    540,
    32,
    42,
    26,
  );
  add(
    5,
    'l',
    'Tavuk şiş + pirinç + salata',
    '200 g çiğ tavuk, 60–70 g kuru pirinç, salata',
    630,
    55,
    62,
    14,
  );
  add(
    5,
    's',
    'Kefir/yoğurt + meyve',
    '250 ml kefir veya 200 g yoğurt, meyve',
    250,
    13,
    36,
    6,
  );
  add(
    5,
    'd',
    'Mantar soslu tavuk dürüm',
    '200 g çiğ tavuk, 120 g mantar, tam buğday lavaş, yoğurt sos',
    640,
    61,
    52,
    19,
  );
  add(
    6,
    'b',
    '4 yumurta + yulaflı omlet',
    '4 yumurta, 40 g yulaf',
    500,
    32,
    29,
    26,
  );
  add(
    6,
    'l',
    'Tavuk şiş + bulgur + salata',
    '200 g çiğ tavuk, 70 g kuru bulgur, salata',
    630,
    59,
    61,
    14,
  );
  add(6, 's', 'Yoğurt + meyve', '200 g yoğurt, meyve', 240, 12, 34, 5);
  add(
    6,
    'd',
    'Ispanaklı tavuk dürüm',
    '200 g çiğ tavuk, 100 g ıspanak, tam buğday lavaş, 30 g peynir',
    650,
    63,
    50,
    20,
  );
  add(
    7,
    'b',
    '4 haşlanmış yumurta + sebze',
    '4 yumurta, sebze',
    370,
    28,
    12,
    24,
  );
  add(
    7,
    'l',
    'Tavuk şiş + salata + cacık',
    '200 g çiğ tavuk, salata, 180 g cacık',
    510,
    61,
    22,
    16,
  );
  add(
    7,
    's',
    'Mini protein cheesecake',
    '150 g süzme yoğurt, 20 g whey, 1 yumurta',
    300,
    37,
    18,
    8,
  );
  add(
    7,
    'd',
    'Tavuk nohut ıspanak',
    '180 g çiğ tavuk, 100–120 g pişmiş nohut, bol ıspanak',
    610,
    62,
    47,
    17,
  );
  add(
    8,
    'b',
    'Az zeytinyağlı omlet + lavaş',
    '4 yumurta, yaklaşık 5 g zeytinyağı, tam buğday lavaş',
    590,
    32,
    40,
    32,
  );
  add(
    8,
    'l',
    'Tavuk şiş + pirinç + ayran',
    '200 g çiğ tavuk, 70–75 g kuru pirinç, 250 ml ayran',
    720,
    62,
    76,
    17,
  );
  add(8, 's', 'Muz + yoğurt', '1 muz, 200 g yoğurt', 250, 12, 38, 5);
  add(
    8,
    'd',
    'Yoğurt marineli baharatlı tavuk',
    '200 g çiğ tavuk, yoğurt marinasyon, 70 g kuru pirinç, cacık',
    720,
    67,
    72,
    17,
  );
  add(
    9,
    'b',
    '4 haşlanmış yumurta + lavaş',
    '4 yumurta, tam buğday lavaş, yeşillik',
    540,
    32,
    42,
    26,
  );
  add(
    9,
    'l',
    'Tavuk şiş + salata + ayran',
    '200 g çiğ tavuk, salata, 250 ml ayran',
    500,
    57,
    20,
    17,
  );
  add(9, 's', 'Whey shake', '30 g whey, 250 ml süt veya su', 220, 28, 14, 5);
  add(
    9,
    'd',
    'Kabak mücver + tavuk',
    '200 g kabak, 1 yumurta, 30 g yulaf, 200 g çiğ tavuk, yoğurtlu salata',
    670,
    70,
    40,
    22,
  );
  add(
    10,
    'b',
    '4 yumurta + yulaflı omlet',
    '4 yumurta, 40 g yulaf',
    500,
    32,
    29,
    26,
  );
  add(
    10,
    'l',
    'Tavuk şiş + pirinç/bulgur',
    '200 g çiğ tavuk, 70 g kuru pirinç veya bulgur',
    640,
    58,
    65,
    14,
  );
  add(10, 's', 'Yoğurt + muz', '200 g yoğurt, 1 muz', 250, 12, 38, 5);
  add(
    10,
    'd',
    'Yağsız kıymalı bowl',
    '180 g çiğ yağsız kıyma, 70 g kuru pirinç, sebze, cacık',
    720,
    52,
    71,
    23,
  );
  add(
    11,
    'b',
    '4 haşlanmış yumurta + sebze',
    '4 yumurta, sebze',
    370,
    28,
    12,
    24,
  );
  add(
    11,
    'l',
    'Tavuk şiş + büyük salata + yoğurt',
    '200 g çiğ tavuk, büyük salata, 200 g yoğurt',
    520,
    65,
    22,
    17,
  );
  add(
    11,
    's',
    'Çikolatalı whey mug cake',
    '30 g çikolatalı whey, 25 g yulaf, 5 g kakao, 1 yumurta',
    325,
    34,
    27,
    9,
  );
  add(
    11,
    'd',
    'Tavuk avokado dürüm',
    '200 g çiğ tavuk, yarım avokado, tam buğday lavaş, sebze',
    700,
    61,
    53,
    27,
  );
  add(
    12,
    'b',
    '4 yumurta + lavaş + sebze',
    '4 yumurta, tam buğday lavaş, sebze',
    540,
    32,
    42,
    26,
  );
  add(
    12,
    'l',
    'Tavuk şiş + pirinç',
    '200 g çiğ tavuk, 60–70 g kuru pirinç',
    620,
    55,
    61,
    14,
  );
  add(12, 's', 'Yoğurt + meyve', '200 g yoğurt, meyve', 240, 12, 34, 5);
  add(
    12,
    'd',
    'Mantarlı tavuk + fırın patates',
    '200 g çiğ tavuk, mantar, 250–300 g patates, salata',
    680,
    62,
    72,
    16,
  );
  add(
    13,
    'b',
    '4 yumurta + yulaflı omlet',
    '4 yumurta, 40 g yulaf',
    500,
    32,
    29,
    26,
  );
  add(
    13,
    'l',
    'Tavuk şiş + bulgur',
    '200 g çiğ tavuk, 70 g kuru bulgur',
    630,
    59,
    61,
    14,
  );
  add(13, 's', 'Yoğurt + tarçın', '200 g yoğurt, tarçın', 150, 11, 12, 5);
  add(
    13,
    'd',
    'Köfteli patlıcan + bulgur',
    '180 g çiğ az yağlı kıyma, patlıcan, yoğurt, 50 g kuru bulgur, salata',
    720,
    52,
    58,
    29,
  );
  add(
    14,
    'b',
    '4 haşlanmış yumurta + sebze + meyve',
    '4 yumurta, sebze, 1 porsiyon meyve',
    460,
    29,
    34,
    24,
  );
  add(
    14,
    'l',
    'Tavuk şiş + büyük salata + cacık',
    '200 g çiğ tavuk, büyük salata, 180 g cacık',
    520,
    62,
    24,
    16,
  );
  add(
    14,
    's',
    'Protein cheesecake / whey yoğurt tatlısı',
    '200 g yoğurt, 25 g whey; isteğe göre cheesecake şeklinde',
    320,
    39,
    25,
    7,
  );
  add(
    14,
    'd',
    'Tavuklu cacıklı dürüm',
    '200 g çiğ tavuk, tam buğday lavaş, cacık',
    620,
    60,
    54,
    17,
  );
  add(
    15,
    'b',
    '4 yumurta + yulaflı omlet',
    '4 yumurta, 40 g yulaf, sebze',
    520,
    33,
    35,
    26,
  );
  add(
    15,
    'l',
    'Tavuk şiş + pirinç + ayran',
    '200 g çiğ tavuk, 70–75 g kuru pirinç, 250 ml ayran',
    720,
    62,
    76,
    17,
  );
  add(15, 's', 'Muz + yoğurt', '1 muz, 200 g yoğurt', 250, 12, 38, 5);
  add(
    15,
    'd',
    'Tavuk fajita bowl',
    '200 g çiğ tavuk, 70 g kuru pirinç, biber, soğan',
    690,
    62,
    73,
    16,
  );
  return meals;
}
