# Exercise for 37signals programmer application 2024

Hey there! 👋

This exercise pays homage to our email service, [HEY](https://www.hey.com/). We’ve extracted a tiny version of the contact list from HEY and bundled it up in a fresh Rails 7 application, generated using framework defaults and equiped with [Hotwire](https://hotwired.dev/) for Turbo navigation and Stimulus JavaScript sprinkles.

## vCard Contact Import

Our little application stores accounts and contacts (see the `Account` and `Contact` models) and is capable of listing both. But there’s no way to get a contact into the system, which we think you’ll agree would be pretty useful!

Your task is to add support for vCard (`.vcf`) imports. You’ll need to parse the file, create new contacts, communicate progress to the user, and finally display the results.

This is a real-life example from HEY, and one that should take around six hours to complete. If necessary, cut out features and skip improvements to fit the alloted time. We’re curious about the kinds of choices you make and the things you decide to prioritize, so there are no right and wrong answers. There’s more than one way to do it, and we want to see yours.

## Here’s what you need to do:

1. Clone this repo and get it up and running on your machine. Start by running `./bin/setup`, but know that it’s not comprehensive and won’t install everything you need (like a database).

2. Peek at the root of the app `/` in your browser. You should see a list of companies, with only Basecamp loaded from the fixtures. Clicking on it you’ll see a list of contacts and a small button on the top right corner to _Import_ contacts. This button doesn't do anything yet - that's where you come in!

3. Use Rails, Ruby, Hotwire, Stimulus, or whatever else you think makes sense to make imports work. Third-party libraries are fine, but try not to get carried away. We want to see your code, not the gems you use. See the list of requirements below.

4. Submit your solution by opening a pull request in this repo. Feel free to elaborate on any aspect of the design or the choices you made in the pull request description, or in pull request comments, referencing some of your code. If we interview you, we’ll walk through your code and discuss it together.


## Requirements:

* Add the new contact import feature so that new contacts can be created from an uploaded `.vcf` file.
* Support vCard files with one contact or many contacts.
* Don’t worry about supporting fields other than name and email address. Other fields in the vCard can be ignored.
* Assume that contacts must be unique by email address within an account and handle duplicates accordingly. A database index would surely help here!
* Show progress in the UI while the import is being processed. There’s no limit to the number of contacts in a vCard file, so imports may take a long time – too long to wait on during an HTTP request.
* Provide feedback about the import result, whether it succeeds or fails.

## Notes:
* Don't feel the need to make the UI overly pretty. We're interested in the code you write, and the way you approach the problem. A simple, clean interface is more than enough.
* You’re _not_ expected to write a vCard parser yourself. Feel free to use an external gem for this.
* The included models and DB schema are intended as a guide and starting point, but feel free to modify them as you see fit.
* If you have any questions at all, don’t hesitate to reach out! You can find our email addresses in the app.
