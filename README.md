# Path of Excelence - Demo
## Project Requirements
- [ ] Side View
- [ ] Autonomous NPC's
- [ ] Goal: Reach the exit
- [ ] Minimum of 3 types of Actions/Effects
- [ ] Minimum of 2 type of Obstacles
- [ ] Score
## Game Mechanics
### Side View
### Autonomous NPC's
Students will walk right from the entrance of the level while they can and will react to what they encounter along their path:
- If they fall into a big hole, they die
- If they find a wall or pile of paper blocking their path they start walking the other way
- If they find stairs, they keep walking through them
- If they find the level exit, they leave the level successfully
### Actions/Effects (Min. 3)
There are two types of usable items on Path of Excellence:
- **Actions:** Can be given to specific students, chaging their status temporarily until the given ability is used. A student cannot have more than one action/effect active over itself at the same time so, if it receives a second effect, the first one is lost.
- **Effects:** Can be given to specific students, changing their status permanently and giving that specific student an ability. A student cannot have more than one action/effect active over itself at the same time so, if it receives a second effect, the first one is lost.
#### Action : Calculator
You can command a student to make calculations. After using this action on a student, if they find a wall, pile of paper or cliff in front of them, they will create a stairway out of a coloured bar plot, allowing himself/herself and other students to climb to higher points or descent to lower points safely. After building a set of stairs, the effect wears off. The calculator wont activate itself unless the resulting stairway would take the students somewhere (for example it won't activate on the limits of the level).
#### Effect : Study
You can command a student to study. After using this action on a student, if they find a pile of papers in their way, they won't go back anymore, instead reading the contents of the pile of papers and removing them from the map, for others to be able to traverse it.
### Obstacles (Min. 2)
#### Environmental Obstacles
The students can find difficulties merely by the design of the level, such as:
- Holes that will kill them if they fall inside them
- Cliffs that will kill them if they don't have a way of descenting safely from them
- Walls that will make them go back when they find them, forcing them to either find another way or use some action/effect to climb them
#### Piles of Paper
Piles of Paper can be found blocking the way to the exit. Students that encounter them will just start walking back unless they are given some command that allows them to deal with them or go around them.
### Level Exit
