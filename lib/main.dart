// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class SuperListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Super List App'),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, this.subtitle, this.date);
  final String title;
  final String subtitle;
  final String date;

}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry('Title 1','Subtitle','Date'),
  new Entry('Title 2','Subtitle','Date'),
  new Entry('Title 3','Subtitle','Date'),
  new Entry('Title 4','Subtitle','Date'),
  new Entry('Title 5','Subtitle','Date'),
  new Entry('Title 6','Subtitle','Date'),
  new Entry('Title 7','Subtitle','Date'),
  new Entry('Title 8','Subtitle','Date'),
  new Entry('Title 9','Subtitle','Date'),
  new Entry('Title 10','Subtitle','Date'),
  new Entry('Title 11','Subtitle','Date'),
  new Entry('Title 12','Subtitle','Date'),
  new Entry('Title 13','Subtitle','Date'),
  new Entry('Title 14','Subtitle','Date'),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {

      return new Container(
        padding: const EdgeInsets.all(9.0),
        margin: const EdgeInsets.all(9.0),
        color: const Color(0xFFCCE3FF),
        child: new Row(
          children: [
            new Container(
              margin: const EdgeInsets.all(10.0),
              color: const Color(0xFF00FF00),
              width: 100.0,
              height: 100.0,
              child: new FittedBox(
                  fit: BoxFit.fitHeight,
                  child: new Image.asset('assets/logo.png')
              ),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      root.title,
                      style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Container(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: new Text(
                    root.subtitle,
                    style: new TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  ),
                  new Text(
                    root.date,
                    style: new TextStyle(
                      color: Colors.black87,
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

void main() {
  runApp(new SuperListApp());
}