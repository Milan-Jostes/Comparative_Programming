% Initialize the recursion loop
binary_search(List, Target, Index) :-
    length(List, Len),
    Right is Len - 1,
    binary_search_helper(List, 0, Right, Target, Index).

% Create the binary search function that will return the location IF it exists
binary_search_helper(List, Left, Right, Target, Index) :-
    %Make sure the search range is valid and will not cause errors
    Left =< Right,
    %Calculate the midpoint
    Mid is Left + (Right - Left) // 2,
    %Get the variable at mid and set MidVal to it
    nth0(Mid, List, MidVal),
    %Check if the target is at the middle value and set it if it is.
    (   MidVal =:= Target ->
        Index is Mid
        %Check if it is in the left or right half of the array and use recursion to narrow it down further
    ;   MidVal < Target ->
        NewLeft is Mid + 1,
        binary_search_helper(List, NewLeft, Right, Target, Index)
    ;   NewRight is Mid - 1,
        binary_search_helper(List, Left, NewRight, Target, Index)
    ).

%Define main
main :-
    %Create the array
    List = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    %Set target value
    Target = 7,
    %Call the binary search function
    binary_search(List, Target, Index),
    %Check if the value exists, if it does, output it. Else say it was not found
    (   nonvar(Index) ->
        format('Location of ~w is ~w.~n', [Target, Index])
    ;   write('Target not found')
    ).

% Run main function
:- initialization(main).
