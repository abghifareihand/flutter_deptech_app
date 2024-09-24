import 'package:flutter/material.dart';
import 'package:rekalaba/core/constants/app_colors.dart';
import 'package:rekalaba/util/custom_icons.dart';
import '../../../ui/shared/text_helper.dart';

class ExpandableTile extends StatefulWidget {
  const ExpandableTile({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final List<String> content;

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.title,
                style: RekaTextStylesV2.textSm.semiBold.copyWith(
                  color: RekaColorsV2.darkNight,
                ),
              ),
              AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: const Icon(
                  CustomIcons.arrow_down_fill,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: RekaColorsV2.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      widget.content.length,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${index + 1}. ',
                                style: RekaTextStylesV2.textXs.regular.copyWith(
                                  color: RekaColorsV2.darkNight,
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: RekaTextStylesV2.textXs.regular.copyWith(
                                      color: RekaColorsV2.darkNight,
                                    ),
                                    children: _getTextSpans(widget.content[index]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        const Divider(
          color: RekaColorsV2.border,
          height: 1,
        ),
      ],
    );
  }

  List<TextSpan> _getTextSpans(String text) {
    final RegExp regex = RegExp(r'\[(.*?)\]'); // Menggunakan regex untuk menangkap teks dalam tanda []
    final List<TextSpan> spans = <TextSpan>[];
    int lastIndex = 0;

    for (final Match match in regex.allMatches(text)) {
      // Tambahkan teks sebelum tanda kurung
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: RekaTextStylesV2.textXs.regular.copyWith(
            color: RekaColorsV2.darkNight,
          ),
        ));
      }

      // Tambahkan teks di dalam tanda kurung sebagai bold
      spans.add(TextSpan(
        text: match.group(1), // Ambil teks di dalam tanda kurung
        style: RekaTextStylesV2.textXs.semiBold.copyWith(
          color: RekaColorsV2.darkNight,
        ),
      ));

      lastIndex = match.end; // Update lastIndex
    }

    // Tambahkan sisa teks setelah tanda kurung
    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: RekaTextStylesV2.textXs.regular.copyWith(
          color: RekaColorsV2.darkNight,
        ),
      ));
    }

    return spans;
  }
}
