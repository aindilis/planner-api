planForContingency(whatIf(person1LosesTheirJob)).
planForContingency(whatIf(person1MovesBackInWithUs)).

%% look into using Cyc #$Situation s to describe these things

%% ("This #$Microtheory contains rules about relations #$mtPrecedes and \n#$mtAlternatives between instances of \n#$ReasoningWithMultiFutureMicrotheory, and rules concerning truth \nconditions of formulas in those instances.")


planForContingency(whatIf(has(Person,bloodSugarAttack))) :-
	isa(Person,person).

planForContingency(whatIf(has(Person,hospitalization))) :-
	isa(Person,person).

planForContingency(whatIf(has(Person,physicalFall))) :-
	isa(Person,person).

planForContingency(whatIf((hasWithDrawal(Withdrawal,BankAccount),unexpected(Withdrawal)))) :-
	isa(BankAccount,backAccount).

planForContingency(whatIf(intervenes(Situation,God))) :-
	isa(God,god),
	hasSituation(Situation).
