:- ensure_loaded('util').
%% :- consult('/home/andrewdo/lib/swipl/pack/wam_common_lisp/prolog/wam_cl/printers').

prolog_to_verb(Prolog,Verb) :-
	convert_prolog_to_f_print_input(Prolog,FPrintInput),
	view([fPrintInput,FPrintInput]),
	with_output_to(atom(TmpVerb),f_print(FPrintInput,_)),
	downcase_atom(TmpVerb,Verb).

convert_prolog_to_f_print_input(Prolog,FPrintInput) :-
	(   is_list(Prolog) ->
	    (	Prolog = [P|R],
		findall(O,(member(I,R),convert_prolog_to_f_print_input(I,O)),Os),
		FPrintInput = [P|Os]) ;
	    (	atomic(Prolog) ->
		FPrintInput = Prolog ;
		(   var(Prolog) ->
		    FPrintInput = Prolog ;
		    (	compound_name_arguments(Prolog,P,R),
			findall(O,(member(I,R),convert_prolog_to_f_print_input(I,O)),Os),
			FPrintInput = [P|Os])))).
