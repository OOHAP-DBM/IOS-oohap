import 'package:flutter/cupertino.dart';
import 'package:oohapp/widgets/custom_dropdown.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/app_export.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/waste_work/validator_regex.dart';
import 'b_booking_detail_screen.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  final Map<DateTime, bool> nonSelectableDates = {
    DateTime.utc(2024, 3, 15): true,
    DateTime.utc(2024, 3, 20): true,
    DateTime.utc(2024, 3, 25): true,
  };

  bool isDateNonSelectable(DateTime day) {
    return nonSelectableDates.containsKey(day);
  }

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _rangeStart = null;
        _rangeEnd = null;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime? focusedDay) {
    setState(() {
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

  String? _selectedDuration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
    /*  appBar: const NormalAppBar(
        //  leading: SizedBox.shrink(),
        title: 'Select Dates',
      ),*/
      bottomSheet: SingleChildScrollView(
        child: Container(
          // height: 220.h,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: CustomColors.grey,
              blurRadius: 6.0,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.text(
                      text: 'Weekly',
                      fontSize: 12.sp,
                      softWrap: true,
                      color: CustomColors.mediumBlack,
                      overflow: TextOverflow.ellipsis),
                  CustomText.text(
                      text: '₹6,435',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              CustomButton(
                text: 'Book Now',
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => BookingDetailScreen(
                          selectedDate: _rangeStart != null && _rangeEnd != null
                              ? '${_rangeStart!.day} ${AppConstant.bookingDateFormat(_rangeStart!.month)} ${_rangeStart!.year.toString().substring(2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(_rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(2)}'
                              : 'Select Date Range',
                        ),
                      ));
                },
                width: size.width * 0.45,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(
                text: 'Select Your Campaign Duration Date',
                fontSize: 19.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomDropdown(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                dropdownValue: 'hello',
                // Set initial value
                width: double.infinity,
                startText: '',
                hintText: 'Select Campaign Type',
                placeholder: 'Choose booking type',
                items: const [
                  "Weekly (7Days)",
                  'Monthly (30Days)',
                  '6 Months (182Days)',
                  '1 Year (365Days)'
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedDuration = value;
                    DateTime today = DateTime.now();
                    switch (value) {
                      case "Weekly (7Days)":
                        _selectedDay = today;
                        _rangeStart = today;
                        _rangeEnd = today.add(const Duration(days: 7));
                        break;
                      case 'Monthly (30Days)':
                        _selectedDay = today;
                        _rangeStart = today;
                        _rangeEnd = today.add(const Duration(days: 30));
                        break;
                      case '6 Months (182Days)':
                        _selectedDay = today;
                        _rangeStart = today;
                        _rangeEnd = today.add(const Duration(days: 182));
                        break;
                      case '1 Year (365Days)':
                        _selectedDay = today;
                        _rangeStart = today;
                        _rangeEnd = today.add(const Duration(days: 365));
                        break;
                      default:
                        break;
                    }
                  });
                },
                validator: (value) => ValidatorRegex.dropdownValidator(value),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _selectedDay,
                calendarFormat: _calendarFormat,
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                rangeSelectionMode: RangeSelectionMode.enforced,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                calendarStyle: CalendarStyle(
                  rangeStartDecoration: const BoxDecoration(
                      color: CustomColors.buttonGreen, shape: BoxShape.circle),
                  rangeEndDecoration: const BoxDecoration(
                      color: CustomColors.buttonGreen, shape: BoxShape.circle),
                  rangeHighlightColor:
                      CustomColors.buttonGreen.withOpacity(0.2),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: CustomColors.buttonGreen,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              CustomText.text(
                  text: _selectedDuration != null
                      ? 'Selected Duration: $_selectedDuration\n'
                      : '',
                  fontSize: 15.sp),
              CustomText.text(
                text: _rangeStart != null && _rangeEnd != null
                    ? 'Selected Date Range: $_rangeStart - $_rangeEnd'
                    : 'No date range selected',
                fontSize: 15.sp,
              ),
            ],
          )),
    );
  }
}
