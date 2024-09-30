import 'package:flutter/material.dart';
import 'package:yv_family_tree/data_model/locale_model.dart';
import 'package:yv_family_tree/family_members/family_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localeModel = await LocaleModel.getInstance();
  runApp(MyApp(localeModel: localeModel));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.localeModel});

  final LocaleModel localeModel;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => localeModel,
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          onGenerateTitle: (context) => AppLocalizations.of(context).title,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeModel.locale,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const FamilyListPage(),
        ),
      ),
    );
  }
}
