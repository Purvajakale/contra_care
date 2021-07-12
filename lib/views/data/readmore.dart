import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
          //fontFamily: 'monospace',
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Color(0xff7c83fd),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      'E-Pill Alternative',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ReadMoreText(
                      "E-pill is the abbreviation of emergency contraceptive pill.Do not panic if single dose emergency contraceptive pill is not available. After having unprotected intercourse you can use the pack of daily use contraceptive pills (COC) in a different way so as to meet your requirement of emergency contraception.",
                      trimLines: 2,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      colorClickableText: Colors.grey[400],
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' show less',
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
              thickness: 12,
            ),
            Card(
              color: Color(0xff7c83fd),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      'COC pills',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ReadMoreText(
                      "COC pills can be taken in divided dose at interval of 12 hours. A dose of 100 microgram of ethinyl estradiol with 0.5 mg of Levonorgestrel should be taken twice at interval of 12 hours. You should finish taking both the doses within 72 hours of unprotected sexual intercourse. (Yuzpe method)",
                      trimLines: 2,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      colorClickableText: Colors.grey[400],
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' show less',
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
              thickness: 12,
            ),
            Card(
              color: Color(0xff7c83fd),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      'YEARLY CHECKUP (COC)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ReadMoreText(
                      " You have to go for medical checkup only once in a year except when you come across a side effect.",
                      trimLines: 2,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      colorClickableText: Colors.grey[400],
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' show less',
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
              thickness: 12,
            ),
            Card(
              color: Color(0xff7c83fd),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      'E-Pill Alternative',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ReadMoreText(
                      "Flutter has its own UI components, along with an engine to render them on both the Android and iOS platforms. Most of those UI components, right out of the box, conform to the guidelines of Material Design.",
                      trimLines: 2,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      colorClickableText: Colors.grey[400],
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: ' show less',
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
              thickness: 12,
            ),
          ],
        ),
      ),
    );
  }
}
