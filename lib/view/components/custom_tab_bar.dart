import '../../src/components.dart';

class CustomTabBar extends StatelessWidget {
  final List<Tab> tabs;
  const CustomTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.kNeutralFormFieldText,
                      width: 1.5.r,
                    ),
                  ),
                ),
              )),
          TabBar(
            tabs: tabs,
            labelColor: AppColors.kBlue,
            labelStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Campton',fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontSize: 14.0.sp, fontFamily: 'Campton', fontWeight: FontWeight.w500),
            unselectedLabelColor: AppColors.kNeutralFormFieldText, // Color when not s
            indicatorColor: AppColors.kBlue,

          ),
        ],
      ),
    ) ;
  }
}
