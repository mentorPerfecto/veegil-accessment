import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/src/components.dart';
import 'package:veegil_accessment/utils/alerts.dart';
import 'package:veegil_accessment/utils/enums.dart';
import 'package:veegil_accessment/view/components/trx_item_design.dart';
import 'package:veegil_accessment/view_model/trx_view_model.dart';

class DepositTransactionsScreen extends ConsumerStatefulWidget {
  const DepositTransactionsScreen({super.key});

  @override
  ConsumerState<DepositTransactionsScreen> createState() => _DepositTransactionsScreenState();
}

class _DepositTransactionsScreenState extends ConsumerState<DepositTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(trxViewModel);
    var transactions = provider.trxList.where((element) => element.type =='credit').toList();
    return Scaffold(
      body:  SizedBox(
        height:transactions.isEmpty ? 350.h : double.parse((transactions.length * 70).toString()),
        width: MediaQuery.of(context).size.width,

        ///color: Colors.red,
        child: transactions.isEmpty
            ? SizedBox(
          height: 600.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView( text:
              "No  History", fontWeight:  FontWeight.w300, fontSize: 12.sp
              ),
            ],
          ),
        )
            :
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return TrxItemDesign(trxResponseModel: transactions[index],);
          },
          itemCount:transactions.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        displayModalNavBar(context, WalletAction.deposit, ref);
      }, child: const Icon(Icons.add),),
    );
  }
}


