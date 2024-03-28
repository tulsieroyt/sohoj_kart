import 'package:flutter/material.dart';

class SKNoDataFoundWidget extends StatelessWidget {
  const SKNoDataFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Data Found',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}