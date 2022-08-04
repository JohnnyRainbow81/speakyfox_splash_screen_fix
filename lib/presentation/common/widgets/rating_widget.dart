import 'package:flutter/material.dart';
import 'package:flutter_starterkit/presentation/common/resources/color_assets.dart';

class RatingWidget extends StatelessWidget {
  final double averageRating;
  final int ratings;

  const RatingWidget({required this.averageRating, required this.ratings, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rating = [];

    for (int i = 0; i < averageRating.toInt(); i++) {
      rating.add(const Icon(
        Icons.star,
        size: 14,
        
      ));
      rating.add(const SizedBox(
        width: 4,
      ));
      if (i == averageRating.toInt() - 1) {
        rating.add(Text(
          ratings.toString(),
          style: Theme.of(context).textTheme.button,
        )); //_companyDetailsViewModel.votes.toString()));
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [...rating],
    );
  }
}
