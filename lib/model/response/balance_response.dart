/// phoneNumber : "08100177435"
/// balance : 5500
/// created : "2023-12-04T18:55:12.219Z"

class BalanceResponse {
  BalanceResponse({
      this.phoneNumber, 
      this.balance, 
      this.created,});

  BalanceResponse.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
    balance = json['balance'];
    created = json['created'];
  }
  String? phoneNumber;
  num? balance;
  String? created;
BalanceResponse copyWith({  String? phoneNumber,
  num? balance,
  String? created,
}) => BalanceResponse(  phoneNumber: phoneNumber ?? this.phoneNumber,
  balance: balance ?? this.balance,
  created: created ?? this.created,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['balance'] = balance;
    map['created'] = created;
    return map;
  }

}