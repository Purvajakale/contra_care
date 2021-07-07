import "package:flutter/material.dart";
import '../../models/calendar_day_model.dart';

class CalendarDay extends StatefulWidget {
  final CalendarDayModel day;
  final Function onDayClick;

  CalendarDay(this.day, this.onDayClick);

  @override
  _CalendarDayState createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.day.dayLetter,
            style: TextStyle(
                color: Colors.green[500],
                fontSize: 15,//chnge
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.1,
          ),
          GestureDetector(
            onTap: () => widget.onDayClick(widget.day),
            child: CircleAvatar(
              radius: constrains.maxHeight * 0.18,//chgnge
              backgroundColor: widget.day.isChecked
                  ? Colors.greenAccent[400]
                  : Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  widget.day.dayNumber.toString(),
                  style: TextStyle(
                      color: widget.day.isChecked ? Colors.white : Colors.black,
                      fontSize: 15,//chnge
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
