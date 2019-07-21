import org.apache.avalon.framework.configuration.ConfigurationException;
import org.xml.sax.SAXException;

import java.io.IOException;

public class Main {

    public static void main(String[] args) throws SAXException, IOException, ConfigurationException {
        XMLParser parser = new XMLParser();
        parser.parse(
            "src/main/resources/input.xml",
            "src/main/resources/out.pdf",
            "src/main/resources/template.xsl");
    }
}
