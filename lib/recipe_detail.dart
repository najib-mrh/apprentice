import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe rr;

  const RecipeDetail({
    Key? key,
    required this.rr,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {

  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rr.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.rr.imageUrl),
              ),
            ),
            SizedBox(height: 4,),
            Text(widget.rr.label,
            style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: widget.rr.ingredients.length,
                  padding: EdgeInsets.all(7.0),
                    itemBuilder: (BuildContext context, int index){
                      final ingredient = widget.rr.ingredients[index];
                      return Text(
                          "${ingredient.quantity*_sliderVal} ${ingredient.measure} ${ingredient.name}"


                      );
              
            })),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_sliderVal * widget.rr.servings} servings',

              value: _sliderVal.toDouble(),
              onChanged: (newValue){
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.white,

            ),
          ],
        ),
      ),
    );
  }
}


