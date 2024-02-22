# Path of Excelence
## Project Requirements
- [ ] Side View
- [ ] Autonomous NPC's
- [ ] Goal: Reach the exit
- [ ] Minimum of 3 types of Actions/Effects
- [ ] Minimum of 2 type of Obstacles
- [ ] Score
## Game Mechanics
In Path of Excellence, your objective is to guide a bunch of students through their journey during a college exam. By assigning Actions and Effects to them, you give them abilities they can use in order to arrive the end of the exam without dooming themselves! Help them find the best path to a good grade, prevent them of falling prey to dangerous traps and do it as fast as you can, as you help these students trail their path to excellence!
### Side View
Path of Excelence will be developed in 2D, with a side view perspective similar to a platformer. Besides the level and the students, there will also be a GUI with the Actions/Effects you can apply to the Students and information about:
	- How many students are alive
	- Minimum amount of students need to make it to the exit for the player to win
	- Time passed since beggining of the level
### Autonomous NPC's
Students will walk right from the entrance of the level while they can and will react to what they encounter along their path:
- If they fall into a big hole, they die
- If they find a wall or pile of paper blocking their path they start walking the other way
- If they find stairs, they keep walking through them
- If they find the level exit, they leave the level successfully
### Actions/Effects (Min. 3)
There are two types of usable items on Path of Excellence:
- **Actions:** Can be given to specific students, chaging their status temporarily until the given ability is used once. A student cannot have more than one action/effect active over itself at the same time so, if it receives a second effect, the first one is lost.
- **Effects:** Can be given to specific students, changing their status permanently and giving that specific student an ability. A student cannot have more than one action/effect active over itself at the same time so, if it receives a second effect, the first one is lost.
#### Action : Calculator
You can command a student to make calculations. After using this action on a student, if they find a wall, pile of paper or cliff in front of them, they will create a stairway out of a coloured bar plot, allowing himself/herself and other students to climb to higher points or descent to lower points safely. After building a set of stairs, the effect wears off. The calculator wont activate itself unless the resulting stairway would take the students somewhere (for example it won't activate on the limits of the level).
#### Action : Ruler
You can command a student to measure a path to surpass a hole. After using this action on a student, if they find a hole, they will use the ruler as a bridge to traverse to the other side. If they find a cliff without another point to support the ruler or a hole that is too large, they will still fall from it and die. After the student build a bridge, it will go back to being a normal student.
#### Action : Slides
You can command a student to check the theoretical slides of the subject. After using this action on a student, they will stop right where they are and they will warn others that reach them to go back the way they came, acting in the same way as a wall. The effect wears off if another effect is given to the student.
#### Effect : Clear
You can clean effects from students and make them go back to being a normal student without any active effects. This won't make the player recover effects he/she already used on students.
#### Effect : Monitor
You can command a student to be a monitor, guiding other students through Doubt Zones. Students with this effect will illuminate a certain area around them inside Doubt Zones, allowing the player to interact with students in the illuminated zone and see what's inside.
#### Effect : Study
You can command a student to study. After using this action on a student, if they find a pile of papers in their way, they won't go back anymore, instead reading the contents of the pile of papers and removing them from the map, for others to be able to traverse it.
### Obstacles (Min. 2)
#### Environmental Obstacles
The students can find difficulties merely by the design of the level, such as:
- Holes that will kill them if they fall inside them. The bottom of holes that can't or houldn't be achieved by students without them dying can be replaced with lava or something dangerous, to signal the player they shouldn't send the students there.
- Cliffs that will kill them if they don't have a way of descenting safely from them. The bottom of cliffs that can't or houldn't be achieved by students without them dying can be replaced with lava or something dangerous, to signal the player they shouldn't send the students there.
- Walls that will make them go back when they find them, forcing them to either find another way or use some action/effect to climb them, if they are low enough for that.
#### Doubt Zones
Some sections of the level may be completely dark and full of interrogation marks, not allowing the player to see what's going on inside them. Students will still go inside them and act normally, ignoring the darkness, but the player will not be able to see what's happening. The player won't be able to interact with students while they are in a Doubt Zone, unless the Doubt Zone is illuminated somehow.
#### Piles of Paper
Piles of Paper can be found blocking the way to the exit. Students that encounter them will just start walking back unless they are given some command that allows them to deal with them or go around them. Not all Piles of Paper necessarily need to be destroyed for the level to be completed. Some might even be needed to block the students' way to prevent them from deviating from the correct path.
#### Shortcuts
Shortcuts manifest as portals that take students from a point to another. While some may be helpful to the journey, others may conduct students to traps. There are many ways that Shortcuts can appear:
	- **One Way:** There's two portals of the same color. Students that enter one exit through the other. Once a student traverses the portal, it can't go back through the portal it exited.
	- **Two Ways:** Same as the previous one, except the student can go back through the exited portal to the original one it traversed.
	- **Test Versions:** There's an initial portal that conects to a set of n others. Everytime a student travereses the portal, it gets sent to another of the n portals. The next student that does the same will be teleported to other of the n portals. For example, if we have 3 portals, a student would be sent to 1, the next to 2, the next to 3, the next to 1 and repeat. These portals add difficulty to the levels by scattering students around different paths to the exit.
#### Trivia Doors and Switches
Trivia Switches are golden blocks with interrogation marks that can be found along the way of the students. Trivia Doors are locked by default and, while in that state, are the same as walls for the students. Once a student reaches the Trivia Switch, a prompt will appear for the player to answer a four-option question. If the player answers correctly, the switch is enabled, the door is open and students can't interact with the switch anymore. If the player fails the question, the student who found the switch dies. Once a new student reaches that same switch, a new question appears in the prompt. The game is paused while the Trivia Switches are being used and the questions are timed. Some Trivia Doors may have to be opened for the students to reach the exit while others may provide only shortcuts. Normally, the Trivia Switch will be outside the main path to the exit, to make things more challenging for the player. 
### Level Exit
The Level Exit is a desk where a professor is waiting for the students to deliver their exam.
### Scoring
Scoring would be a value from A to F, representing school grades. Those values will be calculated based on:
	- Time taken to complete the level
	- Percentage of students that reached the exit
	- Amount of Actions/Effects used
