import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_checkdoc/presentation/bloc/document_list_bloc/document_list_bloc.dart';
// import 'package:flutter_website/presentation/pages/home_page.dart';
// import 'presentation/bloc/login_bloc/login_bloc.dart';
// import 'presentation/pages/login_page.dart';
import 'presentation/pages/user_page.dart';
import 'service_locator.dart' as dependancy_injection;
import 'service_locator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await dependancy_injection.setup();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) => getIt<DocumentListBloc>(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/user': (context) => UserPage(),
          // '/home': (context) => const HomePage(),
          // Add more routes here
        },
        debugShowCheckedModeBanner: false,
        initialRoute: '/user',
        title: 'Check Doc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

