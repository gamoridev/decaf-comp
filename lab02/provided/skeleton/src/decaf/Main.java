package decaf;

import java.io.*;
//import antlr.Token;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.*;
import java6035.tools.CLI.*;
class Main {
    public static void main (String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();

		        			switch (token.getType())
		        			{
                                case DecafLexer.TK_CLASS:
                                case DecafLexer.TK_IF:
                                case DecafLexer.TK_ELSE:
                                case DecafLexer.TK_INT:
                                case DecafLexer.TK_BOOLEAN:
                                case DecafLexer.TK_VOID:
                                case DecafLexer.TK_CALLOUT:
                                case DecafLexer.TK_RETURN:
                                case DecafLexer.TK_FOR:
                                case DecafLexer.TK_BREAK:
                                case DecafLexer.TK_CONTINUE:
                                    break;
                                case DecafLexer.BOOLEAN:
                                    type = " BOOLEANLITERAL";
                                    break;
                                case DecafLexer.STRING:
                                    type = " STRINGLITERAL";
                                    break;
                                case DecafLexer.CHAR:
        				            type = " CHARLITERAL";
        				            break;
                                case DecafLexer.HEXA_ERROR:
                                    type = " ERROR";
                                    break;
                                case DecafLexer.HEXA:
                                    type = " INTLITERAL";
                                    break;
                                case DecafLexer.INT:
                                    type = " INTLITERAL";
                                    break;
                                case DecafLexer.ID:
                                    type = " IDENTIFIER";
                                    break;
                                default:
                                    type = "";
                                    break;
                            }
		        			System.out.println (token.getLine() + type + " " + text);
		        		}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);
                
                ParseTree tree = parser.program();
                // for(int i = 0; tree.getChild(i) != null; i++){
                //     System.out.println( tree.getChild(i).getText());
                // }
                System.out.println(tree.toStringTree(parser));
        	}
            else if(CLI.target == CLI.INTER)
			{
				DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);

                ParseTree tree = parser.program();

                if(CLI.debug)
                    System.out.println(tree.toStringTree(parser));

                ParseTreeWalker walker = new ParseTreeWalker();
                Listener listener = new Listener();
                walker.walk(listener, tree);
			}

        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}