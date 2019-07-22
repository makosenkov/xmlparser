import org.apache.fop.apps.*;
import org.xml.sax.SAXException;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.net.URL;

public class XMLParser {
    private static final String configPAth = "fop.xml";
    private static final String templatePath = "template.xsl";
    private static final String defaultName = "/default.pdf";

    public void parse(String inputFileName,
                      String outputFileName) throws IOException {
        if (outputFileName == null || outputFileName.isEmpty()) {
            outputFileName = System.getProperty("user.dir") + defaultName;
        }
        if(inputFileName == null || !inputFileName.endsWith(".xml")) {
            throw new IllegalArgumentException("Неверный входной файл");
        }

        URL configUrl = getClass().getResource(configPAth);
        URL templateUrl = getClass().getResource(templatePath);
        File config = new File(configUrl.getFile());
        File template = new File(templateUrl.getFile());

        try (OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(outputFileName)))) {
            FopFactory fopFactory = FopFactory.newInstance(config);
            TransformerFactory transFactory = TransformerFactory.newInstance();

            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
            Transformer transformer = transFactory.newTransformer(new StreamSource(template));
            Source src = new StreamSource(new File(inputFileName));
            Result result = new SAXResult(fop.getDefaultHandler());
            transformer.transform(src, result);
        } catch (TransformerException | SAXException | FileNotFoundException e) {
            e.printStackTrace();
        }
    }

}
