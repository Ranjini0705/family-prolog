male(tom).
male(pat).
female(pam).
female(ann).

parent(pam,bob).
parent(tom,liz).
parent(tom,bob).
parent(bob,pat).

father(X,Y):-male(X),parent(X,Y).
mother(X,Y):-female(X),parent(X,Y).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
