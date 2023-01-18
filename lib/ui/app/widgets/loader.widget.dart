import 'progress_indicator.widget.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  final state;
  final Function? callback;
  const Loader({Key? key, required this.callback, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(
        child: GenericProgressIndicator(),
      );
    }
    if (state.data.isEmpty) {
      return const Center(
        child: Text('Nenhum item encontrado.'),
      );
    }

    return callback!();
  }
}
