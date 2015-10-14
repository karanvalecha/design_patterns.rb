Scenario
Boss:- We have a new program of Duck Simulation.

Dev:- OK, I will design it.

tada....

  class Duck{

    swim()
    display()
    quack()

  }

Override the display method in every object...


Boss:- The 'model duck' quacks, You call it a design?

Dev:- Ok.. I will make the quack() able to override with new object.


Boss:- I need a fly method.

Dev:- class Duck{ fly();}// I am a OO genius*


Boss:- What kind of a Dev you are, The 'Rubber Duck' object flies away.

Dev:- I will make this method forced to be override too.


Boss:- I need more kind of 'Duck' objects and You should be start searching for new job.


The Problem: Design is not Re-usable!

  Our Goal: To be agile ready, Fit the things at their correct places.
  We will be taking the advantage of OOP by using Polymorphism and Encapsulation.

The Strategy Pattern:
  Defines a family of algorithms,
  encapsulates each one, and makes them interchangeable.
  Strategy lets the algorithm vary independently from
  clients that use it.
