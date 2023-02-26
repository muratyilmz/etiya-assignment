import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardDetails extends StatefulWidget {
  const CardDetails(
      {super.key, this.playerImage, this.playerDescription, this.onTapIcon});

  final String? playerImage;
  final String? playerDescription;

  final void Function()? onTapIcon;

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 10.h,
            width: 30.w,
            child: Image.network(widget.playerImage!),
          ),
          Text('${widget.playerDescription}'),
          IconButton(
              onPressed: widget.onTapIcon,
              icon: const Icon(Icons.chevron_right))
        ],
      ),
    );
  }

  // Widget _content() {
  //   return BlocBuilder<SpaceXLaunchBloc, SpaceXLaunchState>(
  //     builder: (context, state) {
  //       if (state is SpaceXLaunchHasData) {
  //         List data = state.getSpaceXList;
  //         Text(state.getSpaceXList[0].name!);
  //       } else if (state is SpaceXLaunchEmpty) {
  //         Container(
  //           color: Colors.red,
  //         );
  //       } else if (state is SpaceXLaunchError) {
  //         Container(
  //           color: Colors.yellow,
  //         );
  //       }
  //       return const SizedBox.shrink();
  //     },
  //   );
  // }
}
