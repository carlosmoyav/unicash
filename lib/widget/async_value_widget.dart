import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {Key? key,
      required this.value,
      required this.data,
      this.skipLoadingOnRefresh = true,
      this.contenerRefreshWidget = true})
      : super(key: key);
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) data;
  final bool skipLoadingOnRefresh;
  final bool contenerRefreshWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      data: data,
      loading: () => contenerRefreshWidget
          ? ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200, maxHeight: 300),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      error: (e, _) => Center(
        child: Text('Ha ocurrido un error, intentelo de nuevo',
            style: TextStyle(
                color: Theme.of(context).colorScheme.error, fontSize: 18)),
      ),
    );
  }
}
