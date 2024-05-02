import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_buttons/custom_text_btn.dart';
import '../../../widgets/custom_buttons/new_circle_button.dart';
import '../../../widgets/custom_network_cache_image.dart';
import '../../../widgets/custom_show_dialog.dart';
import '../widget/expandable_text.dart';
import '../widget/invoice_text.dart';
import '../widget/payment_method.dart';
import 'model/campaign_model.dart';

class DOohBookDetailScreen extends StatefulWidget {
  const DOohBookDetailScreen(
      {super.key, required this.selectedCampaigns, required this.campaignDate});

  final List<CampaignModel> selectedCampaigns;
  final String campaignDate;

  /*
  final String selectedDate;
  final String selectedPeriod;
  final String selectedTime;
  final String playTime;

  const DOohBookDetailScreen(
      {super.key,
      required this.selectedDate,
      required this.selectedPeriod,
      required this.selectedTime,
      required this.playTime});*/

  @override
  State<DOohBookDetailScreen> createState() => _DOohBookDetailScreenState();
}

class _DOohBookDetailScreenState extends State<DOohBookDetailScreen> {
  final List<String> oohAppServices = [
    'Do you Want Graphics Service',
    'Do you Want Printing Service',
    'Do you Want Mounting Service',
  ];

  int _selectedOption = -1;
  bool _isButtonEnabled = false;

  // Radio button

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _cardExpController = TextEditingController();
  final TextEditingController _cardCvvController = TextEditingController();
  final TextEditingController _couponController = TextEditingController();

  String? _coupon;

