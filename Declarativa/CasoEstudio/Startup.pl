input(File):-
         open(File,read,Str),
         read_line(Str,L),
         close(Str),
	 forall(member(E,L),formula2clausula(E)),
	 resolutor.
   
   read_line(Stream,[]):-
         at_end_of_stream(Stream).
   
   read_line(Stream,[X|L]):-
         \+  at_end_of_stream(Stream),
         read(Stream,X),
         read_line(Stream,L). 
