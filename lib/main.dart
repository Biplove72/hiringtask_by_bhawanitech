import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiringtask/controller/cubit/photoevent.dart';
import 'package:hiringtask/controller/services/imageservices.dart';
import 'package:hiringtask/views/homepage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PhotoRepo(),
      child: BlocProvider(
        create: (context) => PhotoCubit(PhotoRepo()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ImageScreenPage(
              photo: PhotoRepo(),
            )),
      ),
    );
  }
}
