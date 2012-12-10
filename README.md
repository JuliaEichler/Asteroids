###Project
The project reinterpreted the good, old Asteroids game and turned it into a collaborative experience. It required 4 users to operate the controllers. Further information can be found on [http://juliaeichler.de/2012/05/all-for-one-one-for-all/](http://juliaeichler.de/2012/05/all-for-one-one-for-all/).

###Hardware
3 Arduino boards: two Arduinos sending the controllers' input via XBees wirelessly and another Arduino via wire to the computer running the Asteroids game.
The computer is connected to a projector to display the game onto a wall.
(see detailed sketch on my website)

###Files
Each of the Arduino_ folders contain the code that was uploaded on the respective Arduino board.
The Processing_Asteroids_Game.pde (in the Processing_ folder) ran on the computer that received the data from the Arduinos and was connected to a projector to display the game.

*Arduino version* 1.0.1

*Processing version* 1.5.1