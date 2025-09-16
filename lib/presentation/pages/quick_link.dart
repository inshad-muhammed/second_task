import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task2/presentation/riverpod/selection_provider.dart';
import 'package:task2/presentation/widgets/button.dart';
import 'package:task2/presentation/widgets/icon.dart';

class QuickLinkPage extends ConsumerWidget {
  const QuickLinkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexesProvider);
    final random = Random();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        leadingWidth: 50,
        titleSpacing: 0,
        title: Text(
          "Customize Quick Links",
          style: TextStyle(
            color: const Color.fromARGB(255, 59, 93, 121),
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select upto 4 Options",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "You want have quick acces to",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Wrap(
                spacing: 24,
                runSpacing: 24,

                children: List.generate(16, (index) {
                  final angleDegrees = random.nextDouble() * 8;
                  final angle = angleDegrees * pi / 180;
                  final isSelected = selectedIndex.contains(index);

                  return GestureDetector(
                    onTap: () {
                      ref.read(selectedIndexesProvider.notifier).update((
                        state,
                      ) {
                        final newState = {...state};
                        if (newState.contains(index)) {
                          newState.remove(index); //unselect
                        } else {
                          if (newState.length < 4) {
                            newState.add(index); //add only if < 4
                          }
                        }
                        return newState;
                      });
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Transform.rotate(angle: angle, child: IconWidget()),
                            if (isSelected)
                              const Positioned(
                                bottom: 6,
                                right: -1,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 18,
                                ),
                              ),
                          ],
                        ),

                        SizedBox(
                          width: 70,
                          child: Text(
                            "Quick Link Label",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Button(),
            ),
          ],
        ),
      ),
    );
  }
}
