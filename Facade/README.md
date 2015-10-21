# Scenario

#### While working on a Private Home Theater System.

## Client's requirement:

Remote-Controlled: `Amplifier` `Tuner` `Screen` `Popper` `CdPlayer` `DvdPlayer` `Projector` `Lights`

*You decided to take up this challenge and make use of the _Singgle Responsibility Principle_*

> Which states that :point_right: Every object should have a single responsibility, and that responsibility should be entirely encapsulated by the class.

---
###### A *Complex* implementation after applying the SR principle.
![theater details](https://cloud.githubusercontent.com/assets/10561168/10583399/52ca1516-76aa-11e5-8a4f-544fe2f4aae3.PNG)

---
## Client's reaction
 
![ Capture ](https://cloud.githubusercontent.com/assets/10561168/10583075/9b2fb240-76a8-11e5-8d8f-b0be9bde7cfc.PNG)

How to break such a Complex System without breaking it's functionality?
---
# [Facade]() -
> The facade pattern is a design pattern that is used to simplify access to functionality in complex or poorly designed subsystems. The facade class provides a simple, single-class interface that hides the implementation details of the underlying code.

![](http://images.cnblogs.com/cnblogs_com/zhenyulu/Pic90.gif)

* *Subsystems*: The complex set of Single Responsibility objects.
* *Facade Methods*: The Higher Level abstract methods that subsystems.

---
#### Goal: To create simplest Facade Methods.

##### Solution:
1. watch-movie
   * Popcorn: ON
   * Light: DIM
   * Screen: Down
   *  Projection: ON
   *  Mode: MOVIE
   *  Amplifier: ON
   *  Mode: SURROUND_SOUND
   *  Volume: MEDIUM
   *  Dvd: ON
   *  Play: ON
2. end-movie
  * Everything: OFF
  * Light: ON

###### Implementation:
```ruby
  def watch_movie(movie)
    @popper.on
    @lights.dim
    @screen.down
    @projector.on
    @projector.widescreen
    @amp.on
    @amp.set_surround_sound
    @amp.volume = 5
    @dvd_player.on
    @dvd_player.play(movie)
  end
```
```ruby
  def end_movie
    @popper.off
    @lights.on
    @screen.up
    @projector.off
    @amp.off
    @dvd_player.off
  end
```

See the Test Suite to learn more ...

![ image ](http://image.slidesharecdn.com/designpatternsjoomla-100603035605-phpapp01/95/design-patterns-illustrated-29-1024.jpg?cb=1275584513)