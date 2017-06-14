package decaf;
import org.antlr.v4.runtime.misc.NotNull;

public class Listener extends DecafParserBaseListener{
    @Override
    public void enterProgram(@NotNull DecafParser.ProgramContext ctx)
    {
        System.out.println("Hugarty");
    }
    @Override
    public void enterVar_decla(@NotNull DecafParser.Var_declaContext ctx) 
    { 
        System.out.println("J");
    }   
}