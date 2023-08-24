import 'package:flutter/material.dart';

class MessageModel{
  final String message;
  DateTime createdAt;
  final String email;
  MessageModel({required this.message,required this.createdAt,required this.email});

  factory MessageModel.fromJson(dynamic json)=>MessageModel(message: json['message'],createdAt: json['createdAt'].toDate(),email: json['email']);
  Map<String,dynamic> toJson()=>{

    'message':message,
    'createdAt':createdAt,
    'email':email


  };







}