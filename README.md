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
