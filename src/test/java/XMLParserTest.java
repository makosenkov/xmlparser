import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.*;

class XMLParserTest {
    private XMLParser parser = new XMLParser();
    private static final ByteArrayOutputStream outContent = new ByteArrayOutputStream();
    private static final ByteArrayOutputStream errContent = new ByteArrayOutputStream();
    private static final PrintStream originalOut = System.out;
    private static final PrintStream originalErr = System.err;

    @BeforeAll
    public static void setUpStreams() {
        System.setOut(new PrintStream(outContent));
        System.setErr(new PrintStream(errContent));
    }

    @AfterAll
    public static void restoreStreams() {
        System.setOut(originalOut);
        System.setErr(originalErr);
    }

    @Test
    void emptyInput() {
        assertThrows(IllegalArgumentException.class, () -> parser.parse("",
            "src/main/resources/out.pdf"));
    }

    @Test
    void nullInput() {
        assertThrows(IllegalArgumentException.class, () -> parser.parse(null,
            "src/main/resources/out.pdf"));
    }

    @Test
    void emptyOutput() {
        assertDoesNotThrow(() -> parser.parse("src/main/resources/input.xml",
            ""));
    }

    @Test
    void nullOutput() {
        assertDoesNotThrow(() -> parser.parse("src/main/resources/input.xml",
            null));
    }
}