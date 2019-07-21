import org.apache.fop.apps.*;
import org.xml.sax.SAXException;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

public class XMLParser {
    private static final String configPAth = "src/main/resources/config/fop.xml";
    private static final String templatePath = "src/main/resources/template.xsl";
    private static final String defaultName = "/default.pdf";
    private FopFactory fopFactory;
    private TransformerFactory transFactory;

    public XMLParser()  {
        try {
            fopFactory = FopFactory.newInstance(new File(configPAth));
            transFactory = TransformerFactory.newInstance();
        } catch (SAXException e) {
            System.out.println("Ошибка при инициализации FopFactory");
        } catch (IOException e) {
            System.out.println("Ошибка в конфигурационном файле");
        }
    }

    public void parse(String inputFileName,
                      String outputFileName) throws IOException {
        if (outputFileName == null || outputFileName.isEmpty()) {
            outputFileName = System.getProperty("user.dir") + defaultName;
        }
        if(inputFileName == null || !inputFileName.endsWith(".xml")) {
            throw new IllegalArgumentException("Неверный входной файл");
        }
        try (OutputStream out = new FileOutputStream(new File(outputFileName))) {
            File template = new File(templatePath);

            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
            Transformer transformer = transFactory.newTransformer(new StreamSource(template));
            Source src = new StreamSource(new File(inputFileName));
            Result result = new SAXResult(fop.getDefaultHandler());
            transformer.transform(src, result);
        } catch (TransformerException | SAXException e) {
            System.out.println("Ошибка при обратотке входного файла");
        } catch (FileNotFoundException e) {
            System.out.println("Входной файл не найден");
        }
    }
}
