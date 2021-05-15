import 'package:bloc_mvc/src/models/item_model.dart';
import 'package:bloc_mvc/src/resources/move_api_provider.dart';

// è aqui que ele chama a função dentro do arquivo "move_api_provider.dart"
// esse éo sentido do repositorio, aqui poderia ser feito varias Futures para
// resgate das funcionalidades.

class Repository {
  final movesApiProviders = MoveApiProvider();

  Future<ItemModel> fetchAllMovies() => movesApiProviders.fetchMovieList();
}
