grammar JsonExpr;

jsonObj: obj+;

//parser rules
obj : 	obj	NEWLINE											#printExpr
	|	'{' '"' KEY '"' ':' obj '}' NEWLINE					#json
	|	'['	obj (COMMA obj)* ']' NEWLINE					#list
	|	'{' ('"' KEY '"' ':' '"' VAL? '"')? '}' NEWLINE		#json
	|	NEWLINE												#blank
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
