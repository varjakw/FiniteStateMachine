# Finite State Machine
Short FSM exercise for Artifical Intelligence module. Done in Prolog.

![image](https://user-images.githubusercontent.com/78870995/152841976-91d65453-bdc6-4075-993c-da146ce4c3fa.png)

Church-Turing Thesis: Program ~ Turing machine

# FSM
![image](https://user-images.githubusercontent.com/78870995/152842092-4bed52eb-bca9-44a7-99a0-88110410be61.png)

- A FSM ```M``` is a triple ```[Trans, Final, Q0]``` such that ```M``` may, at state ```Q``` seeing symbol ```X```, change state to ```Qn```.
- ```Final``` is a list of ```M```'s final (accepting) states.
- ```Q0``` is ```M```'s initial state.

e.g. 
```
Trans = [[q0,aq0],[qo,b,q1],[q1,b,q1]]
Final = [q1]
Q0 = q0
```

# From Strings to FSM's

- Encode strings as lists e.g. ```102``` as ```[1,0,2]```
![image](https://user-images.githubusercontent.com/78870995/152843450-9dc2c6bb-4174-49eb-9ec7-64679a79af84.png)

See String2FSM.pl

# States-as-histories
Encoding ```q0``` as ```[]``` leads to the simplification:
```
str2fsm(String, Trans, [Last]):- mkTL(String, [], [], Trans, Last).
```
States-as-histories works for finite languages, but not for e.g. ```a*bb*```.

# Exercise
Define a 4-ary predicate
```
accept(+Trans, +Final, +Q0, ?String)
```
that is true exactly when ```[Trans, Final, Q0]``` is an FSM that accepts ```String``` encoded as a list.

That is, write a Prolog program to answer queries such as:
```
?- accept([[q0,0,q1], [q0,1,q1], [q1,0,q0], [q1,1,q0]], [q1], q0, [1,0,0])
true
```
![image](https://user-images.githubusercontent.com/78870995/152845483-0a572f1e-8cad-480c-b9aa-37375104dc11.png)

See exercise.pl

# Prolog Recap if needed
## Lists
```[x,y,z]``` is a list. ```[]``` is an empty list. Lists can contain other lists as elements ```[x, [y,z]]```.

A list consists of the head and tail: ```[H|T]``` where the head i the first element and the tail is the rest of the list. 
## Members
Definition:
```
member(X,[X|T]). %fact
member(X,[H|T])  :-  member(X,T).  %rule
```
A member is an element of a list. Its a simple recursive program. The functor member occurs in both the rule's head and the body.

The fact says: an object ```X``` is a member of a list if it is the head of that list.

The recursive rule says: an object ```X``` is a member of a list if it is a member of the tail of the list.

Example:
```
?- member(yolanda,[yolanda,trudy,vincent,jules]).
```
Prolog will answer yes because it can unify ```yolanda``` with both occurences of ```X``` in the fact in the definition.
```
?- member(vincent,[yolanda,trudy,vincent,jules]).
```
Now the first rule won't help, because ```vincent``` and ```yolanda``` are different (so ```vincent``` is not in the head as per the first clause) so Prolog goes to the second clause, the recursive rule. This gives Prolog a new goal: ```member(vincent,[trudy,vincent,jules]).```, which is the recursively removing the head until the new head matches the query value. Once again, teh first rule doesn't help because ```vincent``` and ```trudy``` are different. You can see that the next recusrive iteration of the second clause gives the goal of:  ```member(vincent,[vincent,jules]). ```. We see that the first rule finally works.

