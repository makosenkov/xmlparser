import java.io.IOException;

public class Main {

    public static void main(String[] args) {
        String inputFileName;
        String outputFileName = null;

        if (args.length < 1 || args.length > 2) {
            throw new IllegalArgumentException("Неверные входные параметры");
        } else if (args.length == 1) {
            inputFileName = args[0];
        } else {
            inputFileName = args[0];
            outputFileName = args[1];
        }
        XMLParser parser = new XMLParser();
        try {
            parser.parse(
                inputFileName,
                outputFileName);
        } catch (IOException e) {
            System.out.println("Ошибка вывода");
        }
    }
}