  int _selectedCardType = 0;

  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    _nameController.dispose();
    _cardController.dispose();
    _cardExpController.dispose();
    _cardCvvController.dispose();
    _couponController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
     /* appBar: const NormalAppBar(
        //  leading: SizedBox.shrink(),
        title: 'Booking Details',
      ),*/
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 115.h,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: const CustomCachedNetworkImage(
                          imageUrl:
                              'https://www.trawell.in/admin/images/upload/006238776Lucknow_Bara_Imambara_Main.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.text(
                              text: 'Hazratganj Chauraha',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomText.text(
                              text: 'Gomti Nagar, Lucknow',
                              fontSize: 12.sp,
                              //   fontStyle: FontStyle.italic,
                              overflow: TextOverflow.ellipsis,
                              //color: Colors.grey,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                  size: 17.sp,
                                ),
                                CustomText.text(
                                  text: '4.95 . 22 Reviews',
                                  fontSize: 13.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomText.text(
                              text: 'Campaign Dates',
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomText.text(
                                      text: widget.campaignDate,
                                      fontSize: 12.sp,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                  CustomTextBtn(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    text: 'Edit',
                                    textColor: CustomColors.buttonGreen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.text(
                  text: 'Do you have coupon code ?',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: _coupon ?? 'Enter coupon code here',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.w),
                          ),
                          controller: _couponController,
                          readOnly: _coupon != null ? true : false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.r),
                        child: CustomTextBtn(
                            onPressed: () {
                              setState(() {
                                _coupon = _couponController.text.toString();
                              });
                              CustomSnackBar.showCustomSnackBar(
                                  context, 'Coupon Added!');
                            },
                            text: 'Apply',
                            fontWeight: FontWeight.w600,
                            textColor: CustomColors.buttonGreen),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  onTap: () {
                    setState(() {
                      _coupon = _couponController.text.toString();
                    });
                    CustomSnackBar.showCustomSnackBar(context, 'Coupon Added!');
                  },
                  backgroundColor: Colors.black,
                  text: 'Add Coupon',
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: CustomColors.grey,
                              blurRadius: 6.0,
                            ),
                          ],
                          border: Border.all(
                            color: CustomColors.mediumBlack,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText.text(
                                text: 'Campaign Date',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomText.text(
                                  //  text: 'widget.selectedDate',
                                  text: widget.campaignDate,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                  color: CustomColors.mediumBlack),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          ListView.builder(
                            itemCount: widget.selectedCampaigns.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final campaign = widget.selectedCampaigns[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText.text(
                                            text: campaign.timePeriod,
                                            //  text: ' widget.selectedPeriod',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          CustomText.text(
                                              //     text: 'widget.selectedTime',
                                              text: campaign.time,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                              overflow: TextOverflow.ellipsis,
                                              color: CustomColors.mediumBlack),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          CustomText.text(
                                            // text: ' widget.playTime',
                                            text: campaign.numberOfPlays,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            color: CustomColors.buttonGreen,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          CustomText.text(
                                              text: 'Repeat play ',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                              overflow: TextOverflow.ellipsis,
                                              color: CustomColors.mediumBlack),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(15, -30),
                      child: NewCircularButton(
                          backgroundColor: Colors.grey[300],
                          onPressed: () => Navigator.of(context).pop(),
                          iconSize: 15.w,
                          iconColor: Colors.black,
                          icon: Icons.edit),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const InvoiceTextWidget(
                  text1: 'Billing Pattern',
                  fontWeight1: FontWeight.w600,
                  text2: 'Day',
                  fontWeight2: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                const InvoiceTextWidget(
                  text1: 'Per 30 sec Price x Number of Play',
                  fontColor1: CustomColors.mediumGrey,
                  text2: '₹10x200',
                  fontColor2: CustomColors.mediumGrey,
                ),
                SizedBox(height: 4.h),
                const InvoiceTextWidget(
                  text1: 'Designing Charges',
                  fontColor1: CustomColors.mediumGrey,
                  text2: '₹ 1023.00',
                  fontColor2: CustomColors.mediumGrey,
                ),

                SizedBox(height: 4.h),
                const InvoiceTextWidget(
                  text1: 'Estimated GST/VAT',
                  fontColor1: CustomColors.mediumGrey,
                  text2: 'Rs 1502.00',
                  fontColor2: CustomColors.mediumGrey,
                ),
                SizedBox(height: 4.h),
                const InvoiceTextWidget(
                  text1: 'OOHAPP service fee',
                  fontColor1: CustomColors.mediumGrey,
                  text2: 'Rs 20000.60',
                  fontColor2: CustomColors.mediumGrey,
                ),
                SizedBox(height: 10.h),  const InvoiceTextWidget(
                  text1: 'Discount',
                  fontColor1: CustomColors.mediumGrey,
                  text2: '10%',
                  fontColor2: CustomColors.mediumGrey,
                ),
                SizedBox(height: 10.h),
                Container(
                  width: size.width,
                  height: 2,
                  color: CustomColors.grey.withOpacity(0.4),
                ),
                SizedBox(height: 10.h),
                const InvoiceTextWidget(
                  text1: 'Total',
                  text2: 'Rs 1,60,437.60',
                ),
                _coupon != null
                    ? Column(
                        children: [
                          SizedBox(height: 8.h),
                          const InvoiceTextWidget(
                            text1: 'Coupon Offer',
                            fontColor1: CustomColors.mediumGrey,
                            text2: '- Rs 1200.00',
                            fontColor2: CustomColors.buttonGreen,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                CustomTextBtn(
                  onPressed: () {
                    setState(() {
                      _couponController.clear();
                      _coupon = null;
                    });
                    CustomSnackBar.showCustomSnackBar(
                        context, 'Coupon Removed!',
                        backgroundColor: CustomColors.errorColor);
                  },
                  text: 'Remove Offer',
                  textColor: CustomColors.buttonGreen,
                  fontSize: 15.sp,
                ),
                Container(
                  width: size.width,
                  height: 2,
                  color: CustomColors.grey.withOpacity(0.4),
                ),
                SizedBox(height: 10.h),
                InvoiceTextWidget(
                  text1: 'Total payable amount',
                  fontSize1: 15.sp,
                  text2: 'Rs 1,59,800.60',
                  fontColor2: CustomColors.buttonGreen,
                  fontSize2: 15.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.text(
                  text: 'Make payment with',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                Column(
                  children: [
                    _buildRadioButtonRow(
                        image: ImageConstant.creditCard,
                        text: 'Credit Card or Debit Card',
                        isSelected: 0),
                    const Divider(),
                    _buildRadioButtonRow(
                        image: ImageConstant.upi,
                        text: 'UPI ID',
                        isSelected: 1),
                    const Divider(),
                    _buildRadioButtonRow(
                        image: ImageConstant.netBanking,
                        text: 'Net Banking',
                        isSelected: 2),
                    const Divider(),
                    _buildRadioButtonRow(
                        image: ImageConstant.upiApps,
                        text: 'UPI Apps',
                        isSelected: 3),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.text(
                  text: 'Cancellation Policy',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ExpandableTextWidget(
                  text:
                      'Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate.Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate.',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  textColor: CustomColors.mediumBlack,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.text(
                  text: 'Terms & Conditions',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ExpandableTextWidget(
                  text:
                      '•  Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate.Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate.',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  textColor: CustomColors.mediumBlack,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 6.0,
              )
            ]),
            child: Column(
              children: [
                CheckboxListTile(
                  activeColor: CustomColors.buttonGreen,
                  checkColor: Colors.white,
                  side: const BorderSide(color: CustomColors.liteBlack),
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: CustomText.text(
                      text:
                          'By selecting the button below, I agree to the OOHAPP terms & conditions, hoarding rules, customers and vendor rules and the OOHAPP refund policy can charge my payment method if I’m responsible for damage.',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: CustomColors.mediumBlack,
                      textAlign: TextAlign.start),
                  value: _isButtonEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                _isButtonEnabled
                    ? Column(
                        children: [
                          CustomButton(
                            text: 'Book',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    PaymentMethod.addCardDetails(
                                  context,
                                  _nameController,
                                  _cardController,
                                  _cardExpController,
                                  _cardCvvController,
                                  StatefulBuilder(
                                    builder: (BuildContext context,
                                            void Function(void Function())
                                                setState) =>
                                        Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ActionChip(
                                            label: CustomText.text(
                                              text: 'Debit Card',
                                              color: _selectedCardType == 0
                                                  ? Colors.white
                                                  : CustomColors.buttonGreen,
                                            ),
                                            avatar: Icon(
                                              _selectedCardType == 0
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off,
                                              color: _selectedCardType == 0
                                                  ? Colors.white
                                                  : CustomColors.buttonGreen,
                                            ),
                                            backgroundColor:
                                                _selectedCardType == 0
                                                    ? CustomColors.buttonGreen
                                                    : CustomColors.whiteColor,
                                            tooltip: 'Debit card selected',
                                            side: BorderSide(
                                                color: _selectedCardType == 0
                                                    ? Colors.transparent
                                                    : Colors.grey),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w,
                                                vertical: 10.h),
                                            onPressed: () {
                                              setState(() {
                                                _selectedCardType = 0;
                                              });
                                            }),
                                        ActionChip(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.w,
                                                vertical: 10.h),
                                            label: CustomText.text(
                                              text: 'Credit Card',
                                              color: _selectedCardType == 1
                                                  ? Colors.white
                                                  : CustomColors.buttonGreen,
                                            ),
                                            avatar: Icon(
                                              _selectedCardType == 1
                                                  ? Icons.radio_button_checked
                                                  : Icons.radio_button_off,
                                              color: _selectedCardType == 1
                                                  ? Colors.white
                                                  : CustomColors.buttonGreen,
                                            ),
                                            backgroundColor:
                                                _selectedCardType == 1
                                                    ? CustomColors.buttonGreen
                                                    : CustomColors.whiteColor,
                                            tooltip: 'Credit card selected',
                                            side: BorderSide(
                                                color: _selectedCardType == 1
                                                    ? Colors.transparent
                                                    : Colors.grey),
                                            onPressed: () {
                                              setState(() {
                                                _selectedCardType = 1;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                  () {
                                    CustomShowDialog.alertBox(
                                      barrierDismissible: false,
                                      context,
                                      Column(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SpinKitPouringHourGlass(
                                                color: CustomColors.buttonGreen,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              CustomText.text(
                                                text: 'Please Wait...',
                                                fontSize: 16.sp,
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              CustomText.text(
                                                text:
                                                    'Your transaction is processing...',
                                                color: CustomColors.mediumBlack,
                                                fontSize: 12.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );

                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      Navigator.of(context).pop();
                                      CustomShowDialog.alertBox(
                                        context,
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Lottie.asset(
                                              'assets/success.json',
                                              width: 120.w,
                                              height: 120.h,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            CustomText.text(
                                              text: 'Booking Completed',
                                              fontSize: 16.sp,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            CustomText.text(
                                              text:
                                                  'You’ll Get an Update when Vendor Accept your Order.',
                                              color: CustomColors.mediumBlack,
                                              textAlign: TextAlign.center,
                                              fontSize: 12.sp,
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomText.text(
                                                  text: 'Transaction Number:',
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                ),
                                                CustomText.text(
                                                  text: '123456456',
                                                  color:
                                                      CustomColors.buttonGreen,
                                                  fontSize: 12.sp,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            CustomButton(
                                              height: size.height * 0.03,
                                              width: size.width * 0.40,
                                              text: 'Go to Bookings',
                                              fontSize: 12.sp,
                                              onTap: () {
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    '/homepageBookingStatus',
                                                    arguments: 1);
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            CustomTextBtn(
                                                text: 'Close',
                                                onPressed: () {
                                                  Navigator.of(context)
                                                    ..pop()
                                                    ..pop();
                                                })
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 40.h,
                      ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildRadioButtonRow({
    required String image,
    required String text,
    required int isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 28.h,
            width: 28.w,
          ),
          const SizedBox(width: 8.0),
          CustomText.text(text: text, fontSize: 15.sp),
          const Spacer(),
          Radio(
              value: isSelected,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              activeColor: CustomColors.buttonGreen,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return _selectedOption == isSelected
                    ? CustomColors.buttonGreen
                    : CustomColors.mediumBlack;
              })),
        ],
      ),
    );
  }
}
