import 'package:new_app/model/categorymodel.dart';

List<CategoryModel>? getCategories() {
  List<CategoryModel> categories = [];

  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1449748040579-354c191a7934?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  categories.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1535131749006-b7f58c99034b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  categories.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  categories.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  categories.add(categoryModel);
  return categories;
}
