import 'package:flutter/material.dart';
import 'package:flutter_apprentice/recipe.dart';
import 'package:flutter_apprentice/recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.grey,
          secondary: Colors.black
        )


      ),

      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SafeArea(

        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder:(BuildContext, int index){


            return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                       return RecipeDetail(rr: Recipe.samples[index],);
                      }
                  )
                  );
                },
                child: buildRecipeCard(Recipe.samples[index])
                  );
              }
        ),
      ),

    );
  }

}


Widget buildRecipeCard(Recipe zz) {
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),


    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image(image: AssetImage(zz.imageUrl)),

          SizedBox(height: 14.0,),
          Text(zz.label,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontFamily: 'Palatino',
          ),
          )
        ],
      ),
    ),
  );
}
