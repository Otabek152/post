import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_project/domen/bloc/auth_bloc.dart';
import 'package:post_project/generated/codegen_loader.g.dart';
import 'package:post_project/ui/pages/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      assetLoader: CodegenLoader(),
        supportedLocales: [
          Locale('uzblot' , 'UZB'),
          Locale('uzbkr' , 'UZB'),
          Locale('rus' , 'RUS')
        ],
        path:
            'assets/translations',
        fallbackLocale: Locale('uzblot' , 'UZB'),
        child: FindSport()),
  );
}

class FindSport extends StatelessWidget {
  const FindSport({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true, fontFamily: 'Mulish'),
          home: const HomePage()),
    );
  }
}
