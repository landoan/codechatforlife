# Assignment - *Lan Doan Code Chat*

> HINT: Please
> - include this README.md in your project and fill out the information.
> - remove the `README.rdoc` file that Rails generates.
> - remove all the HINT blocks in this file.

**Name of your app** is a Ruby on Rails blog application.

Submitted by: **Doan Phuong Lan**

Time spent: **20** hours spent in total

URL: **http://codechatforlife.herokuapp.com/**

## User Stories

The following **required** functionality is complete:

> HINT: mark the items you completed with [x]

* [x] User can sign up by providing their email, password, and name.
* [x] User can login using an email and password.
* [x] After logging in, the user is taken to a page that has a list of incoming messages, sorted in descending chronological order (newest messages at top), a "new message" link, an "add friends" link, and a "sent messages" link.
* [x] Unread messages should be bold or something similar in the list of messages.
* [x] Clicking the "add friends" link takes the user to a page with all users listed, with a link to "add user to friends list".
* [x] Clicking on "new message" takes the user to a page where they can write a new mesasge. The recipient field should be a dropdown, where the options are names from the user's friends.
* [x] Clicking on "sent messages" takes the user to a page listing messages they have sent. Each message should display at what time it was read by the recipient, or "unread". The user cannot read the contents of the messages.
* [x] User can read a message's content only once. Once the message has been read, the user will see a page indicating the message has already been read.
* [x] User can only read messages where they are the recipient.

The following **optional** features are implemented:
* [x] User can specify multiple recipients per message.
* [x] User gets an email when they receive a message, with a link to view the message.
* [x] User gets an email when a message they have sent is read with the time at which the message was read.
* [x] User can remove friends from their friends list.

> HINT: if you are unsure how to implement the Search feature, you can Google how to implement a simple search form. For example, one of the sites you will find is [this](http://www.jorgecoca.com/buils-search-form-ruby-rails/)

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- User can create an account
- User can only create an article after login to the system with existing account
- User can logout
- Noone can access the system without an account

## Video Walkthrough

Here's a walkthrough of implemented user stories:

> HINT: You can put a `walkthrough.gif` file in your project folder, add to git, and use the following syntax to embed it:
> `![Video Walkthrough](assignment_1_lan.gif)`
>

![Video Walkthrough](assignment_2_lan.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Heroku app link
https://codercancook.herokuapp.com/
## Notes
- self-relationships
-upload image

## License

    Copyright [2016] [Lan Doan]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.