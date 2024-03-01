import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Surah> surahList = List.generate(114, (index) => Surah(index+1));
  List<Surah> favrouteSurah = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favrouteSurah.length,
                  itemBuilder: (BuildContext context,int index){
                    final surah = favrouteSurah[index];
                    return Padding(
                        padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.greenAccent,
                      child: Text(surah.surahNumber.toString()),
                    ),
                    );
                  }

              ),
          Divider(thickness: 3,),
          Expanded(
              child: ListView.builder(
                  itemCount: surahList.length,
                  itemBuilder: (BuildContext context,int index){
                    final surahIndex = surahList[index];
                    return ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Surah no is: ${surahIndex.surahNumber}',style: TextStyle(fontSize: 20),),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Surah no is: ${surahIndex.surahNumber}',style: TextStyle(fontSize: 10),),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: (){
                        setState(() {
                          if(favrouteSurah.contains(surahIndex)){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('This surah already exists')),
                            );
                          }
                          else{
                            favrouteSurah.add(surahIndex);
                          }
                        });
                      },
                    );
                  }),
          ),
        ],
      ),
    );
  }
}
class Surah{
  final int surahNumber;
  final String surahName;
  Surah(this.surahNumber, {this.surahName = ''});
}
