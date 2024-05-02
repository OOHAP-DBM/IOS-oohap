import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/app_export.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/waste_work/validator_regex.dart';
import '../../../widgets/custom_dropdown.dart';
import 'b_dooh_book_detail_screen.dart';
import 'model/campaign_model.dart';

class CampaignSelectionScreen extends StatefulWidget {
  const CampaignSelectionScreen({super.key});

  @override
  State<CampaignSelectionScreen> createState() =>
      _CampaignSelectionScreenState();
}

class _CampaignSelectionScreenState extends State<CampaignSelectionScreen> {
  // Index for get list data
  int _listBuilderIndex = 0;

  final int _availableSlot = 143;

  late int _totalCampaign;
  late List<bool> _isShowMore;
  late List<TextEditingController> _playTimeController;

  /// For check box
  late List<bool> _checkBoxSelected;

  @override
  void initState() {
    super.initState();
    _totalCampaign = 6;
    _isShowMore = List.generate(_totalCampaign, (index) => false);
    _playTimeController =
        List.generate(_totalCampaign, (index) => TextEditingController());
    _checkBoxSelected = List.generate(_totalCampaign, (index) => false);
    timeList = createTimeSlotsList();
  }

  /// Check box function
  void _handleCheckBoxChanged(int index, bool value) {
    setState(() {
      _checkBoxSelected[index] = value;

      if (!value) {
        _playTimeController[index].clear();
      }
    });
  }

/*
  @override
  void initState() {
    super.initState();
    _totalCampaign = 6;
    _isShowMore = List.generate(_totalCampaign, (index) => false);
    _playTimeController =
        List.generate(_totalCampaign, (index) => TextEditingController());

    timeList = createTimeSlotsList();
  }*/

  /// FOr expand campaign time slot

  void _expandWidget(int index) {
    setState(() {
      for (int i = 0; i < _isShowMore.length; i++) {
        if (i == index) {
          _isShowMore[i] = !_isShowMore[i];
        } /*else {
          _isShowMore[i] = false;
        }*/
      }
    });
  }

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

  // Static list for show
  List<Map<String, String>> timeList = [];

  List<Map<String, String>> createTimeSlotsList() {
    // Define time slots and time names in a single list of maps
    List<Map<String, String>> timeList = [
      {'period': 'Early Morning', 'time': '04:00 AM - 08:00 AM'},
      {'period': 'Morning', 'time': '08:00 AM - 12:00 PM'},
      {'period': 'Afternoon', 'time': '12:00 PM - 04:00 PM'},
      {'period': 'Evening', 'time': '04:00 PM - 08:00 PM'},
      {'period': 'Night', 'time': '08:00 PM - 12:00 AM'},
      {'period': 'Mid-night', 'time': '12:00 AM - 04:00 AM'}
    ];
    return timeList;
  }

  String? _selectedDuration;

  /// Radio button
  final int _selectedOption = -1;

  /// Function for book take value and navigate screen to the next or booking page screen

  /* void navigateToNextScreen() {
    if (_rangeStart != null && _rangeEnd != null) {
      if (_selectedOption != -1) {
        String playTime = _playTimeController[_selectedOption].text.toString();
        if (playTime.isNotEmpty) {
          String selectedPeriod =
              timeList[_selectedOption]['period'].toString();
          String selectedTime = timeList[_selectedOption]['time'].toString();
          Navigator.pushNamed(context, '/doohBookingScreen', arguments: {
            'selectedDate':
                '${_rangeStart!.day} ${AppConstant.bookingDateFormat(_rangeStart!.month)} ${_rangeStart!.year.toString().substring(2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(_rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(2)}',
            'selectedPeriod': selectedPeriod,
            'selectedTime': selectedTime,
            'playTime': playTime,
          }).then((_) => _playTimeController[_selectedOption].clear());
        } else {
          CustomSnackBar.showCustomSnackBar(
              context, 'Please enter total play time',
              backgroundColor: CustomColors.errorColor);
        }
      } else {
        CustomSnackBar.showCustomSnackBar(context, 'Please select a time slot',
            backgroundColor: CustomColors.errorColor);
      }
    } else {
      CustomSnackBar.showCustomSnackBar(
          context, 'Please select campaign date range',
          backgroundColor: CustomColors.errorColor);
    }
  }*/

