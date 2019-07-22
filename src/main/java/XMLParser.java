import org.apache.fop.apps.*;
import org.xml.sax.SAXException;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

public class XMLParser {
    private static final String configPAth = "/fop.xml";
    private static final String templatePath = "/template.xsl";
    private static final String defaultName = "default.pdf";

    public void parse(String inputFileName,
                      String outputFileName) throws IOException {
        if (outputFileName == null || outputFileName.isEmpty()) {
            outputFileName = System.getProperty("user.dir") + defaultName;
        }
        if(inputFileName == null || !inputFileName.endsWith(".xml")) {
            throw new IllegalArgumentException("Неверный входной файл");
        }

        String path = XMLParser.class.getProtectionDomain().getCodeSource().getLocation().getPath();
        String decodedPath = URLDecoder.decode(path, StandardCharsets.UTF_8);
        File config = new File(decodedPath + configPAth);
        File template = new File(decodedPath + templatePath);

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
