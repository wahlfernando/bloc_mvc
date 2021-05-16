import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/trailer_model.dart';
import '../resources/repository.dart';

class MovieDetailBloc {
  final _repository = Repository();
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<Future<TrailerModel>>();

  Function(int) get fetchTrailersById => _movieId.sink.add;
  get movieTrailers => _trailers.stream;

  MovieDetailBloc() {
    _movieId.stream.
    // _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer<TrailerModel>(
          (trailer, int id, int index) {
        trailer = _repository.fetchTrailers(id);
        return trailer;
      },
    );
  }
}
