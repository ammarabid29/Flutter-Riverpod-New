import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/state_provider/provider/state_provider.dart';

class SliderScreen extends ConsumerWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final slider = ref
                  .watch(sliderProvider.select((state) => state.showPassword));
              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state =
                      stateProvider.state.copyWith(showPassword: !slider);
                },
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: slider
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider =
                  ref.watch(sliderProvider.select((state) => state.slider));
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final slider =
                  ref.watch(sliderProvider.select((state) => state.slider));
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state =
                      stateProvider.state.copyWith(slider: value);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
