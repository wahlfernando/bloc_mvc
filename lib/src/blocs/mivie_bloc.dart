import 'package:bloc_mvc/src/models/item_model.dart';
import 'package:bloc_mvc/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MovieBloc();
