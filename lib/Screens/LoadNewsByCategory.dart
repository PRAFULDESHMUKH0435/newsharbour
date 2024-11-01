import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsharbour/Constants/ReUsableNewsContainer.dart';
import 'package:newsharbour/model/datamodel.dart';

class LoadNewsByCategory extends StatefulWidget {
  final String endpinturl;
  final String Title;

  const LoadNewsByCategory({
    super.key,
    required this.endpinturl,
    required this.Title,
  });

  @override
  State<LoadNewsByCategory> createState() => _LoadNewsByCategoryState();
}

class _LoadNewsByCategoryState extends State<LoadNewsByCategory> {
  List<DataModel> newsdatalist = [];

  @override
  void initState() {
    super.initState();
    print("Received Label Is ${widget.endpinturl}");
  }

  Future<List<DataModel>> LoadAllNewsData(String endpoints) async {
    newsdatalist.clear();
    print("Inside LoadNewsData");
    dynamic data;
    try {
      final response = await http.get(Uri.parse(endpoints));
      data = jsonDecode(response.body)['articles'];
      print("Data Is $data");
      print("Data Size Is ${data.toString().length}");
      for (dynamic item in data) {
        DataModel dataModel = DataModel(
          Author: item['author'],
          title: item['title'] ?? "null",
          description: item['description'] ?? "null",
          url: item['url'] ?? "null",
          urltoimage: item['urlToImage'] ?? "null",
          content: item['content'],
        );
        newsdatalist.add(dataModel);
      }
    } catch (e) {
      throw "Error Occured $e";
    }

    print("NewsDataList Is $newsdatalist");
    return newsdatalist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.Title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      ),
      body: FutureBuilder<List<DataModel>>(
        future: LoadAllNewsData(widget.endpinturl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final eachdatamodel = snapshot.data![index];
                  debugPrint("Each DataModel Is $eachdatamodel");
                  return ReUsableNewsContainer(
                    url: eachdatamodel.url ?? '',             // Provide a default value if null
                    imageurl: eachdatamodel.urltoimage ?? '',
                    title: eachdatamodel.title ?? 'No Title',
                    description: eachdatamodel.description ?? 'No Description',
                  );
                },
              );
            } else {
              return Center(child: const Text("No data available"));
            }
          } else {
            return Center(child: const Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
