class AccountModel {
  final int? accountId;
  final String? accountName;
  final String? accountCode;
  final String? accountDescription;

  AccountModel({
    this.accountId,
    this.accountName,
    this.accountCode,
    this.accountDescription,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      accountId: json["account_Id"],
      accountName: json["account_Name"],
      accountCode: json["account_Code"],
      accountDescription: json["account_Description"],
    );
  }
}
