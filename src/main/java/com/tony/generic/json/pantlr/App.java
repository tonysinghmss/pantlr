package com.tony.generic.json.pantlr;

import java.io.FileInputStream;
import java.io.InputStream;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import com.tony.generic.json.grammar.LabeledExprLexer;
import com.tony.generic.json.grammar.LabeledExprParser;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws Exception
    {
    	InputStream is = (args.length == 0) 
                ?  System.in
                : new FileInputStream(args[0]);
             
            ANTLRInputStream input = new ANTLRInputStream(is);
            LabeledExprLexer lexer = new LabeledExprLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            LabeledExprParser parser = new LabeledExprParser(tokens);
             
            ParseTree tree = parser.prog();
             
            EvalVisitor eval = new EvalVisitor();
            eval.visit(tree);
    }
}
