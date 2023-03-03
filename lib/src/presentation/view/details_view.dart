import 'package:etiya_space_x/src/config/color/app_color.dart';
import 'package:flutter/material.dart';

//TODO VeryGood Analys

class DetailsView extends StatefulWidget {
  final String? name;
  final String? date;
  final String? details;
  final String? largeImage;
  const DetailsView({
    super.key,
    this.name,
    this.date,
    this.details,
    this.largeImage,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorTones.title,
          title: Text(
            widget.name!,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Image.network(widget.largeImage!),
                ),
                distance(),
                Text('${widget.date}'),
                distance(),
                Text('${widget.details}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget distance() {
    return const SizedBox(
      height: 20,
    );
  }
}
