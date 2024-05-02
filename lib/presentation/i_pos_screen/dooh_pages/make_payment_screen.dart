
import '../../../core/app_export.dart';

class ChangeLocationScreen extends StatelessWidget {
  const ChangeLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
    /*  appBar: const NormalAppBar(
        //  leading: SizedBox.shrink(),
        title: 'Payment',
      ),*/
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            children: [

            ],
          )),
    );
  }
}
