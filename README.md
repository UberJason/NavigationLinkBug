# NavigationLinkBug

This project shows two bugs in NavigationLink.

## Bug: In a master-detail view, updating the NavigationLink $selection binding doesn't update the selected row in the master list.
### Steps to Reproduce:
1. Run the app.
2. Select Thing 0 from the left-side list, and observe that the detail view with label "Selected 0" is selected.
3. Tap the 'Tap to select 10' button, which updates the $selected binding object to tag 10.
4. Observe that the detail view with label "Selected 10" appears, but the master table row still has Thing 0 selected.

## Bug: In a master-detail view, updating the NavigationLink $selection binding to a value that's far off screen doesn't update the selected detail view until the row is on-screen or nearly on-screen in the master list.
### Steps to Reproduce:
1. Run the app.
2. Select Thing 0 from the left-side list, and observe that the detail view with label "Selected 0" is selected.
3. Tap the 'Tap to select 190' button, which updates the $selected binding object to tag 190.
4. Observe that the detail view has not changed - it still shows the label "Selected 10".
5. Scroll the master list (somewhat slowly). When the list gets to around Thing 130 (approximately), the detail selection is updated to render "Selected 190".
