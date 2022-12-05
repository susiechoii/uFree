# uFree

## Hannah Chen, Susie Choi, Leung Wai Liu, Nico Stuart, and Ian Youth
## CSE438S | 12/05/2022

### Description

uFree is an event scheduling app that offers a more intuitive mobile event scheduling interface than existing websites such as WhenIsGood and When2Meet. uFree enables users to create events with different descriptions and at different dates and times. Users can also invite different people to their events.

Each user has a default calendar displaying their availability over the course of a week. When creating group events, invitees can modify their existing availability "template" and send this new template to an event creator. Afterward, the creator can choose an optimal time for an event for all invited members by consulting a calendar displaying the intersection of all event members’ availability. This new event with a corresponding date, time, and description can then be displayed on all user home pages.

### Usage

* Clone the XCode project on your local device and wait for Google Firebase packages to download.

* Open Terminal, navigate to the folder with Podfile, and run “pod install” (if pods are not yet installed, run “sudo gem install cocoapods”).

* If necessary, resolve package dependencies (File > Packages > Reset (and Resolve)

* Build the project as normal on the iPhone 13 Pro. It may help to have two simulators open to test functionality between two different users.

* Create events and enjoy the clean interface of uFree!

### Notes

* Everything has been cited where necessary; DhiWise was helpful for creating the structure of each SwiftUI file, but re-styling, navigation links, and other functionality and display is completely original.

* We have done our best to minimize any warnings; however, due to the large scope of the project, there may still be some outstanding messages after the project builds. Thanks for your understanding.

* What do colors of events signify on uFree’s homepage? Every color that is not **white** indicates that the event needs attention from either the creator or participant.

  * **White**: event confirmed (either personal, or for every invited party)
  * **Red**: participants see this color if they need to confirm their availability for an event.
  * **Gray**: participants see this color if they have confirmed their availability for an event, but other users have not yet confirmed (or the creator has not finalized a start time).
  * **Amber**: Creators see this color if they have created a shared event and are waiting for invitees to confirm availability.
  * **Orange**: Creators see this color if invitees have confirmed their availability, and the creator must now choose a final time for the event.

### Potential Bugs and How to Get Past Them

### Things We Promised and How We Deliver

* A user can register for an account, then select and save their availability for a generic week (i.e., selecting hours corresponding to different times of day, from Sunday through Saturday)

* Users can create an event with a specified date, time, duration, and description.

* Users can send events to other users, allowing another user to input their availability based on their default calendar. Afterward, the creator can view a calendar containing the intersection of available times for event participants. The creator can then finalize a time at which an event will start, modifying the event details for all participants.

* A user can use their default calendar to autofill any event invite (this is default behavior)

* We hold our database of users, events, and hours in Google Firebase.
