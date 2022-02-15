import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
   CustomCard({
    Key? key,required this.title
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
              onPressed: (){}, 
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
              onPressed: (){}, 
              icon: Icon(Icons.delete,color: Colors.red,)
            ),
          ],
        ),
      ),
    );
  }
}