import java.io.IOException;
import java.io.Reader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java_cup.Lexer;
import java.io.File;
import java.util.logging.Logger;
import java.io.BufferedReader;
import java_cup.parser;
import java.util.logging.Level;


public class Compilador {

    public static void main(String[] args) {
        Reader scanner;
        try {
            scanner = new BufferedReader(new FileReader("source.txt"));
            Lexer lexer = new Lexer(scanner);
            Parser parser = new Parser(lexer);
            parser.parse();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Compilador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
