Team members must familiarize themselves with GDScript 4.0.

Download and install Godot 4.0 (this game runs using Godot 4.0 and GDScript 4.0) using these links:

- Windows: https://godotengine.org/download/windows/
- Mac: https://godotengine.org/download/macos/

Clone the current repository locally on your computer.
In order to clone the current repository to your computer
click on the blue ‘Code’ and copy the link.
Using a command terminal that supports git, enter in:
git clone [link you copied]
Congrats! You now have a copy of the project on your computer locally.

Open Godot and click the import button at the top when Godot starts up. Import, from the cloned local repository, the folder called "Main Project". Now, you are ready to begin working on the project!

**Testing**
To run the game for testing, there is a play button icon at the top right corner of the screen. Click the play button and you may now begin testing.


**Generally**
Most if not all of the codebase can easily be tested using print statements.

Upon running the game using Godot’s debugger, on the left side of the screen of the Godot editor, two headers appear under the “Scene” tab: “Remote” and “Local”. Initially, the engine should default to viewing the scene tree locally, so click on the “Remote” header and a different scene tree will appear underneath. This scene tree shows all of the scenes, nodes, and resource scripts that are currently loaded in the running instance of the game. Observing this scene tree can be extremely useful when debugging something that returns “null”. By looking at this tree, you will often find that nodes didn’t load in the order you wanted them to load in and thus may cause a “null” node error.


For all other errors, it is important to understand GDScript and how the engine interprets these scripts. For example, each script written in Godot is a definition of a class, so variables and functions (or attributes and methods) of one script can be accessed by another via dot notation. However, scripts will need to be referenced by their path or assigned a specific global reference name in Godot’s Singleton feature.

To make a script a singleton, click “Project” at the top left corner of the editor and in the window that pops up, select the “Autoload” tab. Beneath the “Autoload” tab, there is a folder icon. Click on this button and choose which script to make a singleton. Alternatively, you may copy and paste the path to the script in the “Path” text field left of the folder icon. Then, you will be asked to provide the singleton with a name. Ensure that this name makes the purpose of the script clear and that the name is not too long. Furthermore, you can choose the order in which multiple singleton scripts load. Under the “Global Variable” header (still on the “Autoload” page), there are up and down icons. The singleton listed at the top will be the first to load and the singleton listed at the bottom will be the very last to run. It is important to consider the order in which singleton scripts load as a variable from one singleton may reference the variable of another.

**Exploration**
The game’s main controls consist of the classic WASD and arrow keys. In the ‘overworld’, players are able to use WASD or arrow keys to move in their desired direction. The enemies in this game have 2 nodes that orient around their behavior. 
The first one is a radius box that highlights their collision box. Upon interacting with the player’s collision box, it will transfer the player to the ‘battle world/scene’. 
The second radius box highlights an enemy’s detection radius. Unlike the collision box, this radius has no collision. Rather, this box allows the enemy to detect whether a play is within their vision range or not. If the player is in this box, the enemy will start moving towards the player’s current position, else it will idle.

Depending on its detection, the enemy will display its respective animations.
No player detected -> ‘Idle’ Animation
Player detected -> ‘Walk’ Animation

**Battle**
Since Phantom of Visteria's combat system draws from turn-based combat elements, most of the combat elements can easily be debugged/tested by using print statements to determine whose turn it should be at the moment, what the current HP is of one of the characters, etc. In the battle scene itself, the user can only interface with the game via keyboard, so using the command menu requires using the arrow keys, the backspace key, and the enter key.

Upon colliding with an enemy in the ‘overworld’, the player gets transferred to a new scene. This scene is primarily for turn-based battles.
In battle, the player can command up to 4 party members. The order goes by:
- Ancel
- Lorane
- Raflahn
- Younn

Currently, the players will always get the first turn. The first player to be able to make a turn is Ancel, as indicated by the white arrows above his head.

The player can command each party member using 2 working buttons on the bottom left of the screen:

Attack
The attack button is straightforward. Upon clicking the attack button, an indicator will appear on the first enemy on the right side of the screen. The player can then choose which enemy to attack by using the up and down arrow keys. To confirm an attack, the player must choose an enemy and press ‘Enter’. This attack deals a physical amount of damage as given by the equation:
`physical_calculation = round( (execute.attack_enemy(current_turn)) * (float(100 - enemy.physical_defense)/100))`

Skills
The skills button displays all skills that can be used by the player. Skills will vary depending on whose turn it is as indicated by the white marker above the party members’ heads. Similar to the attack button, upon choosing a skill to use, the player will then be able to select which enemy to attack.
Depending on the enemy, one might take more or less damage depending on what type of skills it is. Generally, the slimes are weak to ‘Fire’ and ‘Ice’, hence Lorane’s ‘Fire’ and ‘Blizzard’ skills will deal the most damage.
Unlike normal physical attacks, skills cost skill points (SP) to use. This makes it so the player cannot spam skill attacks every turn as it would provide an easy way to win every battle. Players will have to strategize between using skills or a normal attack. The calculations for skills are as follows:
Calculating magic damage: `magic_calculation = round( (execute.magic_attack(current_turn)) * (float(100 - enemy.magic_defense)/100))`
Calculating SP loss: `character_sp -= PartyMemberStats.sp_cost[command_given]`

