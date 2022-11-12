class TransactionModel {
  String name;
  String photo;
  String info;
  String path;

  TransactionModel(this.name, this.photo, this.info, this.path);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
        item['name']!, item['photo']!, item['info']!, item['path']!))
    .toList();

var transactionData = [
  {
    "name": "My Organizations",
    "photo": "assets/organization-icon.png",
    "info": "Members: 2",
    "path": "org"
  },
  {
    "name": "Check Location",
    "photo": "assets/LocationCheck-icon.png",
    "info": "MapScreen()",
    "path": "loc"
  },
  {
    "name": "My Schedule",
    "photo": "assets/schedule-icon.png",
    "info": "Hours Logged: 2",
    "path": "sched"
  }
];