  /*void navigateToNextScreen() {
    if (_rangeStart != null && _rangeEnd != null) {
      if (_selectedOption != -1) {
        String playTime = _playTimeController[_selectedOption].text.toString();
        if (playTime.isNotEmpty) {
          String selectedPeriod =
              timeList[_selectedOption]['period'].toString();
          String selectedTime = timeList[_selectedOption]['time'].toString();

          CampaignModel campaignModel = CampaignModel(
              timePeriod: selectedPeriod,
              date:
                  '${_rangeStart!.day} ${AppConstant.bookingDateFormat(_rangeStart!.month)} ${_rangeStart!.year.toString().substring(2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(_rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(2)}',
              time: selectedTime,
              numberOfPlays: playTime);

         */ /* Navigator.pushNamed(context, '/doohBookingScreen', arguments: {
            'selectedDate':
                '${_rangeStart!.day} ${AppConstant.bookingDateFormat(_rangeStart!.month)} ${_rangeStart!.year.toString().substring(2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(_rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(2)}',
            'selectedPeriod': selectedPeriod,
            'selectedTime': selectedTime,
            'playTime': playTime,
          }).then((_) => _playTimeController[_selectedOption].clear());*/ /*

           Navigator.pushNamed(context, '/doohBookingScreen', arguments: {
            'selectedDate':
                '${_rangeStart!.day} ${AppConstant.bookingDateFormat(_rangeStart!.month)} ${_rangeStart!.year.toString().substring(2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(_rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(2)}',
            'selectedPeriod': selectedPeriod,
            'selectedTime': selectedTime,
            'playTime': playTime,
          }).then((_) => _playTimeController[_selectedOption].clear());

        } else {
          CustomSnackBar.showCustomSnackBar(
              context, 'Please enter total play time',
              backgroundColor: CustomColors.errorColor);
        }
      } else {
        CustomSnackBar.showCustomSnackBar(context, 'Please select a time slot',
            backgroundColor: CustomColors.errorColor);
      }
    } else {
      CustomSnackBar.showCustomSnackBar(
          context, 'Please select campaign date range',
          backgroundColor: CustomColors.errorColor);
    }
  }*/

/*
void handleRadioSelection(int index) {
    setState(() {
      _listBuilderIndex = index;
      _selectedOption = index;
    });
  }
*/


  void navigateToNextScreen() {
    if (_rangeStart != null && _rangeEnd != null &&
        _checkBoxSelected.isNotEmpty) {
      List<CampaignModel> selectedCampaigns = [];

      for (int i = 0; i < _totalCampaign; i++) {
        if (_checkBoxSelected[i]) {
          String playTime = _playTimeController[i].text.toString();
          if (playTime.isNotEmpty) {
            String selectedPeriod = timeList[i]['period'].toString();
            String selectedTime = timeList[i]['time'].toString();

            CampaignModel campaignModel = CampaignModel(
              timePeriod: selectedPeriod,
             /* date: '${_rangeStart!.day} ${AppConstant.bookingDateFormat(
                  _rangeStart!.month)} ${_rangeStart!.year.toString().substring(
                  2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(
                  _rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(
                  2)}',*/
              time: selectedTime,
              numberOfPlays: playTime,
            );

            selectedCampaigns.add(campaignModel);
          } else {
            CustomSnackBar.showCustomSnackBar(
              context,
              'Please enter total play time',
              backgroundColor: CustomColors.errorColor,
            );
            return;
          }
        }
      }

      /*  if (selectedCampaigns.isNotEmpty) {
        // Pass selectedCampaigns list to the next screen
        Navigator.pushNamed(
          context,
          '/doohBookingScreen',
          arguments: selectedCampaigns.map((campaign) => campaign.toMap()).toList(),
        ).then((_) {
          for (var controller in _playTimeController) {
            controller.clear();
          }
        });
      }*/

      if (selectedCampaigns.isNotEmpty) {
        // Pass selectedCampaigns list to the next screen
        /*  Navigator.pushNamed(
          context,
          '/doohBookingScreen',
          arguments: selectedCampaigns.map((campaign) => campaign.toMap()).toList(),
        ).then((_) {
          for (var controller in _playTimeController) {
            controller.clear();
          }
        });*/


        Navigator.push(context, CupertinoPageRoute(builder: (context) => DOohBookDetailScreen(selectedCampaigns: selectedCampaigns, campaignDate: '${_rangeStart!.day} ${AppConstant.bookingDateFormat(
            _rangeStart!.month)}${_rangeStart!.year.toString().substring(
            2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(
            _rangeEnd!.month)}${_rangeEnd!.year.toString().substring(
            2)}'),)).then((_) => (value) {
          for (var controller in _playTimeController){
            controller.clear();
          }
        });
      } else {
        CustomSnackBar.showCustomSnackBar(
          context,
          'Please select at least one campaign',
          backgroundColor: CustomColors.errorColor,
        );
      }
    } else {
      CustomSnackBar.showCustomSnackBar(
        context,
        'Please select campaign date range and at least one time slot',
        backgroundColor: CustomColors.errorColor,
      );
    }
  }


