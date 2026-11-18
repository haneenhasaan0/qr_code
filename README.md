<div align="center">

# 🚚 بوابة السائق — نقلات Naolon

**تطبيق موبايل للسائقين: رحلاتك ومستنداتك ومأمورياتك في مكان واحد.**

![Flutter](https://img.shields.io/badge/Flutter-Dart%203-02569B?logo=flutter&logoColor=white)
![State](https://img.shields.io/badge/State-Bloc%20%2F%20Cubit-6C63FF)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-3DDC84)
![Language](https://img.shields.io/badge/UI-Arabic%20(RTL)-orange)

</div>

---

## 📖 نبذة

**بوابة السائق** تطبيق Flutter بيخلّي السواق يتابع شغله اليومي من موبايله من غير ورق:
يسجّل مأموريته، يمسح QR بتاع العربية ويشوف تفاصيلها وبلاغات الصيانة، ويتابع رحلاته الشهرية
وبدلاته وخصوماته، ويراجع رخصته وعهدته.

التطبيق بيشتغل بالعربي بالكامل (RTL) ويدعم الوضع الفاتح والداكن.

## ✨ المميزات

| الميزة | الوصف |
|---|---|
| 🔐 **تسجيل الدخول** | بالرقم الوظيفي وكلمة المرور، مع حفظ الجلسة وتجديد الـ token تلقائيًا |
| 👆 **البصمة** | فتح التطبيق بالبصمة (Biometric) بدل إعادة تسجيل الدخول |
| 👋 **شاشة الترحيب** | رسالة ترحيب للسواق الجدد عند أول دخول |
| 🏠 **الرئيسية** | رحلاتك الشهرية، العهدة، الاستلام والتسليم، معدل الوقود، الرسائل والإشعارات |
| 📷 **مسح QR** | مسح كود العربية لعرض تفاصيلها وحالتها (شغالة / ليها بلاغ) |
| 🛠️ **بلاغات الصيانة (RFR)** | عرض بلاغات العربية وإنشاء بلاغ جديد |
| 📋 **المأموريات** | تسجيل مأمورية (نوع المهمة، العربية، التواريخ)، تعديلها، إنهاؤها، وحساب عدد الأيام والقيمة لحد دلوقتي |
| 🪪 **الرخصة والبطاقة** | متابعة بيانات الرخصة وصلاحيتها ومواعيد التجديد، وعرض المستندات (PDF) |
| 💰 **الرواتب** | ملخص الراتب، البدلات والخصومات، تفاصيل كل شهر |
| ⚖️ **قانون العمل** | ملخص مبسط لأهم حقوق وواجبات العامل |
| 📍 **الموقع** | استخدام الـ GPS مع بيانات الرحلات والمأموريات |

## 🧭 الشاشات الرئيسية (Bottom Bar)

```
الرئيسية  |  مسح الرمز  |  مأمورية  |  الرخصة  |  قانون العمل
```

مسار التطبيق:

```
Splash ──► Login ──► Main (5 tabs)
   │                   ├─ الرئيسية ──► الشهور / العهدة / الاستلام والتسليم / المعدل / الرسائل
   │                   ├─ مسح الرمز ──► تفاصيل العربية ──► بلاغ الصيانة (RFR)
   │                   ├─ مأمورية
   │                   ├─ الرخصة
   │                   └─ قانون العمل
   └─► (جلسة محفوظة + بصمة) ──► Main
```

## 🏗️ المعمارية

المشروع منظّم **Feature-first**: كل ميزة ليها فولدر فيه الداتا والـ UI.

```
lib/
├── main.dart
├── core/                      # مشترك بين كل الميزات
│   ├── app_colors/            # الألوان
│   ├── app_images/            # مسارات الصور
│   ├── app_routes/            # الـ routing (go_router)
│   ├── app_styles/            # الخطوط والـ text styles
│   ├── app_theme/             # الثيم الفاتح والداكن
│   ├── provider/              # provider للثيم
│   ├── services/
│   │   ├── api_provider/      # Dio + ApiConstants + Interceptors
│   │   └── local/             # SharedPref (token, user, login...)
│   └── widget/                # widgets مشتركة (form fields, snack bar)
└── features/
    └── <feature>/
        ├── data/
        │   ├── model/         # موديلات الـ API
        │   └── repo/          # الاتصال بالسيرفر (static repos)
        └── presentation/
            ├── cubit/         # الـ state management
            ├── screen/        # الشاشات
            └── widget/        # widgets خاصة بالميزة
```

**الميزات:** `splash_screen` · `login` · `welcome` · `main` · `home` · `scanning` ·
`vehicles` · `vehicle_with_rfr_details` · `casual_mission` · `licence` · `options`
(الراتب والرحلات والبدلات) · `month details` · `covenant` · `delivery_and_receipt` ·
`msgs` · `rate` · `nakalty` · `labor_law`

## 🧰 التقنيات

| الغرض | الـ package |
|---|---|
| State management | `flutter_bloc` (Cubit) + `provider` (للثيم) |
| Routing | `go_router` |
| Networking | `dio` |
| التخزين المحلي | `shared_preferences` |
| مسح QR | `mobile_scanner` |
| البصمة | `local_auth` |
| الموقع | `geolocator` + `geocoding` |
| الملفات والـ PDF | `file_picker` + `pdfx` + `path_provider` |
| UI | `google_fonts` · `lottie` · `shimmer` · `dotted_border` · `gap` |
| اللغة والتواريخ | `flutter_localizations` + `intl` |

## 🔑 المصادقة (Authentication)

- تسجيل الدخول بـ **Basic Auth** على `Login/Login`، والرد فيه `accessToken` و`refreshToken` بيتخزنوا في `SharedPref`.
- كل طلب بيبعت `Authorization: Bearer <token>`.
- لما السيرفر يرجّع **401**، الـ Interceptor بيجدّد الـ token تلقائيًا من `Login/RefreshToken` ويعيد الطلب، ولو التجديد فشل بيتعلّم المستخدم كـ "غير مسجّل".
- عند فتح التطبيق: لو فيه جلسة محفوظة والبصمة مفعّلة → بيطلب البصمة، وإلا بيدخل مباشرة.

## 🌐 الـ API

عنوان السيرفر بيتظبط من:

```
lib/core/services/api_provider/api_constants.dart   →   ApiConstants.baseUrl
```

أهم الـ endpoints:

| الغرض | Endpoint |
|---|---|
| تسجيل الدخول | `Login/Login` |
| تجديد الـ token | `Login/RefreshToken` |
| بيانات السواق | `Driver/Search` · `Driver/SearchByEmployeeNo` |
| تحقق من الرقم الوظيفي | `Driver/EmployeeNoExist` |
| القوايم (عربيات، أنواع المهام...) | `Driver/GetDropdownData` |
| حفظ مأمورية | `Driver/SaveCasualMission` |
| بيانات العربية | `Vehicle/Search` |
| بلاغات الصيانة | `RFR/Search` · `RFR/GetDropdownData` · `RFR/Add` |
| الرحلات | `Trip/Search` |

> ℹ️ قوايم العربيات بتتقسم حسب قطاع السواق: القطاع **1** ← `vehicleTipper`، باقي القطاعات ← `vehicleFlatbed`.
> لازم الـ `VehicleID` يتاخد من القايمة الصح، وإلا عمود VEHICLE في الـ FMS بيطلع فاضي.

## 🚀 تشغيل المشروع

### المتطلبات

- Flutter SDK (Dart `^3.12.2`)
- Android Studio / VS Code
- موبايل أو Emulator (الكاميرا مطلوبة لمسح QR)
- الوصول لشبكة السيرفر الداخلي (الـ API على شبكة الشركة)

### الخطوات

```bash
# 1) تحميل الـ packages
flutter pub get

# 2) تشغيل التطبيق
flutter run

# 3) (اختياري) إعادة توليد أيقونة التطبيق
dart run flutter_launcher_icons
```

### بناء نسخة للتوزيع

```bash
flutter build apk --release      # Android APK
flutter build appbundle          # Android App Bundle
```

## 🔒 الأذونات (Android)

| الإذن | الاستخدام |
|---|---|
| `INTERNET` | الاتصال بالسيرفر |
| `CAMERA` | مسح QR |
| `USE_BIOMETRIC` | الدخول بالبصمة |
| `ACCESS_FINE_LOCATION` / `ACCESS_COARSE_LOCATION` | الموقع |

## 🗺️ خطة التطوير

- [ ] الإشعارات (Local / Push)
- [ ] تحسين معالجة الأخطاء في الـ repos (رسائل واضحة بدل قوايم فاضية)
- [ ] منع تكرار طلب تجديد الـ token لما أكتر من طلب يفشل مع بعض
- [ ] نقل عنوان السيرفر لإعدادات بيئة (dev / prod)

## 🤝 المساهمة

1. اعملي branch جديد لكل ميزة: `git checkout -b feature/اسم-الميزة`
2. اتبعي نفس هيكلة الـ feature (`data` / `presentation`) والـ static repos.
3. شغّلي `flutter analyze` قبل الـ commit.

---

<div align="center">

صُنع بـ ❤️ لسواقين **نقلات Naolon**

</div>
