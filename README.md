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

---- 
## Adding text input widget
- placeholder on text example- 
```
TextField(decoration: InputDecoration(labelText: 'Amount'),),
```
- Elevated Button style - (It has `ElevatedButton.styleFrom()`)
```
ElevatedButton(
  onPressed: () {},
  child: Text('Add Transaction'),
  style: ElevatedButton.styleFrom(
    primary: Colors.deepPurpleAccent
    ),
  )
```
---- 
## Fetching user input

- `Stateless` - Techinically you can change the data, but it wont be reflected on the user interface, the data is immutable.
  - It does not have `setState()`
- Text inputs are always stings, need to cast if we want a number.
- Best practice for inputs - using controllers.
  ```
  final titleController = TextEditingController();
  ...
  TextField(
    decoration: InputDecoration(labelText: 'Item'),
    controller: titleController,
  ),
  ```

---- 
## Splitting into widgets.
  - What should be `stateless` and what should be `statefull`:
  
      As we do want to see changes, but we dont want to lose performance, we update the WIDGETS of the widgets tree, and not the entire tree.
      meaning, if we set the main widget as a statefull, we will have it updated everytime, and the performance will be horrible.

      if we update the widgets, for example in this app we will update the transactions list at first, we will have more modularity, and better performance, due the fact that only this widget is updated, and not the entire app.

---- 
## Splitting into widgets.
 - There are a few types of scrollable, for example `SingleChildScrollView()` - but there are better alternatives sometime, for a example for a list of views, we can use `ListViews()`

----
## Using ListViews!
  - `ListView(children:[])` - This is good for short lists, it load ALL of the list, if there is a super long list, this will break performance, because it load all of the items, even if they are not on the screen, DONT use this if the list is long, or not defined by length.

  - `ListView.builder()` - This one is good for infinit / long lists, it renders only what is visible, meaning this wont user memmory and wont drop performance, also it removes the items that are outof the scope of the gui, *NOT IMMIDIATLY* but after you get a bit distanced from that item, and it has more optimization.
    - `itemBuilder:` takes 2 arguments:
      - The context (data of the page, flutter knows how to get it by itself)
      - The index of the data
    - `itemCount:` takes the lenght of the data.

----
## Further input modifications.
  - You can change the keyboard type by using:
  ```
  TextField(
    decoration: InputDecoration(labelText: 'Amount'),
    controller: amountController,
    keyboardType: TextInputType.number, <= This thing changes the keyboard
    onSubmitted: (_) => submitData(), <= This is called whenever we submit the text.
  ),
  ```
  - get `N` amount of decimal numbers after a number - `.amount.toStringAsFixed(N)`

----
## Appbar + Floating Action button.

  - `Appbar` takes `actions[]` argument, which allows to add Widgets over there, in theory, any widget can be added, but the better option is for icon buttons.
  - `FloatActionButton` is a hovering button, in Scaffold (i assume in other tempaltes also, you can place the button anywhere, for example)
    ```
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    ```
    will put it at the bottom in the center, something like a dock, from there the name `centerDockerd`

----
## Making the adding item a widget which will pop up.
  - becuase the popup of the widget should get called from different places, we need a function which will handle the widget calling, to use is across, and because in this application we want to use data, we need to pass context over there, so we can work with the data.
  - we add `ShowModalBottomSheet(context:context,builder:(bContext){}`) inside the function that will pop up the menu.
    - this takes context, and a function for the builder, which will return the widget we need.
    the builder takes also a context as a parameter, at this point, still not using it, will be explained after.
  - inside the function of the builder, we call the function we want, at this app `NewTransaction` was stateless, so now we change it to statefull, because the NewTransaction need to get a function, meaning it has a parameter we need to use inside to change something.
  

----
## Themes!
  - `MaterialApp()` takes 'theme:' parameter, which needs `ThemeData()` object, in which we can define global themes for the app.
    Cool params:
    - `primarySwatch:` unlike primary, it takes a color, and generates colors with different shades. 
----
## Adding a chart!
