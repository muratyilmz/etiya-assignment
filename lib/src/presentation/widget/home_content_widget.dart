import 'package:etiya_space_x/main.dart';
import 'package:etiya_space_x/src/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../config/color/app_color.dart';
import '../../core/constant/application_constants.dart';
import '../bloc/space_x_launch_bloc.dart';

class HomeContentWidget extends StatelessWidget {
  final SpaceXLaunchHasData state;
  const HomeContentWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.getSpaceXList.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 1.h,
      ),
      itemBuilder: (context, index) {
        //Null Safety Name

        String name;
        if (state.getSpaceXList[index].name != null) {
          name = state.getSpaceXList[index].name!;
        } else {
          name = 'NO NAME';
        }

        //Null Safety Details
        String details;
        if (state.getSpaceXList[index].details != null) {
          details = state.getSpaceXList[index].details!;
        } else {
          details = 'Details not available';
        }

        //Null Safety SmallImage
        String smallImage;
        if (state.getSpaceXList[index].links!.patch!.small != null) {
          smallImage = state.getSpaceXList[index].links!.patch!.small!;
        } else {
          smallImage = ApplicationConstants.noSmallUrl;
        }
        //Null Safety LargeImage
        String largeImage;
        if (state.getSpaceXList[index].links!.patch!.large != null) {
          largeImage = state.getSpaceXList[index].links!.patch!.large!;
        } else {
          largeImage = ApplicationConstants.noLargeUrl;
        }

        //Null Safety DateUtc
        String date;
        if (state.getSpaceXList[index].dateUtc != null) {
          date = DateFormat("yyyy-MM-dd hh:mm:ss")
              .format(state.getSpaceXList[index].dateUtc!);
        } else {
          date = 'Failed to load date';
        }

        return SizedBox(
          height: 21.h,
          child: GestureDetector(
            onTap: () => router.push(DetailsRouter(
                name: name,
                details: details,
                largeImage: largeImage,
                date: date)),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: ColorTones.backGround,
              semanticContainer: true,
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 25.w,
                      child: Image.network(largeImage),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      height: 20.h,
                      width: 50.w,
                      child: ListTile(
                        title: Text(
                          name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          details,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
