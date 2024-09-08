import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prod_keeper/data/datasource/product_data_source.dart';
import 'package:prod_keeper/data/model/product_model.dart';
import 'package:prod_keeper/data/reposistory/product_repo_impl.dart';
import 'package:prod_keeper/domain/usecases/add_product.dart';
import 'package:prod_keeper/domain/usecases/delete_product.dart';
import 'package:prod_keeper/domain/usecases/get_all_products.dart';
import 'package:prod_keeper/domain/usecases/update_product.dart';
import 'package:prod_keeper/presentation/blocs/bloc/product_bloc.dart';
import 'package:prod_keeper/presentation/pages/splash_screen.dart';
import 'package:prod_keeper/presentation/widget/app_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [ProductModelSchema],
    directory: dir.path,
  );
  final dataSource = ProductDataSource(isar);
  final repository = ProductRepoImpl(dataSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc(
            GetAllProducts(repository),
            AddProduct(repository),
            UpdateProduct(repository),
            DeleteProduct(repository),
          )..add(
              LoadProducts(),
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // final ProductRepoImpl repo;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prod Keeper',
      theme: ThemeData(textTheme: GoogleFonts.firaSansTextTheme()),
      home: const SplashScreen(),
    );
  }
}
