# FAQ

Below are a few common issues and questions!

## Where Did the Toolbar Button Go?

In versions 1.x.x of Simple Calendar the toolbar button was under "Token Controls".

In versions 2.x.x of Simple Calendar Reborn the toolbar button was moved to be under "Journal Notes".
There is also a button to open Simple Calendar Reborn under the Configure Settings menu.

This move was made as Simple Calendar Reborn does not have anything specific to do with tokens and is largely a journal tool, so it makes more sense for it to live there.

<hr/>

## Why Is Simple Calendar Reborn not in Sync with X module/system?

Simple Calendar Reborn does its very best to stay synced with all other time modules and systems that provide their own clocks/calendars, sometimes though it isn't perfect.

One setting to make sure is set correctly, regardless of module or system, is to make sure the [Game World Time Integration](https://simplecalendarreborn.net/pages/calendar-configuration/index/general-settings.html#game-world-time-integration) setting is set to "Mixed". Almost everyone will need that setting set to Mixed, the other options are for very specific use cases.

Listed below are some other modules and systems that get asked about:

### Pathfinder 2E

Simple Calendar Reborn will sync properly with Pathfinder 2E's world clock in 99% of cases, provided the ["Pathfinder 2E: World Time Sync"](https://simplecalendarreborn.net/pages/calendar-configuration/index/general-settings.html#pathfinder-2e-world-clock-sync) setting is enabled in Simple Calendar Reborn.

There are a few edge cases where time in Simple Calendar Reborn will be off by a day from the PF2E World Clock. This has to do with how [each addresses leap years and is not easily fixed from the side of PF2E](https://github.com/foundryvtt/pf2e/issues/1772).

### SmallTime

This gets asked about a lot. SmallTime used to have an integration with Simple Calendar. However, the same is not true for Simple Calendar Reborn. Last I spoke with SmallTime's developer they are not planning on adding support Simple Calendar Reborn.
Consider potentially using  [About Time Next](https://github.com/paulcheeba/about-time-next) instead, which has support for Simple Calendar Reborn.

<hr/>

## How do I set the time to be a 12-hour clock instead of a 24-hour clock?

Simple Calendar Reborn offers a very customizable way to change how the time and date are displayed, all details on how you can customize the display can be found [here](https://simplecalendarreborn.net/pages/calendar-configuration/index/display-options.html).

For a quick setting to a 12-hour clock though you can follow these steps:

1. Open up the Simple Calendar Reborn configuration window.
2. Navigate to the calendar's "Display Options" settings.
3. In the field called "Time Format" replace with this `hh:mm:ss A`.
4. Save the configuration, now the clock will be displayed in a 12-hour format!

<hr/>

## Simple Calendar Reborn Says "There is an active combat/combats running" but there are no combats running

This message will appear depends on what you have set for the setting ["Pause Real Time Clock on Combat Rule"](https://simplecalendarreborn.net/docs/global-configuration/settings#pause-real-time-clock-on-combat-rule).

If the setting is set to "**Pause Only on the Active Scene**":

- Check to make sure the current scene you are on is the active scene (indicated with a target icon in the scene list).
    - If it is not make the current scene the active scene.
    - Or go to the active scene and see if there is a combat running and end that combat.

If the setting is set to "**Pause on the Scene the GM is Currently Viewing**":

- Double check to see if there is a combat running on the scene you are viewing.

If none of the above options help then there could be a stuck combat. Occasionally in Foundry combats are not properly ended and can still report they are active.

You can check this by opening up the developer console (F12) and putting this command in `game.combats.size`. That will show how many combats Foundry thinks is running.

If there are combats that shouldn't be there you can run this command `game.combats.forEach(c => {c.delete()})` to remove all combats.

:::caution

This will delete all combats on all scenes, so it is better to wait until you are done with any combats in progress before running that command.

:::
