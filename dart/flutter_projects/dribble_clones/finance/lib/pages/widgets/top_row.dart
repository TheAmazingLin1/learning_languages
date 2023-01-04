import 'package:flutter/material.dart';

class TopRow extends StatelessWidget {
  const TopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://mir-s3-cdn-cf.behance.net/project_modules/disp/ded7e963258761.5aaa9a9238513.jpg',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
