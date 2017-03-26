grammar JsonExpr;

json: obj+;

//parser rules
obj : 	'{' '"' KEY '"' ':' obj '}' NEWLINE
	|	'['	obj (COMMA obj)* ']' NEWLINE
	|	'{' ('"' KEY '"' ':' '"' VAL '"')? '}' NEWLINE
	|	NEWLINE
	;

// lexer rules
COMMA: 		',';
KEY:		LETTER (LETTER|DIGIT)*;
VAL:		(LETTER|DIGIT)+(LETTER|DIGIT)+;
LETTER:		[a-zA-Z\u0080-\u00FF_];
DIGIT:		[0-9];
NEWLINE:    '\r'? '\n';
WS:         [ \t]+ -> skip;
