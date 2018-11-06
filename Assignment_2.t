var matrix : array 1 .. 26, 1 .. 26 of string
var rotn, text, word, cipher, n_value, selection, key : string
var n, ext, errorCheck, ascii, selection_int, row, col : int

setscreen ("graphics")

ext := 0

% Setting up Procedure to Prompt When the Screen Would be Cleared
procedure clearScreen
    var ch : string (1)
    put "Please press any key to clear screen"
    getch (ch)
    cls
end clearScreen
% Finished Setting up Procedure

procedure encryptRot
    loop
	put "Please enter plain text"
	get text
	if strintok (text) = true then
	    cls
	    put "The input must be plain text"
	    clearScreen
	else
	    if length (text) < 80 then
		ext := 1
	    else
		put "Text can not be more than 80 charecters long"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    text := Str.Upper (text)
    ext := 0
    cls

    loop
	put "Please enter a n value"
	get n_value
	if strintok (n_value) = false then
	    put "n value must be a interger"
	    clearScreen
	else
	    n := strint (n_value)
	    if n > 0 then
		ext := 1
	    elsif n = 0 then
		cls
		put "The n value can't be zero"
		clearScreen
	    elsif n < 0 then
		cls
		put "The n value must be positive"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    cls

    if n > 26 then
	n := n mod 26
    end if

    for i : 1 .. length (text)
	ascii := ord (text (i))
	errorCheck := ord (chr (ascii + n))
	if errorCheck > 90 then
	    cipher := cipher + chr (64 + (errorCheck - 90))
	else
	    cipher := cipher + chr (ascii + n)
	end if
    end for

    put "Your cipher is ", Str.Upper (cipher)

end encryptRot

procedure decryptRot
    loop
	put "Please enter cipher text"
	get cipher
	if strintok (cipher) = true then
	    cls
	    put "The input must be plain text"
	    clearScreen
	else
	    if length (cipher) < 80 then
		ext := 1
	    else
		put "Text can not be more than 80 charecters long"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    cipher := Str.Upper (cipher)
    ext := 0
    cls

    loop
	put "Please enter a n value"
	get n_value
	if strintok (n_value) = false then
	    put "n value must be a interger"
	    clearScreen
	else
	    n := strint (n_value)
	    if n > 0 then
		ext := 1
	    elsif n = 0 then
		cls
		put "The n value can't be zero"
		clearScreen
	    elsif n < 0 then
		cls
		put "The n value must be positive"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    cls

    if n > 26 then
	n := n mod 26
    end if

    for i : 1 .. length (cipher)
	ascii := ord (cipher (i))
	errorCheck := ord (chr (ascii - n))
	if errorCheck < 65 then
	    text := text + chr (90 + (errorCheck - 64))
	else
	    text := text + chr (ascii - n)
	end if
    end for

    put "Your plain text is ", Str.Upper (text)

end decryptRot

procedure encryptVigenere
    n := 0
    word := ""
    for i : 1 .. 26
	for j : i .. 26 + n
	    matrix (i, j - n) := chr (65 + (j - 1) mod 26)
	end for
	n := n + 1
    end for
    loop
	put "Please enter plain text"
	get text
	if strintok (text) = true then
	    cls
	    put "The input must be plain text"
	    clearScreen
	else
	    if length (text) < 80 then
		ext := 1
	    else
		put "Text can not be more than 80 charecters long"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    text := Str.Upper (text)

    cls

    loop
	put "Please enter a Key"
	get key
	if strintok (key) = true then
	    cls
	    put "The input must be plain text"
	    clearScreen
	else
	    if length (key) < 80 then
		ext := 1
	    else
		put "Text can not be more than 80 charecters long"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    key := Str.Upper (key)

    cls

    if length (text) > length (key) then
	key := repeat (key, length (text) div length (key) + 1)
    end if

    for i : 1 .. length (text)
	if ord (text (i)) = 65 then
	    row := 1
	    col := 1
	else
	    row := ord (key (i)) - 64
	    col := ord (text (i)) - 64
	end if
	word := word + matrix (row, col)
    end for
    put "Your Cipher Text is"
    put word
end encryptVigenere

procedure decryptVigenere
    n := 0
    word := ""
    for i : 1 .. 26
	for j : i .. 26 + n
	    matrix (i, j - n) := chr (65 + (j - 1) mod 26)
	end for
	n := n + 1
    end for
    loop
	put "Please enter cipher text"
	get text
	if strintok (text) = true then
	    cls
	    put "The input must be plain text"
	    clearScreen
	else
	    if length (text) < 80 then
		ext := 1
	    else
		put "Text can not be more than 80 charecters long"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    text := Str.Upper (text)

    cls

    loop
	put "Please enter a Key"
	get key
	if strintok (key) = true then
	    cls
	    put "The input must be plain text"
	    clearScreen
	else
	    if length (key) < 80 then
		ext := 1
	    else
		put "Text can not be more than 80 charecters long"
		clearScreen
	    end if
	end if
	exit when ext = 1
    end loop

    key := Str.Upper (key)

    cls

    if length (text) > length (key) then
	key := repeat (key, length (text) div length (key) + 1)
    end if

    for i : 1 .. length (text)
	n := 0
	col := ord (key (i)) - 64
	loop
	    exit when n = 1
	    row := row + 1
	    if matrix (row, col) = text (i) then
		n := 1
	    end if
	end loop
	word := word + matrix (row, 1)
	row := 0
	col := 0
    end for
    put "Your Plain Text is"
    put word
end decryptVigenere

loop
    put "What Theme Would You Like? Enter The Number Corrosponding to the Theme"
    put ""
    put "*-----------------*"
    put "|1 for Light Theme|"
    put "|2 for Dark Theme |"
    put "*-----------------*"
    put ""
    put "Selection: " ..

    get selection
    if strintok (selection) = false then
	put "Please enter a interger"
    else
	selection_int := strint (selection)
	if selection_int < 1 then
	    cls
	    put "The number must be between 1 and 2"
	elsif selection_int = 1 then
	    cls
	    for i : 1 .. 25
		colourback (white)
		colour (black)
		put ""
	    end for
	    exit
	elsif selection_int = 2 then
	    cls
	    for i : 1 .. 25
		colourback (black)
		colour (white)
		put ""
	    end for
	    exit
	elsif selection_int > 2 then
	    cls
	    put "The number must be between 1 and 2"
	end if
    end if
    clearScreen
end loop

cls

loop

    row := 0
    col := 0
    cipher := ""
    text := ""
    key := ""
    selection := ""

    put "Please enter a number"
    put ""
    put "*---------------------*"
    put "|1 for encryptRot     |"
    put "|2 for decryptRot     |"
    put "|3 for encryptVigenere|"
    put "|4 for decryptVigenere|"
    put "|5 to exit            |"
    put "*---------------------*"
    put ""
    put "Selection: " ..

    get selection
    if strintok (selection) = false then
	put "Please enter a interger"
    else
	selection_int := strint (selection)
	if selection_int < 1 then
	    cls
	    put "The number must be between 1 and 5"
	elsif selection_int = 1 then
	    cls
	    encryptRot
	elsif selection_int = 2 then
	    cls
	    decryptRot
	elsif selection_int = 3 then
	    cls
	    encryptVigenere
	elsif selection_int = 4 then
	    cls
	    decryptVigenere
	elsif selection_int = 5 then
	    cls
	    exit
	elsif selection_int > 5 then
	    cls
	    put "The number must be between 1 and 5"
	end if
    end if

    clearScreen

end loop
