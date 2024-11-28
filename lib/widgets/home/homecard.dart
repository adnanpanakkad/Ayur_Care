import 'package:ayur_care/screens/booking_detail_screen.dart';
import 'package:ayur_care/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Homecard extends StatelessWidget {
  final String? tittle;
  final String? content;
  final String? time;
  final String? date;
  const Homecard({
    super.key,
    this.tittle,
    this.content,
    this.time,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1F1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle!.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          content!,
                          style: TextStyle(
                            color: Appcolor.buttonColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(date!),
                      const SizedBox(width: 40),
                      const Icon(
                        Icons.group_outlined,
                        size: 16,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Text(time!),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('View Booking details'),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookingDetailScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Appcolor.buttonColor,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
