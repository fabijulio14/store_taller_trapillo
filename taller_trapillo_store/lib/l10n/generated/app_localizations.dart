import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @hello.
  ///
  /// In es, this message translates to:
  /// **'Hola'**
  String get hello;

  /// No description provided for @description.
  ///
  /// In es, this message translates to:
  /// **'Texto de saludo en español'**
  String get description;

  /// No description provided for @title_app.
  ///
  /// In es, this message translates to:
  /// **'Taller del trapillo'**
  String get title_app;

  /// No description provided for @home.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get home;

  /// No description provided for @cart.
  ///
  /// In es, this message translates to:
  /// **'Carrito'**
  String get cart;

  /// No description provided for @profile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @title_categories.
  ///
  /// In es, this message translates to:
  /// **'Categorias'**
  String get title_categories;

  /// No description provided for @category_handbags.
  ///
  /// In es, this message translates to:
  /// **'Bolsos'**
  String get category_handbags;

  /// No description provided for @category_baskets.
  ///
  /// In es, this message translates to:
  /// **'Canastas'**
  String get category_baskets;

  /// No description provided for @category_accessories.
  ///
  /// In es, this message translates to:
  /// **'Accesorios'**
  String get category_accessories;

  /// No description provided for @promotions.
  ///
  /// In es, this message translates to:
  /// **'Promociones'**
  String get promotions;

  /// No description provided for @welcome_title.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido a Trapillo Store'**
  String get welcome_title;

  /// No description provided for @txt_user.
  ///
  /// In es, this message translates to:
  /// **'Usuario'**
  String get txt_user;

  /// No description provided for @txt_passw.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get txt_passw;

  /// No description provided for @button_enter.
  ///
  /// In es, this message translates to:
  /// **'Ingresar'**
  String get button_enter;

  /// No description provided for @txt_best_sellers.
  ///
  /// In es, this message translates to:
  /// **'Lo más vendido'**
  String get txt_best_sellers;

  /// No description provided for @txt_add_cart.
  ///
  /// In es, this message translates to:
  /// **'Agregar Carrito'**
  String get txt_add_cart;

  /// No description provided for @txt_favorite.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get txt_favorite;

  /// No description provided for @txtRegister.
  ///
  /// In es, this message translates to:
  /// **'Registrarse'**
  String get txtRegister;

  /// No description provided for @txtClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get txtClose;

  /// No description provided for @validationPleaseEnterUser.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa tu usuario'**
  String get validationPleaseEnterUser;

  /// No description provided for @validationPleaseEnterPassword.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingrese una contraseña'**
  String get validationPleaseEnterPassword;

  /// No description provided for @validationPasswordMinLength.
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos 4 caracteres'**
  String get validationPasswordMinLength;

  /// No description provided for @validationEnterName.
  ///
  /// In es, this message translates to:
  /// **'Ingrese su nombre'**
  String get validationEnterName;

  /// No description provided for @validationEnterValidEmail.
  ///
  /// In es, this message translates to:
  /// **'Ingrese un correo válido'**
  String get validationEnterValidEmail;

  /// No description provided for @txtName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get txtName;

  /// No description provided for @txtEmail.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get txtEmail;

  /// No description provided for @txtConfirmPassword.
  ///
  /// In es, this message translates to:
  /// **'Confirmar contraseña'**
  String get txtConfirmPassword;

  /// No description provided for @txtUserRegistration.
  ///
  /// In es, this message translates to:
  /// **'Registro de Usuario'**
  String get txtUserRegistration;

  /// No description provided for @msgRegistrationSuccess.
  ///
  /// In es, this message translates to:
  /// **'Registro exitoso'**
  String get msgRegistrationSuccess;

  /// No description provided for @msgRegistrationError.
  ///
  /// In es, this message translates to:
  /// **'Error en el registro'**
  String get msgRegistrationError;

  /// No description provided for @msgLoginSuccess.
  ///
  /// In es, this message translates to:
  /// **'Login exitoso'**
  String get msgLoginSuccess;

  /// No description provided for @msgAuthenticationError.
  ///
  /// In es, this message translates to:
  /// **'Error de autenticación. Verifica tus credenciales.'**
  String get msgAuthenticationError;

  /// No description provided for @validationPleaseEnterEmail.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa tu email'**
  String get validationPleaseEnterEmail;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa un email válido'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordMinLength6.
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos 6 caracteres'**
  String get validationPasswordMinLength6;

  /// No description provided for @lblEmail.
  ///
  /// In es, this message translates to:
  /// **'Email'**
  String get lblEmail;

  /// No description provided for @account.
  ///
  /// In es, this message translates to:
  /// **'Cuenta'**
  String get account;

  /// No description provided for @editProfile.
  ///
  /// In es, this message translates to:
  /// **'Editar perfil'**
  String get editProfile;

  /// No description provided for @addresses.
  ///
  /// In es, this message translates to:
  /// **'Direcciones'**
  String get addresses;

  /// No description provided for @paymentMethods.
  ///
  /// In es, this message translates to:
  /// **'Métodos de pago'**
  String get paymentMethods;

  /// No description provided for @orders.
  ///
  /// In es, this message translates to:
  /// **'Pedidos'**
  String get orders;

  /// No description provided for @orderHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial de pedidos'**
  String get orderHistory;

  /// No description provided for @preferences.
  ///
  /// In es, this message translates to:
  /// **'Preferencias'**
  String get preferences;

  /// No description provided for @notifications.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get notifications;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @country.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get country;

  /// No description provided for @selectLanguage.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar idioma'**
  String get selectLanguage;

  /// No description provided for @spanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get spanish;

  /// No description provided for @english.
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @error.
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @pageNotFound.
  ///
  /// In es, this message translates to:
  /// **'Página no encontrada'**
  String get pageNotFound;

  /// No description provided for @goToHome.
  ///
  /// In es, this message translates to:
  /// **'Ir al inicio'**
  String get goToHome;

  /// No description provided for @spain.
  ///
  /// In es, this message translates to:
  /// **'España'**
  String get spain;

  /// No description provided for @user.
  ///
  /// In es, this message translates to:
  /// **'Usuario'**
  String get user;

  /// No description provided for @username.
  ///
  /// In es, this message translates to:
  /// **'Nombre de usuario'**
  String get username;

  /// No description provided for @phone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In es, this message translates to:
  /// **'Dirección'**
  String get address;

  /// No description provided for @validationEnterUsername.
  ///
  /// In es, this message translates to:
  /// **'Ingrese un nombre de usuario'**
  String get validationEnterUsername;

  /// No description provided for @validationEnterPhone.
  ///
  /// In es, this message translates to:
  /// **'Ingrese un número de teléfono'**
  String get validationEnterPhone;

  /// No description provided for @validationEnterAddress.
  ///
  /// In es, this message translates to:
  /// **'Ingrese una dirección'**
  String get validationEnterAddress;

  /// No description provided for @validationEnterCountry.
  ///
  /// In es, this message translates to:
  /// **'Ingrese un país'**
  String get validationEnterCountry;

  /// No description provided for @validationPasswordsDoNotMatch.
  ///
  /// In es, this message translates to:
  /// **'Las contraseñas no coinciden'**
  String get validationPasswordsDoNotMatch;

  /// No description provided for @validationPasswordMinLength6Chars.
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos 6 caracteres'**
  String get validationPasswordMinLength6Chars;

  /// No description provided for @validationPleaseConfirmPassword.
  ///
  /// In es, this message translates to:
  /// **'Por favor confirme su contraseña'**
  String get validationPleaseConfirmPassword;

  /// No description provided for @errorUnexpected.
  ///
  /// In es, this message translates to:
  /// **'Error inesperado'**
  String get errorUnexpected;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
