:- dynamic option/2.

setOption(Option,Value) :-
	retractall(option(_,_)),
	assertz(option(Option,Value)).

:- setOption(iemConfiguration,1).

%% Goals = ['isReplete'(person2)],
%% Goals = ['directly-holding'(person2,bluetoothKeyboard)],
%% Goals = ['directly-holding'(person1,bluetoothKeyboard)],

iemConfiguration(1,[
		    currentPlanningCapsule('flp/flp'),
		    currentPlanner('LPG'),
		    currentPlanningGoals(['directly-holding'(person2,bluetoothKeyboard)])
		   ]).
iemConfiguration(2,[
		    currentPlanningCapsule('mealplanning/caloriesingle/current/caloriesingle'),
		    currentPlanner('LPG'),
		    currentPlanningGoals(['isReplete'(person2)])
		   ]).
iemConfiguration(3,[
		    currentPlanningCapsule('finance/current/tsimpleopticclp'),
		    currentPlanner('OPTIC_CLP'),
		    currentPlanningGoals([])
		   ]).

currentPlanningCapsule(Capsule) :-
	option(iemConfiguration,IEMConfiguration),
	iemConfiguration(IEMConfiguration,Arguments),
	argt(Arguments,[currentPlanningCapsule(Capsule)]).

currentPlanner(Planner) :-
	option(iemConfiguration,IEMConfiguration),
	iemConfiguration(IEMConfiguration,Arguments),
	argt(Arguments,[currentPlanner(Planner)]).

currentPlanningGoals(Goals) :-
	option(iemConfiguration,IEMConfiguration),
	iemConfiguration(IEMConfiguration,Arguments),
	argt(Arguments,[currentPlanningGoals(Goals)]).
