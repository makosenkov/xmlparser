import org.apache.fop.apps.*;
import org.xml.sax.SAXException;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.net.URL;
import java.nio.file.Files;
import java.util.Date;

public class XMLParser {
    private static final String configPAth = "fop.xml";
    private static final String templatePath = "template.xsl";
    private static final String fontPath = "TIMES_NEW_ROMAN.TTF";
    private static final String defaultName = "/default.pdf";

    public void parse(String inputFileName,
                      String outputFileName) throws IOException {
        if (outputFileName == null || outputFileName.isEmpty()) {
            outputFileName = System.getProperty("user.dir") + defaultName;
        }
        if(inputFileName == null || !inputFileName.endsWith(".xml")) {
            throw new IllegalArgumentException("Неверный входной файл");
        }

        File config = getResource(configPAth);
        File template = getResource(templatePath);

        try (OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(outputFileName)))) {
            FopFactory fopFactory = FopFactory.newInstance(config);
            TransformerFactory transFactory = TransformerFactory.newInstance();

            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
            Transformer transformer = transFactory.newTransformer(new StreamSource(template));
            Source src = new StreamSource(new File(inputFileName));
            Result result = new SAXResult(fop.getDefaultHandler());
            transformer.transform(src, result);
        } catch (FileNotFoundException | SAXException | TransformerException e) {
            e.printStackTrace();
        }
    }

    private File getResource(String resource) {
        File file = null;
        URL res = getClass().getResource(resource);
        if (res.toString().startsWith("jar:")) {
            try (InputStream input = getClass().getResourceAsStream(resource)){
                file = Files.createTempFile(new Date().getTime()+"", ".html").toFile();
                System.out.println(file.getPath());
                System.out.println(new File(fontPath).getPath());
                try (OutputStream out = new FileOutputStream(file)){
                    int read;
                    byte[] bytes = new byte[1024];

                    while ((read = input.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                }
                file.deleteOnExit();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        } else {
            file = new File(res.getFile());
        }
        return file;
    }

}