**Global Scripts**
In a folder called “globals” are singleton global scripts that are essential for the game’s functionality, inside and outside of battle. The scripts are as follows:
attackStats.gd (NO LONGER USED, now located in battle_instance.gd)
Draws upon a party member’s strength or magic stats for a future damage calculation

battle_instance.gd
Draws upon a party member’s strength or magic stats for a future damage calculation

itemStats.gd
Provides a class that has a series of methods that performs the intended functionality of a particular item when used in battle

partyStats.gd
Contains all the stats for all party members and initializes important static battle variables

playerLocData.gd
Stores the current scene that the player was in, the position at which the player object was at, and which enemy the player collided with in the tile map

signals.gd
Initializes all the signals used across all scripts in the project

**Deploying the Codebase**
Before deploying the codebase, always ensure that your changes do not cause any errors in other scripts or cause the came to crash unexpectedly. Furthermore, be sure to include comments and docstrings to help other team members understand what your code does.

For deployment, save your changes in the Godot editor and close out of the editor. Then, open Git Bash. First, change directories into the folder that is connected to the GitLab repository. Then, run the command “git add -A” to stage your changes. Then run the command “git commit -m “, and following the space, write a message, in quotation marks (with beginning and end quote), that summarizes the changes made. Confirm this command and then run the command “git pull” to pull the remote codebase into your local codebase (to account for any changes made by any other team members). Finally, push your changes to the remote repository.

You will frequently encounter merge conflicts after pulling or pushing files in Git. The Git Bash interface will tell you which files are not consistent locally and remotely. After identifying which files caused the merge conflict, open the files. Git Bash will have marked in the file which sections of code are inconsistent. Sections underneath “<<<< HEAD” represent the script locally and sections underneath “======” represent the script remotely. Finally “>>>>>>” represents the end of the code inconsistency. Choose which parts of the local and remote script to keep and run the commands “git add -A”, “git commit -m “, “git pull”, and “git push” again. This should resolve the merge conflict unless a team member pushed changes while you were resolving the merge conflict.


**Changing the Codebase**
Changes can be made using any text editor. However, it is best to use the Godot editor so that you can simultaneously run the project while looking at your code. 

If changes significantly modify a script’s function(s) or variable assignments, a comment should be written above the modifications that detail who modified the section of code and when the modifications were made. Then, you should notify all team members of the significant changes to ensure that members will know how to work on or use the script. Changes may also cause errors in other scripts, so it is especially important to notify team members for this reason, too.

Changes made to the codebase should also be detailed in your Activity Report.

**Future Implementations**
Exploration:
In the ‘overworld’, we hope to be able to implement more dungeons, random tile map generation, random enemy spawner, and many more miscellaneous easter eggs and NPCs.

Battle:
In the battle scenes, we hope to be able to further develop and implement our idea of status effects. This includes, poison, bleed, freeze, ice, etc. The idea with this is that only certain skills will be able to proc certain status effects on the slimes.
Furthermore, we hope to also implement ideas of where the slimes can also use abilities to hinder the party and their attacks. For example, draining all SP or skipping a member’s turn.
Lastly, we hope to be able to implement items such as potions that boost a certain type of damage or refill SP bars.

Story:
Link to screenplay: https://docs.google.com/document/d/1rkqukAPOfzoFNqLFx8brMuV06P1hTjSwiAoEVBtf-Io/edit?usp=sharing 
Nathan Wong wrote the screenplay for Phantom of Visteria and hopes to implement this into the game
Implement cutscenes that play a series of animations and dialogue to convey Phantom of Visteria’s story

Sound:
Implement field, cutscene, battle, and boss music to perfectly capture the atmosphere of the game’s story
Implement battle sound effects to clearly convey an attack being executed
Implement field and cutscene sound effects to further immerse the player into the game


**Acknowledgements**

*Team members:*
Aaron Ndow: Developer for tile maps and most HUD bars
Nathan Wong: Primary backend developer, significant contributions were the command menu interface, battle flow, and designs data storage
Dewei Su: Developer and Designer, mainly worked on enemy movement, algorithms, and sprite/character designs.
Aidan Winters: Developer for turn indications, status effects, and player movement

*Educational Resources:*
Godot Documentations: https://docs.godotengine.org/en/latest/
How to Make an RPG in Godot 4 by DevWorm: Playlist
Godot Action RPG Series by Heartbeast: Playlist
Action RPG in Godot 4 tutorial series by Maker Tech: Playlist
JRPG Turn Based Combat Tutorial in Godot 4 by 16BitDev: Video

**License**
This project is strictly intended for academic use ONLY. No formal license is applied.

**Contact Information**
Aaron: amw548@drexel.edu
Dewei: ds3862@drexel.edu
Nathan: njw87@drexel.edu
Aidan: an953@drexel.edu