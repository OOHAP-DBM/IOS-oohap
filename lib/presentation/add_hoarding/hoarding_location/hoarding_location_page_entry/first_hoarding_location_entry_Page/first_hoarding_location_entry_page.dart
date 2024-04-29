
import 'package:oohapp/all_cubit_folder/first_location_entry_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/first_location_entry_page/form.dart';

import 'package:oohapp/core/waste_work/validator_regex.dart';

import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

import '../../../../../core/app_export.dart';

class FirstHoardingLocationEntryPage extends StatefulWidget {
  const FirstHoardingLocationEntryPage({super.key});

  @override
  State<FirstHoardingLocationEntryPage> createState() =>
      _FirstHoardingLocationEntryPageState();
}

class _FirstHoardingLocationEntryPageState
    extends State<FirstHoardingLocationEntryPage> {
         TextEditingController hoardingaddressController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController landmarkController = TextEditingController();
    TextEditingController latitudeController = TextEditingController();
    TextEditingController longitudeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
 

    return BlocBuilder<LocationEntryScreenCubit, FirstLocationEntryFormState>(
      builder: (context, state) {
        final cubit=context.read<LocationEntryScreenCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Add Hoarding',
            centerTitle: true,
            elevation: 1,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.3, right: 16, left: 16,bottom: 16),
              child: Form(
                key: cubit.firstlocationentryFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hoarding Location',
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
                      controller: hoardingaddressController,
                      requiredSign: true,
                      placeholder: 'Hoarding Address',
                      maxLength: 10,
                      //  keyboardType: TextInputType.none,
                      hintText: 'Gomti Nagar',
                onChanged: (value){
                  cubit.onChangedhoardingaddress(value);
                },
                validator: (value)=>ValidatorRegex.hoardingaddressValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: pincodeController,
                      requiredSign: true,
                      placeholder: 'Pincode',
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      hintText: '226010',
                     onChanged: (value){
                      cubit.onChangedhoardingpincode(value);
                     },
                     validator: (value)=>ValidatorRegex.pincodeValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldSelector(
                      controller: cityController,
                      requiredSign: true,
                      placeholder: 'City',
                      choices: ['Lucknow', 'kanpur', 'varanasi', 'delhi'],
                      hintText: 'Lucknow',
                     onChanged: (value){
                      cubit.onChangedcity(value);
                     },
                     validator: (value)=>ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldSelector(
                      controller: stateController,
                      requiredSign: true,
                      placeholder: 'State',
                      choices: ['Bihar', 'Up', 'delhi', 'dehradun'],
                      hintText: 'uttar pradesh',
                    onChanged: (value){
                      cubit.onChangedstate(value);
                    },
                  validator: (value)=>ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldSelector(
                      controller: countryController,
                      requiredSign: true,
                      placeholder: 'Country',
                      choices: ['India', 'Pakistan', 'Russia', 'Afghanistan'],
                      hintText: 'India',
                   onChanged: (value){
                    cubit.onChangedcountry(value);
                   },
                                validator: (value)=>ValidatorRegex.dropdownValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: landmarkController,
                      requiredSign: true,
                      placeholder: 'Landmark',
                      //  maxLength: 10,
                      //  keyboardType: TextInputType.number,
                      hintText: 'puppy car point',
                    onChanged: (value){
                      cubit.onChangedlandmnark(value);
                    },
                    validator: (value)=>ValidatorRegex.landmarkValidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: latitudeController,
                      requiredSign: true,
                      placeholder: 'Latitude',
                      maxLength: 10,
                      // keyboardType: TextInputType.streetAddress,
                      hintText: '10.012.0211.2',
                     onChanged: (value){
                      cubit.onChangedlatitude(value);
                     },
                     validator: (value)=>ValidatorRegex.latitudevalidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: longitudeController,
                      requiredSign: true,
                      placeholder: 'Longitude',
                      maxLength: 10,
                      hintText: '10.012.0211.2',
                     onChanged: (value){
                      cubit.onChangedlongitude(value);
                     },
                     validator: (value)=>ValidatorRegex.longitudevalidator(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                        if (state.islocationvalid) {
                          NavigateUtils.pushNamed(
                              context, Routes.finalfirstaddhoardingScreen);
                        } else {}
                      },
                      text: 'Continue',
                      backgroundColor:state.islocationvalid
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
