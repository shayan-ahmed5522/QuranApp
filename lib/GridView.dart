import 'package:flutter/material.dart';

class gridView extends StatefulWidget {
   gridView({super.key});

  @override
  State<gridView> createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
List<String> itemList = List.generate(20, (index) => 'item ${index+1}');
List<String> tempList = [];

void deleteValue(index){
  late String deletedvalue = itemList.removeAt(index);
  tempList.add(deletedvalue);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index){
              return Dismissible(
                onDismissed: (direction){
                  setState(() {
                    deleteValue(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('item is removed'),
                      action: SnackBarAction(
                          label: 'undo',
                          onPressed: () {
                            setState(() {
                              late String regenerated = tempList.last;
                              itemList.insert(index, regenerated);
                            });
                          }

                      ),
                      ),
                  );
                },
                key: Key(itemList[index]),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.delete,color: Colors.white),
                ),
                child: Card(
                  color: Colors.blueGrey,
                  child: Center(child: Text('This is Item ${itemList[index]}')),
                ),
              );
          },
      ),
    );
  }
}
////
// GridView(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3,
// mainAxisSpacing: 5,
// crossAxisSpacing: 2,
// childAspectRatio: 1,
// ),
// children: [
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// Card(
// color: Colors.greenAccent,
// child: Text('This is green card'),
// ),
// ],
// ),
// secon way for grid view'difference is that simple grid view has deligate this has no deligate'
// GridView.count(
// crossAxisCount: 2,
// mainAxisSpacing: 30,
// crossAxisSpacing: 30,
// children: [
//
// ],
// ),