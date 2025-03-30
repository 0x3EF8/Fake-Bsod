# Fake BSOD Prank - STOP MESSING WITH MY LAPTOP!!!

## What is this?
This is a **fake Blue Screen of Death (BSOD)** that randomly strikes **once per startup**, anywhere between **1 minute and 60 minutes** after the laptop is turned on. It is full-screen, unclosable, and mimics a genuine Windows crash. (Task Manager is disabled, and Alt+F4 is ineffective—so good luck trying to close it!)

## Why did I make this?
Because my **brothers just won't stop abusing my laptop**! Every time I step away, they're on it—clicking, gaming, downloading junk, and probably breaking something. This prank is my way of saying, "Get off my laptop!" Nothing drives the point home like a convincing BSOD that forces them to panic.

## How does it work?
1. **system_update.vbs** is placed in the Startup folder and waits a completely random period (between 1 and 60 minutes) before executing.
2. It then terminates Explorer and disables Task Manager to heighten the realism.
3. It launches **sys_maintenance.ps1**, which is stored in your user folder (e.g., `C:\Users\YourUsername\`), and displays a full-screen, professional-looking BSOD with a simulated error message and progress counter.
4. Once complete, the system will (optionally) restart, leaving your brothers convinced that the laptop is broken.

## How to install (for maximum chaos)
1. Place **sys_maintenance.ps1** in your user folder (e.g., `C:\Users\YourUsername\`).
2. Press **Win + R**, type `shell:startup`, and hit Enter to open the Startup folder.
3. Paste **system_update.vbs** into the Startup folder.
4. Restart your laptop and watch the chaos unfold!

## How to stop it (IF YOU'RE ME)
To restore the system to its normal state, simply run the provided restore script (**restore.vbs**). This will re-enable disabled features and remove all traces of the prank.

## The Best Part: BLAME THEM!
When they freak out, act absolutely shocked and pin the blame on them:
- "WHAT DID YOU DO?!"
- "I told you not to mess with my laptop!"
- "You must have installed some virus!"
- "Great, now I have to get it repaired..."
  
Watch them panic and regret their actions. This is the ultimate payback for all the laptop abuse!
