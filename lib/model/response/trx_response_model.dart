/// type : "credit"
/// amount : 9000
/// phoneNumber : "08100177435"
/// created : "2021-03-30T15:40:15.012Z"

class TrxResponseModel {
  TrxResponseModel({
      this.type, 
      this.amount, 
      this.phoneNumber, 
      this.created,});

  TrxResponseModel.fromJson(dynamic json) {
    type = json['type'];
    amount = json['amount'];
    phoneNumber = json['phoneNumber'];
    created = json['created'];
  }
  String? type;
  num? amount;
  String? phoneNumber;
  String? created;
TrxResponseModel copyWith({  String? type,
  num? amount,
  String? phoneNumber,
  String? created,
}) => TrxResponseModel(  type: type ?? this.type,
  amount: amount ?? this.amount,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  created: created ?? this.created,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['amount'] = amount;
    map['phoneNumber'] = phoneNumber;
    map['created'] = created;
    return map;
  }

}