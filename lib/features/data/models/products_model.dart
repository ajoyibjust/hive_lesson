import 'dart:convert';

ProductsModel productsModelFromMap(String str) =>
    ProductsModel.fromMap(json.decode(str));

String productsModelToMap(ProductsModel data) => json.encode(data.toMap());

class ProductsModel {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  ProductsModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  ProductsModel copyWith({
    List<Datum>? data,
    Links? links,
    Meta? meta,
  }) =>
      ProductsModel(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        links: Links.fromMap(json["links"]),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "links": links.toMap(),
        "meta": meta.toMap(),
      };
}

class Datum {
  final int id;
  final String nameUz;
  final String nameCrl;
  final String nameRu;
  final String color;
  final String price;
  final int qty;
  final int discountedPrice;
  final String discount;
  final String? discountType;
  final String? discountStart;
  final String? discountEnd;
  final String descriptionUz;
  final String descriptionCrl;
  final String descriptionRu;
  final int categoryId;
  final int brandId;
  final List<Image2> images;
  final List<Attribute> attributes;

  Datum({
    required this.id,
    required this.nameUz,
    required this.nameCrl,
    required this.nameRu,
    required this.color,
    required this.price,
    required this.qty,
    required this.discountedPrice,
    required this.discount,
    required this.discountType,
    required this.discountStart,
    required this.discountEnd,
    required this.descriptionUz,
    required this.descriptionCrl,
    required this.descriptionRu,
    required this.categoryId,
    required this.brandId,
    required this.images,
    required this.attributes,
  });

  Datum copyWith({
    int? id,
    String? nameUz,
    String? nameCrl,
    String? nameRu,
    String? color,
    String? price,
    int? qty,
    int? discountedPrice,
    String? discount,
    String? discountType,
    String? discountStart,
    String? discountEnd,
    String? descriptionUz,
    String? descriptionCrl,
    String? descriptionRu,
    int? categoryId,
    int? brandId,
    List<Image2>? images,
    List<Attribute>? attributes,
  }) =>
      Datum(
        id: id ?? this.id,
        nameUz: nameUz ?? this.nameUz,
        nameCrl: nameCrl ?? this.nameCrl,
        nameRu: nameRu ?? this.nameRu,
        color: color ?? this.color,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        discountStart: discountStart ?? this.discountStart,
        discountEnd: discountEnd ?? this.discountEnd,
        descriptionUz: descriptionUz ?? this.descriptionUz,
        descriptionCrl: descriptionCrl ?? this.descriptionCrl,
        descriptionRu: descriptionRu ?? this.descriptionRu,
        categoryId: categoryId ?? this.categoryId,
        brandId: brandId ?? this.brandId,
        images: images ?? this.images,
        attributes: attributes ?? this.attributes,
      );

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nameUz: json["name_uz"],
        nameCrl: json["name_crl"],
        nameRu: json["name_ru"],
        color: json["color"],
        price: json["price"],
        qty: json["qty"],
        discountedPrice: json["discounted_price"],
        discount: json["discount"],
        discountType: json["discount_type"],
        discountStart: json["discount_start"],
        discountEnd: json["discount_end"],
        descriptionUz: json["description_uz"],
        descriptionCrl: json["description_crl"],
        descriptionRu: json["description_ru"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        images: List<Image2>.from(json["images"].map((x) => Image2.fromMap(x))),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name_uz": nameUz,
        "name_crl": nameCrl,
        "name_ru": nameRu,
        "color": color,
        "price": price,
        "qty": qty,
        "discounted_price": discountedPrice,
        "discount": discount,
        "discount_type": discountType,
        "discount_start": discountStart,
        "discount_end": discountEnd,
        "description_uz": descriptionUz,
        "description_crl": descriptionCrl,
        "description_ru": descriptionRu,
        "category_id": categoryId,
        "brand_id": brandId,
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toMap())),
      };
}

class Attribute {
  final int id;
  final String nameUz;
  final String nameCrl;
  final String nameRu;
  final String valueUz;
  final String valueCrl;
  final String valueRu;

  Attribute({
    required this.id,
    required this.nameUz,
    required this.nameCrl,
    required this.nameRu,
    required this.valueUz,
    required this.valueCrl,
    required this.valueRu,
  });

  Attribute copyWith({
    int? id,
    String? nameUz,
    String? nameCrl,
    String? nameRu,
    String? valueUz,
    String? valueCrl,
    String? valueRu,
  }) =>
      Attribute(
        id: id ?? this.id,
        nameUz: nameUz ?? this.nameUz,
        nameCrl: nameCrl ?? this.nameCrl,
        nameRu: nameRu ?? this.nameRu,
        valueUz: valueUz ?? this.valueUz,
        valueCrl: valueCrl ?? this.valueCrl,
        valueRu: valueRu ?? this.valueRu,
      );

  factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        nameUz: json["name_uz"],
        nameCrl: json["name_crl"],
        nameRu: json["name_ru"],
        valueUz: json["value_uz"],
        valueCrl: json["value_crl"],
        valueRu: json["value_ru"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name_uz": nameUz,
        "name_crl": nameCrl,
        "name_ru": nameRu,
        "value_uz": valueUz,
        "value_crl": valueCrl,
        "value_ru": valueRu,
      };
}

class Image2 {
  final int id;
  final String image;

  Image2({
    required this.id,
    required this.image,
  });

  Image2 copyWith({
    int? id,
    String? image,
  }) =>
      Image2(
        id: id ?? this.id,
        image: image ?? this.image,
      );

  factory Image2.fromMap(Map<String, dynamic> json) => Image2(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
      };
}

class Links {
  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    dynamic next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toMap() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<Link> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Link>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        links: links ?? this.links,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
