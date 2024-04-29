import 'package:country_list/country_list.dart';
import 'package:oohapp/all_cubit_folder/first_add_hoarding/cubit.dart';
import 'package:oohapp/all_cubit_folder/first_add_hoarding/form.dart';
import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/core/constants/global_cubit/character_count_cubit.dart';

import 'package:oohapp/core/waste_work/validator_regex.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

class AddHoardingScreen extends StatefulWidget {
  const AddHoardingScreen({super.key});

  @override
  State<AddHoardingScreen> createState() => _AddHoardingScreenState();
}

class _AddHoardingScreenState extends State<AddHoardingScreen> {
 

  TextEditingController streetController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController businessnameController = TextEditingController();
  TextEditingController businesstypeController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
List<String> getAllCountryNames() {
  return Countries.list.map((Country country) => country.name).toList();
}


  @override
  Widget build(BuildContext context) {


    return BlocBuilder<AddHoardingScreenCubit, AddHoardingFormState>(
      builder: (context, state) {
        final cubit = context.read<AddHoardingScreenCubit>();
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
                key: cubit.firstAddhoardingFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    CustomTextFormField(
                      controller: gstinController,
                      requiredSign: true,
                      placeholder: 'GSTIN No',
                      // maxLength: 15,
                      keyboardType: TextInputType.number,
                      hintText: "Enter GSTIN No",
                      onChanged: (value) {
                        cubit.onChangedgstin(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.gstinnoValidator(value),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      requiredSign: true,
                      controller: businessnameController,
                      placeholder: 'Business Name',
                      // maxLength: 15,
                      keyboardType: TextInputType.name,
                      hintText: "Enter business name ",
                      onChanged: (value) {
                        cubit.onChangedbusinessname(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.businessnameValidator(value),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFieldSelector(
                      requiredSign: true,
                      
                      controller: businesstypeController,
                      placeholder: 'Business Type',
                      // maxLength: 15,
                      keyboardType: TextInputType.number,
                      hintText: "choose business type ",
                      choices: const [
                        'Sole proprietorship',
                        'Partnership',
                        'Limited liability company',
                        'Company',
                        'Private limited company',
                        'Limited liability partnership',
                        'Governmnent',
                        'Public Limited Company',
                        'Hindu joint company'
                      ],
                      validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                          onChanged: (value){
                            cubit.onChangedbusinessTypeDropdown(value);
                          },
                    ),
                    const SizedBox(
                      height: 15.0,
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
                      height: 7,
                    ),
                    CustomText.secondaryTitle(
                      text: 'Registered Business Address',
                      color: CustomColors.blackColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<CharacterCountCubit, int>(
                        builder: (context, characterCount) {
                      return CustomTextFormField(
                        requiredSign: true,
                        controller: streetController,
                        placeholder: 'Street Address',
                        keyboardType: TextInputType.name,
                        hintText: "Enter street address",
                        maxLength: 64,
                        showCharacterCount: true,
                        onChanged: (value) {
                          context
                              .read<CharacterCountCubit>()
                              .updateCharacterCount(value.length);
                          cubit.onChangedstreetaddress(value);
                        },
                        validator: (value) =>
                            ValidatorRegex.addressValidator(value),
                      );
                    }),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      requiredSign: true,
                      controller: pincodeController,
                      placeholder: 'Pincode',
                      keyboardType: TextInputType.name,
                      hintText: "Enter pincode",
                      maxLength: 64,
                      onChanged: (value) {
                        cubit.onChangedpincode(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.pincodeValidator(value),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFieldSelector(
                      requiredSign: true,
                      controller: cityController,
                      placeholder: 'City',

                      // maxLength: 15,
                      keyboardType: TextInputType.number,
                      hintText: "choose city",
                      choices: ['Lucknow', 'Kanpur', 'Delhi', 'Bikaner'],
                      onChanged: (value){
                        cubit.onChangedStateDropdown(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldSelector(
                      requiredSign: true,
                      controller: stateController,
                      placeholder: 'State',
                      // maxLength: 15,
                      keyboardType: TextInputType.number,
                      hintText: "choose state",
                      choices: ['UP', 'Delhi', 'Himachal Pradesh', 'Rajasthan'],
                      onChanged: (value){
                      cubit.onChangedStateDropdown(value);
                      },

                    validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldSelector(
                      requiredSign: true,
                      controller: countryController,
                      placeholder: 'Country',
                      // maxLength: 15,
                      keyboardType: TextInputType.number,
                      hintText: "choose country",
                      choices:getAllCountryNames(),
                  validator: (value) =>
                          ValidatorRegex.dropdownValidator(value),
                      onChanged: (value){
                        cubit.onChangedCountryDropdown(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                       
                          
                          if (state.ispagevalid) {
                            Navigator.pushNamed(
                                context, Routes.secondhoardingScreen);
                          }
                        else {
                         
                        }
                      },
                      text: 'Continue',
                      backgroundColor: state.ispagevalid
                          ? Color(0xFF282C3E)
                          : Color(0xFFDDDDDD),
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
