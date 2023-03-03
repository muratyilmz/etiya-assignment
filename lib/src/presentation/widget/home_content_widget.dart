// ignore_for_file: unused_local_variable

import 'package:etiya_space_x/src/core/components/refresh_indicator/refresh_indicator.dart';
import 'package:etiya_space_x/src/core/constant/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../config/color/app_color.dart';
import '../../config/router/app_router.dart';

import '../bloc/space_x_launch_bloc.dart';

class HomeContentWidget extends StatefulWidget {
  final SpaceXLaunchHasData state;

  const HomeContentWidget({
    super.key,
    required this.state,
  });

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  final keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    CustomRefreshIndicator hasDataState(
        Future<dynamic> Function() loadList, SpaceXLaunchHasData state) {
      return CustomRefreshIndicator(
        key: keyRefresh,
        onRefresh: loadList,
        child: ListView.separated(
          shrinkWrap: true,
          primary: false,
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
              smallImage = ImagesConstant.noSmallUrl;
            }
            //Null Safety LargeImage
            String largeImage;
            if (state.getSpaceXList[index].links!.patch!.large != null) {
              largeImage = state.getSpaceXList[index].links!.patch!.large!;
            } else {
              largeImage = ImagesConstant.noLargeUrl;
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
                          child: Image.network(
                            largeImage,
                            fit: BoxFit.contain,
                          ),
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
        ),
      );
    }

    Future loadList() async {
      await Future.delayed(const Duration(milliseconds: 400));
      List data = widget.state.getSpaceXList;
      setState(() => data = data);
    }

    return hasDataState(() => loadList(), widget.state);
  }
}
