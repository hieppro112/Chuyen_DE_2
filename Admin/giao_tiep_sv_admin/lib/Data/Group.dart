import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Group{
  final String id;
  final String name;
  final String description;
  final Map<String,String> created_by;
  final bool approval_mode;
  final String avt;
   final int type_group;

  Group({required this.id, required this.name, required this.description, required this.created_by, required this.approval_mode, required this.avt, required this.type_group});


Map<String, dynamic> tomap(){
  return {
    'id':id,
    "name":name,
    "description":description,
    'created_by':created_by,
    "approval_mode":approval_mode,
    'avt':avt,
    'type_group':type_group
  };
}

// tao group
  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      created_by: Map<String, String>.from(map['created_by'] ?? []),
      approval_mode: map['approval_mode'] ?? false,
      avt: map['avt'] ?? '',
      type_group: map['type_group'] ?? 0,
    );
  }

}