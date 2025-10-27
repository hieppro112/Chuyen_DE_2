import 'package:flutter/material.dart';

class memberUyQuyen extends StatefulWidget {
  final void Function()? onSelected;
  const memberUyQuyen({super.key, this.onSelected});

  @override
  State<memberUyQuyen> createState() => memberUyQuyenState();
}

class memberUyQuyenState extends State<memberUyQuyen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget customMember(){
    return Container(
      child: Row(
        
      ),
    );
  }
}