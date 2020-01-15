import 'package:flutter/material.dart';
import 'Bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    //context: Identifies a particullar widget in the hierarchy and containd wifget's size and location.
    //Context can refer to its parents widget context as well.
    //(context.inheritFromWidgetOfExactType(Provider) as Provider).bloc
    // this function is deprecated.
    //Basically it finds its parent of type provider as the exact type of the parent is 'InheritedWidget' so
    // it will be cast down as provider.
    //Instead of this function i m using the function below.
    // It is a way of accessing bloc from a arbitrarily rooted element in the widget tree.
    return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
  }
}

/*
1. Pick one widget from hierarchy 
2. Create instance of bloc
3. Provide access to bloc to choosen widget

BuildContext: Identifies a particullar widget in the hierarchy. It may assumed as widget id .
Any context may look up or refer to its parent context at any level.
context.inheritFromWidgetOfExactType(Provider) function finds the parent widget which is of type 'Provider'
*/
