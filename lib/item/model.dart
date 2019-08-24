class Item {
  final int id;
  final String name;
  final String description;
  final String thumbImageUrl;
  final String largeImageUrl;
  final int price;
  final bool isNew;

  Item.fromJson(Map<String, dynamic> json):
      id = json["id"],
      name = json["name"],
      description = json["description"],
      thumbImageUrl = json["thumbImageUrl"],
      largeImageUrl = json["largeImageUrl"],
      price = json["price"],
      isNew = json["isNew"];
}

class ListItem {
  final List<Item> listItem;
  final int page;
  final int totalPages;
  final int totalRecords;

  ListItem.fromJson(Map<String, dynamic> json):
      listItem = List.from(json["listItem"].map((item) => Item.fromJson(item))),
      page = json["page"],
      totalPages = json["totalPages"],
      totalRecords = json["totalRecords"];
}