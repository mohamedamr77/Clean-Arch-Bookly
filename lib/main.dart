import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/data/model/Epub/Epub_model.dart';
import 'Features/home/data/model/Pdf/pdf_model.dart';
import 'Features/home/data/model/access_info/access_info_model.dart';
import 'Features/home/data/model/book_model.dart';
import 'Features/home/data/model/image_links/image_links_model.dart';
import 'Features/home/data/model/industry_identifier/industry_identifier_model.dart';
import 'Features/home/data/model/panelization_summary/panelization_summary_model.dart';
import 'Features/home/data/model/reading_modes/reading_modes_model.dart';
import 'Features/home/data/model/sale_info/sale_info_model.dart';
import 'Features/home/data/model/volume_info/volume_info_model.dart';
import 'constants.dart';
import 'core/utils/app_box.dart';
import 'core/utils/app_router.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AccessInfoAdapter());
  Hive.registerAdapter(EpubAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  Hive.registerAdapter(IndustryIdentifierAdapter());
  Hive.registerAdapter(PanelizationSummaryAdapter());
  Hive.registerAdapter(PdfAdapter());
  Hive.registerAdapter(ReadingModesAdapter());
  Hive.registerAdapter(SaleInfoAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(BookModelAdapter());

  await Hive.openBox<BookModel>(BoxApp.savedBookBox);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}