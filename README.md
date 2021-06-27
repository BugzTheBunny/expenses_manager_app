# flutterc2

- This is the second application that is created via [Aacdemind Flutter & Dart course](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/)

- Creating an expenses app (Will see the expenses of the past week).

## **Notes to self during this part**:
- When using `Cross Axis`, they act as the opposite direction,
for example if we use a row, the cross axis is down.
    - `[X]` Add a photo after pushed to git. 
- `Syntax`:
    - in the following code, we are creating a map of widgets, using mapping for each transaction, each transaction will be turned into a widget, meaning in the end, the `children` of the `Column` are getting a list of widgets.
    ```
    Column(
        children: transactions.map((tx) {
            return Card(
              child: Text(tx.title),
            );
          }).toList()
        )
    ```