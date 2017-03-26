grammar JsonExpr;

json: obj+;

//parser rules
obj : 	'{' '"' KEY '"' ':' obj '}' NEWLINE
	|	'['	obj (COMMA obj)* ']' NEWLINE
	|	'{' ('"' KEY '"' ':' '"' VAL? '"')? '}' NEWLINE
	|	NEWLINE
	;

// lexer rules
COMMA: 		',';
KEY:		LETTER (LETTER|DIGIT)*;
VAL:		ALPHANUM+;
fragment ALPHANUM:		[a-zA-Z0-9\u0080-\u00FF_];
fragment LETTER:		[a-zA-Z\u0080-\u00FF_];
fragment DIGIT:			[0-9];
NEWLINE:    '\r'? '\n';
WS:         [ \t]+ -> skip;
