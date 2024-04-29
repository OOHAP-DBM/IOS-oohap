import 'dart:io';

import 'package:oohapp/all_cubit_folder/second_add_haording/cubit.dart';
import 'package:oohapp/all_cubit_folder/second_add_haording/form.dart';

import 'package:oohapp/core/waste_work/validator_regex.dart';
import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/widget/text_field_selector.dart';

import 'package:oohapp/widgets/document_uploader/document_uploader_widget.dart';
import 'package:oohapp/widgets/textfield_with_suffixtext/interactive_textfield.dart';

import '../../../core/app_export.dart';
import '../../../widgets/dropdown_textfield/dropdown_selector.dart';

class SecondAddHoardingPage extends StatefulWidget {
  const SecondAddHoardingPage({super.key});

  @override
  State<SecondAddHoardingPage> createState() => _SecondAddHoardingPageState();
}

class _SecondAddHoardingPageState extends State<SecondAddHoardingPage> {
  void showIFSCFinder(BuildContext context) {
    // TextEditingController bankController = TextEditingController();
    // TextEditingController stateController = TextEditingController();
    // TextEditingController cityController = TextEditingController();
    // TextEditingController branchController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText.secondaryTitle(
                    text: 'Find IFSC Code', color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldIFSCSelector(
                  requiredsign: true,
               
                  // controller: bankController,
                  hintText: 'choose bank',
                  choices: ['HDFC', 'SBI', 'CANARA BANK'],

                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldIFSCSelector(
                  requiredsign: true,
                  // controller: stateController,
                  hintText: 'choose state',
                  choices: ['UP', 'Rajasthan', 'MP'],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldIFSCSelector(
                  requiredsign: true,
                  // controller: cityController,
                  hintText: 'choose city',
                  choices: ['Lucknow', 'Kanpur', 'Delhi'],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldIFSCSelector(
                  // controller: branchController,
                  requiredsign: true,
                  hintText: 'choose branch',
                  choices: ['gomtinagar', 'pahadganj', 'raniganj'],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'cancel',
                          style: TextStyle(
                            color: Color(0xFF282C3E),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                          width: 128,
                          height: 46,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: 'Save',
                          backgroundColor: const Color(0xFF282C3E)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  File? selectedFile;

  void handleFileSelection(File file) {
    setState(() {
      selectedFile = file;
    });

    // Here you could also upload the file or do other processing
  }

  TextEditingController banknameController = TextEditingController();
  TextEditingController accountholdernameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondHoardingScreenCubit, SecondHoardingFormState>(
      builder: (context, state) {
        final cubit = context.read<SecondHoardingScreenCubit>();
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
                key: cubit.secondaddhoardingFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.secondaryTitle(
                      text: 'Bank Account Details ',
                      color: CustomColors.blackColor,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomText.calloutText(
                      text:
                          'For a successful bank verification, account name must match with the registered GSTIN name',
                      color: CustomColors.blackColor,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 7),
                    CustomTextFieldSelector(
                      controller: banknameController,
                      requiredSign: true,
                      placeholder: 'Bank Name',
                      // maxLength: 15,
                      // keyboardType: TextInputType.number,
                      hintText: "choose bank name ",
                      choices: ['SBI', 'HDFC', 'RBI', 'KOTAK MAHINDAR'],
                      onChanged: (value) {
                        cubit.onChangedbankname(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: accountholdernameController,
                      requiredSign: true,
                      placeholder: 'Account Holder Name',
                      // maxLength: 15,
                      keyboardType: TextInputType.name,
                      hintText: "Enter account holder name",
                      onChanged: (value) {
                        cubit.onChangedaccountholdername(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.accountholdernameValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: accountController,
                      requiredSign: true,
                      placeholder: 'Account Number',
                      // maxLength: 15,
                      keyboardType: TextInputType.phone,
                      hintText: "Enter Account Number",
                      onChanged: (value) {
                        cubit.onChangedaccountnumber(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.accountnumberValidator(value),
                    ),
                    NewCustomTextFormField(
                      requiredsign: true,
                      controller: ifsccodeController,
                      placeholder: 'IFSC Code',
                      hintText: "Enter IFSC Code",
                      lasttext: 'Find IFSC code',
                      onPressed: () => showIFSCFinder(context),
                      onChanged: (value) {
                        cubit.onChangedifsc(value);
                      },
                      validator: (value) => ValidatorRegex.ifscValidator(value),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText.secondaryTitle(
                      text: 'Lets’s add Business PAN ',
                      color: CustomColors.blackColor,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomText.calloutText(
                      text:
                          "Business’s PAN card should clearly show Business’s detail on the front, and shouldn't be blurry.",
                      color: CustomColors.blackColor,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditableImageUpload(
                      title: 'upload PAN',
                      allowedExtensions: ['PNG', 'JPG', 'PDF'],
                      onFileSelected: handleFileSelection,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                        if (state.issecondvalid && selectedFile != null) {
                          NavigateUtils.pushNamedReplacement(
                              context, Routes.gettingstartedfirstScreen);
                        } else {}
                      },
                      text: 'Save & Finish',
                      backgroundColor:
                          (selectedFile != null && state.issecondvalid)
                              ? const Color(0xFF282C3E)
                              : const Color(0xFFDDDDDD),
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
