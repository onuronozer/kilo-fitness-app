# KILO

KILO; antrenman, 15 günlük beslenme ve vücut gelişimini internete veri göndermeden tek yerde izlemek için hazırlanmış Flutter uygulamasıdır. 19 Ekim 2026 başlangıç tarihinden doğru program gününü otomatik seçer ve başlangıç dönemi sonrasında döngüyü sürdürür.

## Ekran görüntüleri

Uygulama; **Bugün**, **Antrenman**, **Beslenme**, **Gelişim** ve **Ayarlar** olmak üzere beş ana sekmeden oluşur. Ekran görüntüleri ilk cihaz sürümünden sonra bu bölüme eklenecektir; uygulama içi ekranların tamamı kaynak koddan çalışır.

## Özellikler

- 4 günlük Upper/Lower, Core A/B ve pazartesi halı saha programı
- Her ağırlık gününde ayarlanabilir eğimli yürüyüş
- Set bazında kg, tekrar ve tamamlanma kaydı; gerçek önceki antrenman özeti
- Double progression önerisi ve 60/90/120/150 saniyelik dinlenme sayacı
- Başlangıç/bitiş pozu, hareket yönü ve ekipman gösteren dokunulabilir vektör egzersiz anlatımları
- 15 günlük, gramajlı ve makrolu beslenme planı; tarif detayları ve alternatifler
- Tamamlanan öğünlerden otomatik kcal, protein, karbonhidrat ve yağ toplamı
- Günlük kilo, gerçek 7 günlük hareketli ortalama, ölçü geçmişi ve 7/30/tümü grafikleri
- Kalori, protein, su, hedef kilo ve eğimli yürüyüş ayarları
- Tamamen çevrimdışı kişisel veri saklama

## Teknoloji ve mimari

Flutter **3.44.0**, Dart **3.12.0** ve Material 3 kullanılır. Yapı feature-first ve katmanlıdır: saf modeller/hesaplamalar, seed data, yerel repository, uygulama state servisi ve özellik ekranları birbirinden ayrıdır. Durum değişiklikleri `ChangeNotifier`; kalıcılık `shared_preferences` üzerinde JSON ile sağlanır. Bu seçim küçük ve yerel veri seti için sürümleme/codegen yükü olmadan atomik key-value kalıcılık sunar.

Kullanıcı kayıtları Android/iOS uygulama sandbox'ındaki platform `SharedPreferences`/`NSUserDefaults` alanında tutulur. Kayıtlar loglanmaz, repository'ye yazılmaz ve üçüncü taraf servise gönderilmez. Seed öğün/tarif verileri kaynak kodundadır.

## Kurulum ve çalıştırma

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Android release:

```bash
flutter build apk --release
```

iOS release (yalnızca macOS/Xcode üzerinde):

```bash
flutter build ios --release
```

iOS cihaz dağıtımı ve App Store için Apple Developer hesabı ile code signing gerekir. Signing'i atlatan bir yöntem kullanılmaz.

## Klasör yapısı

```text
lib/
  core/             tarih, ortalama, progression ve makro mantığı
  data/             antrenman ve 15 günlük beslenme seed verisi
  models/           domain modelleri
  repositories/     yerel JSON kalıcılığı
  services/         uygulama durumu
  features/         today, workout, nutrition, progress, settings
  shared/           tema ve egzersiz çizim widget'ları
test/               unit, repository ve widget testleri
assets/             yerel egzersiz/ikon/beslenme varlık alanları
```

## Egzersiz görsel lisansı

Egzersiz çizimleri bu proje için sıfırdan yazılmış, uygulama içinde `CustomPainter` ile üretilen özgün vektörlerdir; harici görsel veya üçüncü taraf lisanslı içerik kullanılmaz. Her çizimde başlangıç/bitiş, ok ve harekete uygun ekipman hedeflenir.

## Testler

`flutter test` tarih planı, 7 günlük ortalama, progression, makro toplamı, yerel okuma/yazma, set restore ve dört temel ekran etkileşimini doğrular. GitHub Actions her push/PR'da paket çözümleme, analiz ve test; `main` için ayrıca release APK build çalıştırır.

## Gelecekte geliştirilebilecekler

- Şifreli yedek dışa/içe aktarma
- Health Connect / HealthKit için açık rızalı entegrasyon
- Tablet yerleşimi ve erişilebilirlik seçeneklerinin genişletilmesi
- Kullanıcının kendi egzersiz ve tariflerini oluşturması
