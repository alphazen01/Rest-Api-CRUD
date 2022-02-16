import 'package:demo/api_services.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  final String title;
  final String? id;
 UpdateScreen({ Key? key,required this.title,this.id}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final ApiServices apiServices=ApiServices();
   TextEditingController? _titleEditingController;
  @override
  void initState() {
     _titleEditingController=TextEditingController(text: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Upadate Task Title"),
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
                    apiServices.updateAlbum(widget.title, widget.id);
                   }, 
                   child: Text("Update")
                  ),
                  SizedBox(height: 25,),
                  
                 
              ],
            ),
          ),
        ),
      );
  }
}