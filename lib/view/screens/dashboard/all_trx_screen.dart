import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veegil_accessment/src/components.dart';
import 'package:veegil_accessment/view/components/trx_item_design.dart';
import 'package:veegil_accessment/view_model/trx_view_model.dart';

class AllTransactionsScreen extends ConsumerStatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  ConsumerState<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends ConsumerState<AllTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(trxViewModel);
    var transactions = provider.trxList;
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
    );
  }
}
