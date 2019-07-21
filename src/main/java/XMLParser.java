import org.apache.avalon.framework.configuration.Configuration;
import org.apache.avalon.framework.configuration.ConfigurationException;
import org.apache.avalon.framework.configuration.DefaultConfigurationBuilder;
import org.apache.fop.apps.*;
import org.xml.sax.SAXException;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

public class XMLParser {
    private static final String configPAth = "src/main/resources/fop.xml";
    private final FopFactory fopFactory;

    public XMLParser() throws IOException, SAXException, ConfigurationException {
        DefaultConfigurationBuilder cfgBuilder = new DefaultConfigurationBuilder();
        Configuration cfg = cfgBuilder.buildFromFile(new File(configPAth));
        fopFactory = FopFactory.newInstance(new File(configPAth));
    }

    public void parse(String inputFileName,
                      String outputFileName,
                      String templateName) {
        try (OutputStream out = new FileOutputStream(new File(outputFileName))) {
            File template = new File(templateName);

            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
            TransformerFactory transFactory = TransformerFactory.newInstance();
            Transformer transformer = transFactory.newTransformer(new StreamSource(template));
            Source src = new StreamSource(new File(inputFileName));
            Result result = new SAXResult(fop.getDefaultHandler());
            transformer.transform(src, result);
        } catch (FileNotFoundException e) {
            System.out.println("file is not found");
        } catch (IOException | TransformerException | SAXException e) {
            e.printStackTrace();
        }
    }
}
