import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/src/components.dart';
import 'package:veegil_accessment/src/screens.dart';
import 'package:veegil_accessment/src/utils.dart';
import 'package:veegil_accessment/view_model/trx_view_model.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {


  @override
  void didChangeDependencies() {
    ref.watch(trxViewModel).getTransactions();
    super.didChangeDependencies();
  }

  List<Tab> tabs = <Tab>[
    const Tab(text: 'All'),
    const Tab(text: 'Deposit'),
    const Tab(text: 'Withdrawals'),
  ];
  @override
  Widget build(BuildContext context) {
    var provider =  ref.watch(trxViewModel);
    return  provider.isGettingData ? Scaffold(
      body: Center(child:
      SizedBox(
          height: 700.h,
          child: const Center(child: CircularProgressIndicator())),),
    ): Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        // The Builder widget is used to have a different BuildContext to access
        // closest DefaultTabController.
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const TextView(text: "Balance"),
                  TextView(text: "NGN ${UtilFunctions.formatAmount(double.parse((provider.acctBalance!.balance ?? 0 ).toString()))}", fontSize: 30, fontWeight: FontWeight.bold,),
                ],
              ),
              bottom: TabBar(
                tabs: tabs,
              ),
            ),
            body: const TabBarView(
              children: [
                AllTransactionsScreen(),
                DepositTransactionsScreen(),
                WithdrawalTransactionsScreen(),
              ]
            ),
          );
        }),
      ),
    );
  }

}
