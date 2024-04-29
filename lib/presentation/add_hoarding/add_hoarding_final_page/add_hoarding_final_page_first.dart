import 'package:oohapp/all_cubit_folder/final_add_hoarding_first_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_first_page/form.dart';

import 'package:oohapp/core/waste_work/validator_regex.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_check_button.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_description_textfield.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_dialog.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_slider_button.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_small_button.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

import '../../../core/app_export.dart';
import 'widgets/custom_tag_selector_textfield.dart';

class FinalAddHoardingFirstPage extends StatefulWidget {
  const FinalAddHoardingFirstPage({super.key});

  @override
  State<FinalAddHoardingFirstPage> createState() =>
      _FinalAddHoardingFirstPageState();
}

class _FinalAddHoardingFirstPageState extends State<FinalAddHoardingFirstPage> {
  String? selectedButton;


  TextEditingController categoryController = TextEditingController();
  TextEditingController hoardingtitleController = TextEditingController();
  TextEditingController hoardingdescriptionController = TextEditingController();
  TextEditingController measurementController = TextEditingController();
  TextEditingController hoardingwidthController = TextEditingController();
  TextEditingController hoardingheightController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> options = [
      'Metro view',
      'Bridge view',
      'Left side road',
      'Right side road'
    ];

    return BlocBuilder<FinalFirstAddHoardingScreenCubit, FinalFirstAddHoardingFirstFormState>(
      builder: (context, state) {
        final cubit=context.read<FinalFirstAddHoardingScreenCubit>();
        return Scaffold(
          appBar:  CustomAppBar(
            title: 'Add Hoarding',
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16,bottom: 16),
              child: Form(
                key: cubit.finalfirstaddhoardingFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.headlineText(text: 'Hoarding Details'),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText.calloutText(
                      text: 'Select Hoarding Type*',
                      color: CustomColors.blackColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSmallButton(
                            width: size.width * 0.45,
                            onTap: () {
                              setState(() {
                                selectedButton = 'OOH Hoarding';
                              });
                            },
                            iconOnTap: () {
                              showCustomDialog(
                                context,
                                'What is OOH Hoarding',
                                'OOH Hoardings is a type of Non-digital Hoardings.',
                                ImageConstant.hoarding,
                              );
                            },
                            text: 'OOH Hoarding',
                            backgroundColor: selectedButton == 'OOH Hoarding'
                                ? Colors.green
                                : Colors.white,
                            textColor: Colors.black,
                          ),
                          CustomSmallButton(
                            width: size.width * 0.45,
                            onTap: () {
                              setState(() {
                                selectedButton = 'DOOH Hoarding';
                              });
                            },
                            iconOnTap: () {
                              showCustomDialog(
                                context,
                                'What is DOOH Hoarding',
                                'DOOH Hoarding is a type of Digital Hoardings.',
                                ImageConstant.hoarding,
                              );
                            },
                            text: 'DOOH Hoarding',
                            backgroundColor: selectedButton == 'DOOH Hoarding'
                                ? Colors.green
                                : Colors.white,
                            textColor: Colors.black,
                          ),
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldSelector(
                      onChanged: (value){
                        cubit.onChangedcategories(value);
                      },
                      validator: (value)=>ValidatorRegex.dropdownValidator(value),
                      placeholder: 'Categories*',
                      hintText: 'choose category',
                      choices: const [
                        'Unipole',
                        'Billboard',
                        'Wall wrap',
                        'Pole kiosk',
                        'Digital screen',
                        'LED',
                        'Public utility',
                        'Metro bridge panel',
                        'Door branding',
                        'Flag sign',
                        'Foot over bridge',
                        'ACP board'
                      ],
                      choiceImages: {
                          'Unipole':ImageConstant.displayicon,
                        'Billboard':ImageConstant.displayicon,
                        'Wall wrap':ImageConstant.displayicon,
                        'Pole kiosk':ImageConstant.displayicon,
                        'Digital screen':ImageConstant.displayicon,
                        'LED':ImageConstant.displayicon,
                        'Public utility':ImageConstant.displayicon,
                        'Metro bridge panel':ImageConstant.displayicon,
                        'Door branding':ImageConstant.displayicon,
                        'Flag sign':ImageConstant.displayicon,
                        'Foot over bridge':ImageConstant.displayicon,
                        'ACP board':ImageConstant.displayicon,
                      },
                      controller: categoryController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      placeholder: 'Hoarding Title',
                      requiredSign: true,
                      hintText: 'Enter title',
                      maxLength: 34,
                      onChanged: (value){
                        cubit.onChangedhaordingtitle(value);
                      },
                      validator: (value)=>ValidatorRegex.hoardingtitleValidator(value),
                      controller: hoardingtitleController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDescriptionTextFormField(
                      height: size.height * 0.40,
                     requiredsign: true,
                     onChanged: (value){
                      cubit.onChangedhaordingdescription(value);
                     },
                     validator: (value)=>ValidatorRegex.hoardingdescriptionValidator(value),
                      placeholder: 'Hoarding description',
                      hintText: 'write description',
                      maxLength: 34,
                      showCharacterCount: true,
                      controller: hoardingdescriptionController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      requiredSign: true,
                      onChanged: (value){
                        cubit.onChangedmeasurementlength(value);
                      },
                      validator: (value)=>ValidatorRegex.measurementlengthValidator(value),
                      placeholder: 'Measurement ln',
                      hintText: 'Sq.ft',
                      controller: measurementController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextFormField(
                          requiredSign: true,
                          onChanged: (value){
                            cubit.onChangedhoardingwidth(value);
                          },
                          validator: (value)=>ValidatorRegex.hoardingwidthValidator(value),

                          placeholder: 'Hoarding Width',
                          hintText: 'Enter width',
                          width: size.width * 0.45,
                          keyboardType: TextInputType.number,
                          controller: hoardingwidthController,
                        ),
                        CustomTextFormField(
                          placeholder: 'Hoarding Height',
                          requiredSign: true,
                          onChanged: (value){
                            cubit.onChangedhoardingheight(value);
                          },
                          validator: (value)=>ValidatorRegex.hoardingheightValidator(value),
                          hintText: 'Enter height',
                          width: size.width * 0.45,
                          keyboardType: TextInputType.number,
                          controller: hoardingheightController,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      placeholder: 'Size Preview',
                      hintText: 'e.g. 10×20sq.ft',
                      controller: sizeController,
                      newColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSliderButton(title: 'Approved from nagar nigam'),
                          SizedBox(height: 20),
                          CustomSliderButton(title: 'Backlighting'),
                          SizedBox(height: 20),
                          CustomSliderButton(
                              title: 'Printing & Mounting service'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomTextFormField(
                      placeholder: 'People Football',
                      hintText: 'Enter in Number',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TagsInputField(
                      labelText: 'Target Audience',
                      initialTags: [
                        'Students',
                        'Foodies',
                        'Public',
                        'average class'
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomText.secondaryTitle(
                        text: 'Hoarding Visibility', color: Colors.black),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: options.map((title) {
                        return CustomCheckboxTile(
                          title: title,
                          onChanged: (bool value) {
                            print('$title is now: $value');
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onTap: () {
                      if(state.isfirstfinalhoardingvalid&&selectedButton!=null){
                          NavigateUtils.pushNamed(
                            context, Routes.finalsecondaddhoardingScreeen);
                      }else{

                      }
                      },
                      text: 'Save & Finish',
                      backgroundColor: (state.isfirstfinalhoardingvalid&&selectedButton!=null)
                          ? const Color(0xFF282C3E):const Color(0xFFDDDDDD),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
