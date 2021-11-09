import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedClear;
  final VoidCallback onClickedCamera;

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedCamera,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
    children: [
      ElevatedButton(
        onPressed: onClickedPickImage,
        child: Text('Pick Image'),
      ),
      const SizedBox(width: 12),
      ElevatedButton(
        onPressed: onClickedCamera,
        child: Text('Open Camera'),
      ),
      const SizedBox(width: 12),
      ElevatedButton(
        onPressed: onClickedClear,
        child: Text('Clear'),
      )
    ],
  );
}