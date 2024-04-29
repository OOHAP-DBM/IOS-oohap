import '../../../core/app_export.dart';
import '../../../core/waste_work/validator_regex.dart';
import '../../../widgets/custom_appbar/detail_screen_app_bar.dart';
import '../../../widgets/custom_buttons/custom_text_btn.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_new_text_field.dart';
import '../../../widgets/custom_show_dialog.dart';

class ManagePermissionsScreen extends StatefulWidget {
  const ManagePermissionsScreen({super.key});

  @override
  State<ManagePermissionsScreen> createState() =>
      _ManagePermissionsScreenState();
}

class _ManagePermissionsScreenState extends State<ManagePermissionsScreen> {
  String? _selectedRole;
  final List<String> _roleList = ['Manager', 'Boss'];

  final List<List<bool>> _managePermissionCheckBox = List.generate(
    6,
    (index) => List.generate(5, (index) => false),
  );

  final TextEditingController _roleTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _roleTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        color: Colors.grey[200],
        height: size.height * 0.08,
        child: Center(
          child: CustomButton(
              width: size.width * 0.90,
              text: 'Save Permission',
              onTap: () {
                CustomSnackBar.showCustomSnackBar(context, 'Permission saved');
                Navigator.of(context).pop();
              }),
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: const DetailScreenAppBar(title: 'Manage Permission'),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.text(
                        text: 'Role',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    CustomTextBtn(
                        text: '+Add New Role',
                        textColor: Colors.blue,
                        fontSize: 13.5.sp,
                        onPressed: () {
                          CustomShowDialog.showTextField(
                              context,
                              Column(
                                children: [
                                  CustomNewTextFormField(
                                    controller: _roleTextController,
                                    hintText: 'Enter role name',
                                    maxLines: null,
                                    placeholder: 'Role',
                                    maxLength: 30,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CustomButton(
                                    onTap: () {
                                      String role = _roleTextController.text;
                                      if (role.isNotEmpty) {
                                        setState(() {
                                          _roleList.add(role);
                                        });
                                        CustomSnackBar.showCustomSnackBar(
                                            context, 'Role added successfully');
                                        Navigator.of(context).pop();
                                        _roleTextController.clear();
                                      } else {
                                        CustomSnackBar.showCustomSnackBar(
                                            context, 'Please enter role name');
                                        _roleTextController.clear();
                                      }
                                    },
                                    text: 'Add Role',
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextBtn(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      text: 'Cancel'),
                                ],
                              ));
                        }),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropdown(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  dropdownValue: _selectedRole,
                  // Set initial value
                  width: double.infinity,
                  hintText: 'Select  Role',
                  items: _roleList,
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value;
                    });
                  },
                  validator: (value) => ValidatorRegex.dropdownValidator(value),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomText.text(
                    text: 'Permission',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 40.h,
                color: const Color(0xFF282C3E),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 15.w),
                      CustomText.text(
                        text: 'PERMISSION',
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 15.w),
                      CustomText.text(
                        text: 'ALL',
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 15.w),
                      CustomText.text(
                        text: 'CREATE',
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 15.w),
                      CustomText.text(
                        text: 'READ',
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 15.w),
                      CustomText.text(
                        text: 'UPDATE',
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 15.w),
                      CustomText.text(
                        text: 'DELETE',
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 15.w),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 75.w,
                          child: CustomText.text(
                              text: getTextForIndex(index), fontSize: 14.sp),
                        ),
                        for (int i = 0; i < 5; i++)
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12.w,
                                ),
                                Checkbox(
                                  value: _managePermissionCheckBox[index][i],
                                  activeColor: const Color(0xFF282C3E),
                                  checkColor: Colors.white,
                                  side: const BorderSide(
                                      color: CustomColors.liteBlack),
                                  visualDensity: VisualDensity.comfortable,
                                  onChanged: (value) {
                                    setState(() {
                                      _managePermissionCheckBox[index][i] =
                                          value!;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      )),
    );
  }

  String getTextForIndex(int index) {
    switch (index) {
      case 0:
        return 'Booking';
      case 1:
        return 'Chatting';
      case 2:
        return 'Explore\nHoardings';
      case 3:
        return 'Manage\nStaff';
      case 4:
        return 'Manage\nHoarding';
      case 5:
        return 'Save\nHoardings';
      default:
        return '';
    }
  }
}
