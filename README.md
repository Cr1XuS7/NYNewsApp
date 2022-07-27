I was asked to code a program that receives data through an api and displays them to the user. 
The data displayed is the most viewed articles of the New York Times Magazine in the past day.

How i managed to solve this challenge :

I implemented a table view with a prototype cell at first.
After coding all the necessary parts to show the prototype cell in a tableview, I started working on my network manager.
My network manager takes in the data in json format decodes it into a format that is pleasant for the user.
This was done by doing a class with the same names as the json format and implementing the properties we want the decoder to decode.
When we got the decoder to print the appropriate data in the console, it was time to think how i will show the data in my tableview.
The way i did it was create a cell that would be used repeatedly in my tableview and each one of them would present a different news.
i created a touch class with a .xib file and designed my cell, then coded it to show the data gotten from the network manager and the api.

Now that my data is shown in a nice way, it was time give the app some functionality. 
When the user clicks on the news, it should take him to the actual article on the NYNews website.
I was told SwiftUI and webview are not allowed, so external browsers were not a choice. 
I had to implement an internal browser within the app to show the url corresponding to the news selected by the user.
The way i did it was using SFSafariServices. 
I was able to open a safari browser within the app to show the appropriate news.
I used MVC architecture to solve this.

Now that my main functionalities were done, i had to do the finishing touches on the design and my app would be done.

I also added a handler, which gives an alert if you run the app without an internet connection, it will show that you have to connect to the internet for the app to work.
