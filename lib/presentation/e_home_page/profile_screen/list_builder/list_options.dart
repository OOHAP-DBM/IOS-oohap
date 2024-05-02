import '../../../../core/app_export.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({super.key});

  final List<Map<String, dynamic>> profileMenuComponents = [
    {
      'icon': Icons.paste_sharp,
      'title': 'My Bookings',
    },
    {
      'icon': Icons.task,
      'title': 'POS',
    },
    {
      'icon': Icons.group_sharp,
      'title': 'My Staff',
    },
    {
      'icon': Icons.currency_rupee_sharp,
      'title': 'Payments',
    },
    {
      'icon': Icons.calendar_today,
      'title': 'Appointments',
    },
    {
      'icon': Icons.subscriptions_sharp,
      'title': 'Subscriptions',
    },
    {
      'icon': Icons.discount_sharp,
      'title': 'Coupon Management',
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
    },
    {
      'icon': Icons.logout_sharp,
      'title': 'Logout',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                const Icon(Icons.paste),
                const SizedBox(
                  width: 15.0,
                ),
                CustomText.headlineText(
                  text: "$index",
                ),
              ],
            ),
            subtitle:  SizedBox(
              width: size.width,
              child: const Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Divider(),
              ),
            ),
          );
        },
      ),
    );
  }
}
