import 'package:flutter/material.dart';
import 'package:sun_tec_lb/models/category.dart';
import 'package:sun_tec_lb/repositories/category_repository.dart';
import 'package:sun_tec_lb/views/category_products.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  late List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent.shade100,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _categoryRepository.getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot){
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(64, 75, 96, .9),
                strokeWidth: 2.0,
              ),
            );
          }
          categories.isEmpty? categories = snapshot.data! : null;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CategoryProducts(productCategoryId: categories[index].catId, title: categories[index].catName)));
                },
                child: Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: const Color.fromRGBO(64, 75, 96, .9), borderRadius: BorderRadius.circular(5)),
                    child: makeListTile(categories[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  ListTile makeListTile(Category category){
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24))),
        child: Image.network(
            category.catImage.isEmpty ? "http://via.placeholder.com/350x150" : "https://suntec-lb.com/" + category.catImage
        ),
      ),
      title: Text(
        category.catName,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
    );
  }

}