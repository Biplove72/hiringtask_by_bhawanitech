import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiringtask/controller/cubit/photoevent.dart';
import 'package:hiringtask/controller/cubit/photostate.dart';
import 'package:hiringtask/controller/services/imageservices.dart';
import 'package:hiringtask/views/image-display.dart';

class ImageScreenPage extends StatefulWidget {
  const ImageScreenPage({super.key, required this.photo});

  final PhotoRepo photo;

  @override
  State<ImageScreenPage> createState() => _ImageScreenPageState();
}

class _ImageScreenPageState extends State<ImageScreenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<PhotoCubit>().getPhoto();

      print(cubit);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Album')),
        shadowColor: Colors.black12,
      ),
      body: BlocBuilder<PhotoCubit, PhotoState>(builder: ((context, state) {
        if (state is InitialState || state is LoadaingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          final data = state.photo;
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageDispaly(
                                  imgurl: data[index].url.toString(),
                                  title: data[index].title.toString())));
                    },
                    child: Container(
                        color: Colors.amber,
                        height: 50,
                        width: 50,
                        child: Image.network(
                          data[index].url.toString(),
                          fit: BoxFit.cover,
                        )),
                  )
                ]);
              });
        } else if (state is PhotoErrorState) {
          return Text(state.message);
        }
        return const Text('something wrong');
      })),
    );
  }
}
