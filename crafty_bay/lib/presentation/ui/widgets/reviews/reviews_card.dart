import 'package:crafty_bay/data/models/review_data.dart';
import 'package:flutter/material.dart';

class ReviewsCard extends StatefulWidget {
  const ReviewsCard({
    super.key,
    required this.reviewData,
  });

  final ReviewData reviewData;

  @override
  State<ReviewsCard> createState() => _ReviewsCardState();
}

class _ReviewsCardState extends State<ReviewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person_outline),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${widget.reviewData.profile!.cusName}',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${widget.reviewData.description}',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
