import 'package:adf_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie; //aos 38' da aula 6 (Atenção!!!)
    if (movieData != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieData.urlImages.length,
          itemBuilder: (context, index) {
            final image = movieData.urlImages[index];
            return Padding(
              padding: const EdgeInsets.all(2),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

//   @override
//   Widget build(BuildContext context) {
//     if (movie != null) {
//       // // Aqui Dart não consegue promover para não nulo, por isso forcei
//       return SizedBox(
//         height: 278,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount:
//               movie!.urlImages.length, // // Posso Forçar para não ser nulo
//           itemBuilder: (context, index) {
//             final image = movie!.urlImages[index];
//             return Padding(
//               padding: const EdgeInsets.all(2),
//               child: Image.network(image),
//             );
//           },
//         ),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }
// }
