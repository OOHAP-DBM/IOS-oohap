import 'package:oohapp/all_cubit_folder/additional_ui_second_hoarding/cubit.dart';
import 'package:oohapp/all_cubit_folder/additional_ui_second_hoarding/form.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_first_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_second_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_second_page/form.dart';
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';
import 'package:oohapp/core/constants/waste/cubit.dart';
import 'package:oohapp/core/waste_work/validator_regex.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/add_hoarding_final_second_page/widgets/custom_slider_button_new.dart';

import '../../../../core/app_export.dart';

class FinalAddHoardingSecondPage extends StatefulWidget {
  FinalAddHoardingSecondPage({super.key});

  @override
  State<FinalAddHoardingSecondPage> createState() =>
      _FinalAddHoardingSecondPageState();
}

class _FinalAddHoardingSecondPageState
    extends State<FinalAddHoardingSecondPage> {
  Map<String, GlobalKey<FormState>> formKeys = {
    'weekly': GlobalKey<FormState>(),
    'monthly': GlobalKey<FormState>(),
    'yearly': GlobalKey<FormState>(),
  };

  bool showByWeeklyUI = false;
  bool showByMonthlyUI = false;
  bool showByYearlyUI = false;
  TextEditingController basepriceController = TextEditingController();
  TextEditingController printingController = TextEditingController();
  TextEditingController mountingController = TextEditingController();
  TextEditingController designingController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController igstController = TextEditingController();
  TextEditingController totalpricewithtaxController = TextEditingController();
  TextEditingController discounttypeController = TextEditingController();
  TextEditingController discountpercentageController = TextEditingController();
  TextEditingController discountedpriceController = TextEditingController();

  bool isValidForm() {
    final cubit = context.read<FinalSecondAddHoardingScreenCubit>();
    final additionalCubit =
        context.read<FinalAddHoardingAdditionalScreenCubit>();
    return cubit.state.issecondpricevalid && additionalCubit.state.istaxvalid;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FinalSecondAddHoardingScreenCubit>(
          create: (context) => FinalSecondAddHoardingScreenCubit(),
        ),
      ],
      child: BlocBuilder<FinalSecondAddHoardingScreenCubit,
          FinalSecondAddHoardingFormState>(
        builder: (context, state) {
          final cubit = context.read<FinalSecondAddHoardingScreenCubit>();
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Business Details',
              centerTitle: true,
              elevation: 1,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircularButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: CustomColors.grey,
                  borderColor: CustomColors.transparent,
                  icon: Icons.arrow_back,
                  iconColor: CustomColors.blackColor,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(16.0),
                child: Form(
                  key: cubit.finalsecondaddhoardingFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.secondaryTitle(
                        text: 'Add Hoarding',
                        color: CustomColors.blackColor,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Pricing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF282C3E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        requiredSign: true,
                        onChanged: (value) {
                          cubit.onChangedsetbaseprice(value);
                        },
                        validator: (value) =>
                            ValidatorRegex.basepricevalidator(value),
                        placeholder: 'Set Base Price',
                        hintText: '₹',
                        keyboardType: TextInputType.number,
                        controller: basepriceController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        requiredSign: true,
                        placeholder: 'Printing Charges',
                        hintText: '₹',
                        keyboardType: TextInputType.number,
                        controller: printingController,
                        onChanged: (value) {
                          cubit.onChangedpricingcharge(value);
                        },
                        validator: (value) =>
                            ValidatorRegex.pricingchargevalidator(value),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        requiredSign: true,
                        placeholder: 'Mounting Charges',
                        hintText: '₹',
                        keyboardType: TextInputType.number,
                        controller: mountingController,
                        onChanged: (value) {
                          cubit.onChangedmountingcharges(value);
                        },
                        validator: (value) =>
                            ValidatorRegex.mountingchargevalidator(value),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        requiredSign: true,
                        placeholder: 'Designing Charges',
                        hintText: '₹',
                        keyboardType: TextInputType.number,
                        controller: designingController,
                        onChanged: (value) {
                          cubit.onChangeddesigningcharge(value);
                        },
                        validator: (value) =>
                            ValidatorRegex.designingchargevalidator(value),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      NewCustomSliderButton(
                        title: 'By Weekly',
                        initialValue: showByWeeklyUI,
                        onToggle: (isOn) {
                          setState(() {
                            showByWeeklyUI = isOn;
                          });
                        },
                      ),
                      if (showByWeeklyUI) _buildAdditionalUI('weekly'),
                      const SizedBox(
                        height: 16,
                      ),
                      NewCustomSliderButton(
                        title: 'By Monthly',
                        initialValue: showByMonthlyUI,
                        onToggle: (isOn) {
                          setState(() {
                            showByMonthlyUI = isOn;
                          });
                        },
                      ),
                      if (showByMonthlyUI) _buildAdditionalUI('monthly'),
                      const SizedBox(
                        height: 16,
                      ),
                      NewCustomSliderButton(
                        title: 'By Yearly',
                        initialValue: showByYearlyUI,
                        onToggle: (isOn) {
                          setState(() {
                            showByYearlyUI = isOn;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (showByYearlyUI) _buildAdditionalUI('yearly'),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomButton(
                          onTap: () {
                            NavigateUtils.pushNamed(
                                context, Routes.uploadimagehoardingpage);
                            // if (showByMonthlyUI ||
                            //     showByWeeklyUI ||
                            //     showByYearlyUI) {
                            //   if (isValidForm()) {
                            //     NavigateUtils.pushNamed(
                            //         context, Routes.uploadimagehoardingpage);
                            //   } else {}
                            // } else if (state.issecondpricevalid) {
                            //   NavigateUtils.pushNamedReplacement(
                            //       context, Routes.uploadimagehoardingpage);
                            // } else {
                            //   SnackBar(content: Text('we have error'));
                            // }
                          },
                          text: 'Continue',
                          backgroundColor: (showByMonthlyUI ||
                                  showByWeeklyUI ||
                                  showByYearlyUI)
                              ? (isValidForm())
                                  ? const Color(0xFF282C3E)
                                  : const Color(0xFFDDDDDD)
                              : (state.issecondpricevalid)
                                  ? const Color(0xFF282C3E)
                                  : const Color(0xFFDDDDDD))
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

  Widget _buildAdditionalUI(String type) {
    Widget additionalWidget;
    switch (type) {
      case 'weekly':
        additionalWidget = _buildAdditional('weekly');
        break;
      case 'monthly':
        additionalWidget = _buildAdditional('monthly');
        break;
      case 'yearly':
        additionalWidget = _buildAdditional('yearly');
        break;
      default:
        additionalWidget = Container();
        break;
    }
    return additionalWidget;
  }

  Widget _buildAdditional(String type) {
    final GlobalKey<FormState> formKey = formKeys[type]!;

    return BlocBuilder<FinalAddHoardingAdditionalScreenCubit,
        AdditionUISecondHoardingFormState>(
      builder: (context, state) {
        final cubit = context.read<FinalAddHoardingAdditionalScreenCubit>();
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: gstController,
                requiredSign: true,
                placeholder: 'GST(%)',
                hintText: '18%',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  cubit.onChangedgst(value);
                },
                validator: (value) => ValidatorRegex.gstValidator(value),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: igstController,
                keyboardType: TextInputType.number,
                requiredSign: true,
                placeholder: 'IGST(%)',
                hintText: '18%',
                onChanged: (value) {
                  cubit.onChangedigst(value);
                },
                validator: (value) => ValidatorRegex.igstValidator(value),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: totalpricewithtaxController,
                keyboardType: TextInputType.number,
                requiredSign: true,
                placeholder: 'Total Price with Tax',
                hintText: '₹ 2,36,611',
                newColor: const Color(0xFFFFB753),
                onChanged: (value) {
                  cubit.onChangedtotalpricewithtax(value);
                },
                validator: (value) =>
                    ValidatorRegex.totalpricewithtaxValidator(value),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: discounttypeController,
                requiredSign: true,
                placeholder: 'Discount Type',
                hintText: 'Amount',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  cubit.onChangeddiscounttype(value);
                },
                validator: (value) =>
                    ValidatorRegex.discounttypeValidator(value),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: discountpercentageController,
                keyboardType: TextInputType.number,
                requiredSign: true,
                placeholder: 'Discount Percentage/Amount',
                hintText: '₹ 40,111',
                onChanged: (value) {
                  cubit.onChangeddiscountpercentage(value);
                },
                validator: (value) =>
                    ValidatorRegex.discountpercentageamountValidator(value),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: discountedpriceController,
                keyboardType: TextInputType.number,
                requiredSign: true,
                placeholder: 'Discounted Price',
                hintText: '₹ 36,000',
                newColor: const Color(0xFFFFB753),
                onChanged: (value) {
                  cubit.onChangeddiscountprice(value);
                },
                validator: (value) =>
                    ValidatorRegex.discountedpriceValidator(value),
              )
            ],
          ),
        );
      },
    );
  }
}
