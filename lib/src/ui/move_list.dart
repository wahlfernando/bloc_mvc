import 'package:bloc_mvc/src/blocs/mivie_bloc.dart';
import 'package:bloc_mvc/src/models/item_model.dart';
import 'package:flutter/material.dart';

class MoveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filmes Populares',
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
            fit: BoxFit.fill,
          );
        });
  }
}
