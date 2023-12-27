import 'package:apiauthjwtdemo/models/productmodel.dart';
import 'package:apiauthjwtdemo/models/usermodel.dart';
import 'package:apiauthjwtdemo/services/product_service.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final UserModel? user;
  const HomePage({super.key,this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductService _productService=ProductService();

  @override
  void initState() {
   _productService.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi ${widget.user!.username}"),
      ),

      body:FutureBuilder(
        future: _productService.getAllProducts(),
        builder: (context,snapshot){

          if(snapshot.hasData){
         final ProductModel productmodel=snapshot.data!;
          final products=productmodel.products;
            return ListView.builder(
                itemCount: products!.length,
                itemBuilder: (context,index){

              final product=products![index];

              return Card(
                child: ListTile(
                  title: Text(
                    "${product.title}"
                
                  ),
                  subtitle:  Text(
                    "${product.price}"
                
                ),
                
                ),
              );
            });
          }

          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
