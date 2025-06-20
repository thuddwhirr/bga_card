import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

class FontDecoder {

    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java FontDecoder <input_image>");
            System.exit(1);
        }

        File input = new File(args[0]);s
        try {
            BufferedImage img = ImageIO.read(input);
            String binaryData = extractFontData(img);
            writeToFile("font.bin", binaryData);
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
            System.exit(1);
        }
    }

    private static String extractFontData(BufferedImage img) {
        StringBuilder sb = new StringBuilder(256 * 16 * 8);
        for (int row = 0; row < 16; row++) {
            for (int col = 0; col < 16; col++) {
                appendCharacterData(img, sb, row, col);
            }
        }
        return sb.toString();
    }

    private static void appendCharacterData(BufferedImage img, StringBuilder sb, int row, int col) {
        int x0 = col * 9;
        int y0 = row * 17;
        for (int y = y0 + 1; y <= y0 + 16; y++) {
            for (int x = x0 + 1; x <= x0 + 8; x++) {
                int c = img.getRGB(x, y);
                sb.append(c == -1 ? "1" : "0");
            }
            sb.append("\n");
        }
    }

    private static void writeToFile(String fileName, String data) throws IOException {
        try (FileWriter fw = new FileWriter(fileName)) {
            fw.write(data);
        }
    }
}
