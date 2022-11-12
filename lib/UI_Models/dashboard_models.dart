class TransactionModel {
  String name;
  String photo;
  String info;

  TransactionModel(this.name, this.photo, this.info);
}

List<TransactionModel> transactions = transactionData
    .map((item) =>
        TransactionModel(item['name']!, item['photo']!, item['info']!))
    .toList();

var transactionData = [
  {
    "name": "My Organizations",
    "photo": "assets/organization-icon.png",
    "info": "Members: 2"
  },
  {
    "name": "Check Location",
    "photo": "assets/LocationCheck-icon.png",
    "info": ""
  },
  {
    "name": "My Schedule",
    "photo": "assets/schedule-icon.png",
    "info": "Hours Logged: 2"
  }
];
