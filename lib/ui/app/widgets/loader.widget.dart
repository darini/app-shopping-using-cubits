import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';

import 'progress_indicator.widget.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  final state;
  final Function? callback;
  const Loader({Key? key, required this.callback, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state == null || state.isLoading) {
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
