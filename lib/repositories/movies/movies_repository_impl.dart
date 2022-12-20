import 'package:adf_filmes/application/rest_client/rest_client.dart';
import 'package:adf_filmes/models/movie_detail_model.dart';
import 'package:adf_filmes/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get('/movie/popular', query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1', //Na aula professor ensinou sobre queries aos 11':31"
    }, decoder: (data) {
      final results = data['results'];
      if (results != null) {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Erro ao buscar popular movies[${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get('/movie/top_rated', query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1', //Na aula professor ensinou sobre queries aos 11':31"
    }, decoder: (data) {
      final results = data['results'];
      if (results != null) {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });
    if (result.hasError) {
      print('Erro ao buscar top rated movies[${result.statusText}]');
      throw Exception('Erro ao buscar filmes top rated');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result =
        await _restClient.get<MovieDetailModel?>('/movie/$id', query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'append_to_response': 'images,credits',
      'include_image_language': 'en,pt_br',
    }, decoder: (data) {
      return MovieDetailModel.fromMap(data);
    });

    if (result.hasError) {
      print('Erro ao buscar detalhes do filme [${result.statusText}]');
      throw Exception('Erro ao buscar detalhes do filme');
    }

    return result.body;
  }
}