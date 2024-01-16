import 'dart:io';


import 'package:oohapp/core/constants/waste/cubit.dart';

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
  void showIFSCFinder() {
    TextEditingController bankController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController branchController = TextEditingController();

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
            height: 500,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              boxShadow:const  [
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
                CustomTextFieldSelector(
                  // onDropdownChanged: (val) {
                  //   BlocProvider.of<IFSCFinderBloc>(context).add(
                  //       DropdownSelectionChanged(
                  //           bankController.text,
                  //           cityController.text,
                  //           stateController.text,
                  //           branchController.text));
                  // },
                  height: ScaleSize.height(8.5),
                  controller: bankController,
                  hintText: 'choose bank',
                  choices: ['HDFC', 'SBI', 'CANARA BANK'],
                ),
                const SizedBox(
                  height: 15,
                ),
                 CustomTextFieldSelector(
                       height: ScaleSize.height(8.5),
                  controller: stateController,
                  // onDropdownChanged: (val) {
                  //   BlocProvider.of<IFSCFinderBloc>(context).add(
                  //       DropdownSelectionChanged(
                  //           bankController.text,
                  //           cityController.text,
                  //           stateController.text,
                  //           branchController.text));
                  // },
                  hintText: 'choose state',
                  choices: ['UP', 'Rajasthan', 'MP'],
                ),
                const SizedBox(
                  height: 15,
                ),
                   CustomTextFieldSelector(
                       height: ScaleSize.height(8.5),
                  controller: cityController,
                  // onDropdownChanged: (val) {
                  //   BlocProvider.of<IFSCFinderBloc>(context).add(
                  //       DropdownSelectionChanged(
                  //           bankController.text,
                  //           cityController.text,
                  //           stateController.text,
                  //           branchController.text));
                  // },
                  hintText: 'choose city',
                  choices: ['Lucknow', 'Kanpur', 'Delhi'],
                ),
                const SizedBox(
                  height: 15,
                ),
                  CustomTextFieldSelector(
                  controller: branchController,
                  height: ScaleSize.height(8.5),
                  // onDropdownChanged: (val) {
                  //   BlocProvider.of<IFSCFinderBloc>(context).add(
                  //       DropdownSelectionChanged(
                  //           bankController.text,
                  //           cityController.text,
                  //           stateController.text,
                  //           branchController.text));
                  // },
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
                          backgroundColor: const Color(0xFF282C3E)
                          //  (state is IFSCFinderValidState)
                          //     ? Color(0xFFDDDDDD)
                          //     : Color(0xFF282C3E),
                          ),
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
    final formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Business Details',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onTap: () {
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
                    'For a successful bank verification, account name must\nmatch with the registered GSTIN name',
                color: CustomColors.blackColor,
              ),
              const SizedBox(height: 7),
              CustomTextFieldSelector(
                controller: banknameController,

                placeholder: 'Bank Name*',
                // maxLength: 15,
                // keyboardType: TextInputType.number,
                hintText: "choose bank name ",
                choices: ['SBI', 'HDFC', 'RBI', 'KOTAK MAHINDAR'],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: accountholdernameController,
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'bank name ', banknameController.text);
                },
                placeholder: 'Account Holder Name*',
                // maxLength: 15,
                keyboardType: TextInputType.name,
                hintText: "Enter account holder name",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: accountController,
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'account holder', accountholdernameController.text);
                },
                placeholder: 'Account Number*',
                // maxLength: 15,
                keyboardType: TextInputType.phone,
                hintText: "Enter Account Number",
              ),
              NewCustomTextFormField(
                controller: ifsccodeController,
                onChanged: (val) {
                  formValidationCubit.validateField(
                      'account number', accountController.text);
                },
                placeholder: 'IFSC Code*',
                hintText: "Enter IFSC Code",
                lasttext: 'Find IFSC code',
                onPressed: () => showIFSCFinder(),
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
                  if (formValidationCubit.isFormValid()) {
                    NavigateUtils.pushNamedReplacement(
                        context, Routes.gettingstartedfirstScreen);
                  } else {}
                },
                text: 'Save & Finish',
                backgroundColor: formValidationCubit.isFormValid()
                    ? const Color(0xFFDDDDDD)
                    : const Color(0xFF282C3E),
              )
            ],
          ),
        ),
      ),
    );
  }
}
