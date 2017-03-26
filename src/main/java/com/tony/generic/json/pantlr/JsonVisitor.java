package com.tony.generic.json.pantlr;

import com.tony.generic.json.grammar.JsonExprBaseVisitor;
import com.tony.generic.json.grammar.JsonExprParser;

public class JsonVisitor extends JsonExprBaseVisitor<String> {
	StringBuilder jsonString = new StringBuilder();
	@Override 
	public String visitJsonObj(JsonExprParser.JsonObjContext ctx) { 
		return visitChildren(ctx); 
	}
	
	@Override 
	public String visitBlank(JsonExprParser.BlankContext ctx) { 
		return visitChildren(ctx); 
	}
	
	@Override 
	public String visitJson(JsonExprParser.JsonContext ctx) { 
		return visitChildren(ctx); 
	}
	
	@Override 
	public String visitList(JsonExprParser.ListContext ctx) { 
		return visitChildren(ctx); 
	}
	
	@Override 
	public String visitPrintExpr(JsonExprParser.PrintExprContext ctx) { 
		return visitChildren(ctx); 
	}

}
