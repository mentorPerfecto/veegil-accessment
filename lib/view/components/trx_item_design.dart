import 'package:veegil_accessment/src/components.dart';
import 'package:veegil_accessment/src/models.dart';
import 'package:veegil_accessment/src/utils.dart';

class TrxItemDesign extends StatelessWidget {
  final TrxResponseModel trxResponseModel;

  const TrxItemDesign({super.key, required this.trxResponseModel});

  @override
  Widget build(BuildContext context) {
     return SizedBox( height: 70,
      child: Card(surfaceTintColor: Colors.white,
        child: ListTile(
          //minLeadingWidth: 50,
          title: TextView(
              text: trxResponseModel.phoneNumber.toString(),
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 12.sp, fontWeight: FontWeight.w500
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView( text: 'N ${UtilFunctions.formatAmount(double.parse(trxResponseModel.amount != null ? trxResponseModel.amount.toString() : '0'))}',
                  fontSize: 12.sp, fontWeight: FontWeight.w500
              ),
              TextView( text:  UtilFunctions.capitalizeAllWord(trxResponseModel.type.toString()),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,  color:  getColour(
                    trxResponseModel.type.toString().toLowerCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }


  getColour(status) {
    if (status.toString().toLowerCase() == "debit") {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
