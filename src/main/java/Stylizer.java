import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.transform.stax.StAXSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Objects;

import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;

public class Stylizer {

    static Document document;

    public static void main(String[] args) throws XMLStreamException, IOException, SAXException, ParserConfigurationException {
        boolean ok = schemaValidator();
        if (ok) {
            System.out.println("all is good");
        }

        File stylesheet = new File(Objects.requireNonNull(Stylizer.class.getClassLoader().getResource("converter.xsl")).getFile());
        File datafile = new File(Objects.requireNonNull(Stylizer.class.getClassLoader().getResource("example.xml")).getFile());

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        document = builder.parse(datafile);
    }

    public static boolean schemaValidator() throws SAXException, IOException, XMLStreamException {
        try {
            SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = factory.newSchema(new File(".\\src\\main\\resources\\issue.xsd"));
            Validator validator = schema.newValidator();
            XMLStreamReader reader = XMLInputFactory.newInstance().createXMLStreamReader(Files.newInputStream(Paths.get(".\\src\\main\\resources\\example.xml")));
            validator.validate(new StAXSource(reader));

            System.out.println("XML is valid");
            return true;
        } catch (Exception e) {
            System.out.println("XML is not valid");
            return false;
        }
    }
}
