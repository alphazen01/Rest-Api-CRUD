import 'package:demo/api_services.dart';
import 'package:demo/custom_card.dart';
import 'package:demo/update.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices=ApiServices();
  var _titleEditingController=TextEditingController();


List tasks=[];

getData()async{
 tasks=await apiServices.getAlbum();

}
@override
  void initState() {
    getData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest Api CRUD"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 TextField(
                  controller: _titleEditingController,
                   onTap: (){
                   },
                   decoration: InputDecoration(
                     
                     hintText: "Enter Task Title",
                    
                     labelText: "Task Title",
                    
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                          color: Colors.grey.shade300,
                         width: 2
                       ),
                       borderRadius: BorderRadius.circular(20)
                     ),
                     focusedBorder:OutlineInputBorder(
                       borderSide:BorderSide(
                         color: Colors.blue,
                         width: 2
                       ),
                       borderRadius: BorderRadius.circular(20) 
                       ), 
                       prefixIcon: Icon(Icons.person,
                       color: Colors.orange
                       ),
                   ),
                 ),
                 ElevatedButton(
                   onPressed: (){
                     var title=_titleEditingController.text;
                     apiServices.sendAlbum(title);
                   }, 
                   child: Text("Save")
                  ),
                  SizedBox(height: 25,),
                  ...tasks.map((task){
                    return  CustomCard(
                       title:task["title"] ,
                      updateFunction: (){
                        Route route=MaterialPageRoute(
                        builder: (_)=>UpdateScreen(
                          title:task["title"] ,id: task["id"].toString(),));
                          Navigator.push(context, route);
                      },
                      deleteFunction: (){
                        apiServices.deleteAlbum(task["id"],);
                      },
                   
                  );
                  })
                 
              ],
            ),
          ),
        ),
      );
  }
}

