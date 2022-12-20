import 'package:adf_filmes/modules/movies/movie_detail/movie_detail_controller.dart';
import 'package:adf_filmes/modules/movies/movie_detail/widgets/movie_detail_content/movie_detail_content_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/movie_detail_model.dart';

class MovieDetailContent extends GetView<MovieDetailController> {
  final MovieDetailModel? movie;
  const MovieDetailContent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContentTitle(movie: movie),
        MovieDetailContent(movie: movie),
      ],
    );
  }
}
