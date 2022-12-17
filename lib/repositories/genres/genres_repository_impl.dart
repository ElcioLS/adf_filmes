import 'package:adf_filmes/application/rest_client/rest_client.dart';
import 'package:adf_filmes/models/genre_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result =
        await _restClient.get<List<GenreModel>>('/genre/movie/list', query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
    }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        // return resultData.map<GenreModel>((g) {return GenreModel(id: g['id'], name: g['name']); }); //Posso substituir essa linha pois gerei o MapSerializible
        return resultData
            .map<GenreModel>((g) => GenreModel.fromMap(g))
            .toList();
      }
      return <GenreModel>[];
    });

    if (result.hasError) {
      print('Erro ao buscar Genres [${result.statusText}]');
      throw Exception('Erro ao buscar Genres');
    }
    return result.body ?? <GenreModel>[];
  }
}
