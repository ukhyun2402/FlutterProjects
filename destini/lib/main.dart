import 'package:flutter/material.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.

class StoryPage extends StatefulWidget {
  StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StroyPageState();
}

class _StroyPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO: Step 1 - Add background.png to this Container as a background image.
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                child: Text(
                  "Story text will go here.",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                child: Text(
                  "Choice 1",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: (() => {
                      //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    }),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
              //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
              child: ElevatedButton(
                child: Text(
                  "Choice 2",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: (() => {
                      //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                    }),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
