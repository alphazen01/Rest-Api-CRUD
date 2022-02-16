import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
   final VoidCallback? updateFunction;
   final VoidCallback? deleteFunction;
   CustomCard({
    Key? key,required this.title,this.updateFunction,this.deleteFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            IconButton(
              onPressed: updateFunction, 
              icon: Icon(Icons.edit,color: Colors.red,)
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text("$title"),
                  ],
                ),
              ),
            ),
             IconButton(
              onPressed: deleteFunction, 
              icon: Icon(Icons.delete,color: Colors.red,)
            ),
          ],
        ),
      ),
    );
  }
}