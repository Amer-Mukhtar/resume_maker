import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:resume_maker/Models/model_cover.dart';
import 'package:resume_maker/Utility/Adapters/CLAdapters.dart';
import 'Models/model_resume.dart';
import 'Screens/Gpt/gpt.dart';
import 'Screens/Home_Screen/home_screen.dart';
import 'Screens/add_resume_screen/resume_2.dart';
import 'Utility/Adapters/ResumeAdapters.dart';
import 'Screens/add_resume_screen/resume_view_model.dart';

import 'Screens/cover_letter_screen/cover_viewmode.dart'; // Import additional view model



void main() async {
  Gemini.init(apiKey: gemini);
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  Hive.registerAdapter(ResumeModelAdapter());
  Hive.registerAdapter(IntroAdapter());
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(EducationAdapter());
  Hive.registerAdapter(ExperienceAdapter());
  Hive.registerAdapter(SkillAdapter());
  Hive.registerAdapter(LanguageAdapter());
  Hive.registerAdapter(CertificationAdapter());
  Hive.registerAdapter(ReferenceAdapter());
  Hive.registerAdapter(AchievementsAdapter());
  // Open the box for resumes
  var resumeBox = await Hive.openBox<ResumeModel>('resumes');

  Hive.registerAdapter(CLModelAdapter());
  var clBox =await Hive.openBox<CoverLetterModel>('cover_letters');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ResumeViewModelProvider(resumeBox: resumeBox),
        ),
        ChangeNotifierProvider(
          create: (context) => CoverViewModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResumeState(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}
