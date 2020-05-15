import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflixy/models/genre_model.dart';
import 'package:tflixy/util/colors.dart';

class MultiSelectChip extends StatefulWidget{

  final AsyncSnapshot<List<Genre>> snapshot;
  final Function(int id) onSelectionChanged;
  const MultiSelectChip({
    Key key,
    this.snapshot,
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip>{

  int selectedChoice;
  

  @override
  Widget build(BuildContext context) {
    return _buildChoiceList();

  }
  _buildChoiceList(){
    List<Widget> choices = List();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: widget.snapshot.data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx,id){
        return Container(
          padding: EdgeInsets.all(2.0),
          child: ChoiceChip(
            pressElevation: 1.0,
            backgroundColor: Colors.black26,
            selectedColor: mYankeeBlue,
            label: Text(
              widget.snapshot.data[id].name,
              style: Theme.of(context).textTheme.subtitle,
            ),
            selected: selectedChoice == widget.snapshot.data[id].id,
            onSelected: (selected){
              setState(() {
                selectedChoice = widget.snapshot.data[id].id;
                widget.onSelectionChanged(selectedChoice);
              });
            },
          ),
        );
      },
    );
  }

}