import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;
  BaseView({
    super.key,
    required this.onPageBuilder,
    required this.viewModel,
    this.onModelReady,
    this.onDispose,
  });

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.viewModel);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelReady != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