  /// Dispose text field

  @override
  void dispose() {
    for (var controller in _playTimeController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //  backgroundColor: Colors.grey[200],
     /* appBar: const NormalAppBar(
        //  leading: SizedBox.shrink(),
        title: 'Campaign Selection',
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
                  navigateToNextScreen();
                },
                /*onTap: () {



                  if (_playTimeController.isNotEmpty) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DOohBookDetailScreen(
                            selectedDate: _rangeStart != null &&
                                    _rangeEnd != null
                                ? '${_rangeStart!.day} ${AppConstant.bookingDateFormat(_rangeStart!.month)} ${_rangeStart!.year.toString().substring(2)} - ${_rangeEnd!.day} ${AppConstant.bookingDateFormat(_rangeEnd!.month)} ${_rangeEnd!.year.toString().substring(2)}'
                                : 'Select Date Range',
                            selectedPeriod: timeList[_listBuilderIndex]
                                    ['period']
                                .toString(),
                            selectedTime:
                                timeList[_listBuilderIndex]['time'].toString(),
                            playTime: _playTimeController[_listBuilderIndex]
                                .text
                                .toString()),
                      ),
                    );
                  } else {
                    CustomSnackBar.showCustomSnackBar(
                        context, 'Please enter total play time',
                        backgroundColor: CustomColors.errorColor);
                  }
                },*/
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
              CustomDropdown(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                dropdownValue: 'hello',
                // Set initial value
                width: double.infinity,
                startText: '',
                hintText: 'Select Campaign Type',
                placeholder: 'Select Campaign Dates',
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
              /*  CustomTextFormField(
                onTap: (){},
              //  controller: _datePickerController,
                keyboardType: TextInputType.datetime,
                placeholder: '',
                starText: '',
                hintText: 'Select Start date',
                readOnly: true,
                maxLines: 1,
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.calendar_month,
                    color: CustomColors.buttonGreen,
                    size: 22,
                  ),
                ),
                //  onChanged: (value) => cubit.onChangedDob(value),
                validator: (value) => ValidatorRegex.dateValidator(value),
              ),
              */

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

              /// Add your widget here to show if the date is selected

              // CustomText.text(
              //   text: _rangeStart != null && _rangeEnd != null
              //       ? 'Selected Date Range: $_rangeStart - $_rangeEnd'
              //       : 'No date range selected',
              //   fontSize: 15.sp,
              // ),

              /// Check selected text here

              // _rangeStart != null && _rangeEnd != null ? CustomText.text(
              //    text: _rangeStart != null && _rangeEnd != null
              //        ? 'Selected Date Range'
              //        : 'No date range selected',
              //    fontSize: 15.sp,
              //  ) : ,
              //  SizedBox(height: 10.h),
              CustomText.text(
                  text: 'Select Campaign Time',
                  fontSize: 14.5.sp,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  color: CustomColors.blackColor,
                  fontWeight: FontWeight.w400),
              SizedBox(height: 2.h),
              ListView.builder(
                  itemCount: _totalCampaign,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    _listBuilderIndex = index;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: InkWell(
                        onTap: () {
                          _expandWidget(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                            //color: const Color(0xFFEFF1F2),
                            //   color: Colors.red,
                              border: Border.all(
                                  color: _isShowMore[index]
                                      ? CustomColors.buttonGreen
                                      : CustomColors.mediumBlack
                                      .withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomText.text(
                                              text: timeList[index]['period']
                                                  .toString(),
                                              fontSize: 14.5.sp,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              color: CustomColors.blackColor,
                                              fontWeight: FontWeight.w400),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CustomText.text(
                                              text: timeList[index]['time']
                                                  .toString(),
                                              fontSize: 13.5.sp,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              color: CustomColors.mediumBlack,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          CustomText.text(
                                              text: _availableSlot.toString(),
                                              fontSize: 13.5.sp,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              color: CustomColors.buttonGreen,
                                              fontWeight: FontWeight.w400),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          CustomText.text(
                                              text: 'Available Slots',
                                              fontSize: 13.5.sp,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              color: CustomColors.mediumBlack,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Checkbox(
                                    activeColor: CustomColors.buttonGreen,
                                    checkColor: Colors.white,
                                    side: const BorderSide(
                                        color: CustomColors.liteBlack),
                                    visualDensity: VisualDensity.compact,
                                    value: _checkBoxSelected[index],
                                    onChanged: (value) {
                                      _handleCheckBoxChanged(
                                          index, value ?? false);
                                    },
                                  ),

                                  /* Checkbox(
                                    activeColor: CustomColors.buttonGreen,
                                    checkColor: Colors.white,
                                    side: const BorderSide(
                                        color: CustomColors.liteBlack),
                                    visualDensity: VisualDensity.compact,
                                    // value: _isButtonEnabled,
                                    value: _checkBoxSelected[index],
                                       onChanged: (value) {
                                      setState(() {
                                        _checkBoxSelected[index] =
                                            value ?? false;

                                        if (!_checkBoxSelected[index]) {
                                          _playTimeController.clear();
                                        }
                                      });
                                    },



                                  ),*/

                                  /*   Radio(
                                    value: index,
                                    groupValue: _selectedOption,
                                    onChanged: (value) {
                                      _expandWidget(index);
                                      handleRadioSelection(index);

                                    },
                                    activeColor: CustomColors.buttonGreen,
                                    fillColor:
                                        MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                      return _selectedOption == index
                                          ? CustomColors.buttonGreen
                                          : CustomColors.mediumBlack;
                                    }),
                                    // ----
                                  ),*/
                                ],
                              ),
                              _isShowMore[index]
                                  ? Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    color: Colors.grey[300],
                                    height: 1.0.h,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  CustomText.text(
                                      text: 'Choose Number of Play',
                                      fontSize: 12.5.sp,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      color: CustomColors.blackColor,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                          CustomColors.mediumBlack),
                                      borderRadius:
                                      BorderRadius.circular(10.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: '100 times',
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontFamily:
                                                GoogleFonts
                                                    .poppins()
                                                    .fontFamily,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 12.w),
                                              counterText: '',
                                            ),
                                            // readOnly: !_checkBoxSelected[index],
                                            enabled:
                                            _checkBoxSelected[index],

                                            maxLines: 1,
                                            maxLength: 3,
                                            keyboardType:
                                            TextInputType.number,
                                            controller:
                                            _playTimeController[
                                            _listBuilderIndex],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.r),
                                          child: CustomText.text(
                                            text:
                                            'Out of ${_availableSlot
                                                .toString()}',
                                            fontWeight: FontWeight.w600,
                                            color:
                                            CustomColors.mediumBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                    AlignmentDirectional.centerEnd,
                                    child: CustomText.text(
                                        text: 'Minimum 100 play can book',
                                        fontSize: 12.5.sp,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        color: CustomColors.mediumBlack,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 75.h),
            ],
          )),
    );
  }
}
