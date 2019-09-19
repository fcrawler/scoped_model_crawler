import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_crawler/count_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	
	CountModel _countModel = CountModel();
	
	
	@override
	Widget build(BuildContext context) {
		return ScopedModel(
				model: _countModel,
				child: MaterialApp(
					title: 'Flutter Demo',
					theme: ThemeData(
						primarySwatch: Colors.blue,
					),
					home: MyHomePage(title: 'ScopedModel'),
				));
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);
	
	final String title;
	
	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	
	
	@override
	Widget build(BuildContext context) {
		return ScopedModelDescendant<CountModel>(
			builder: (context, child, model) {
				return Scaffold(
					appBar: AppBar(
						title: Text(widget.title),
					),
					body: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text(
									'You have pushed the button this many times:',
								),
								Text(model.count.toString()),
							],
						),
					),
					floatingActionButton: FloatingActionButton(
						onPressed: () => model.increment(),
						tooltip: 'Increment',
						child: Icon(Icons.add),
					), // This trailing comma makes auto-formatting nicer for build methods.
				);
			},
		);
	}
}
