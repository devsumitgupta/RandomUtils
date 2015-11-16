import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Crawler {
	public static void main(String args[]) throws IOException {
		FileReader fr = new FileReader("/home/sumit/test/data1.csv");
		FileWriter writer = new FileWriter("/home/sumit/test/result.csv");
		FileWriter error = new FileWriter("/home/sumit/test/error.log");
		BufferedReader fb = new BufferedReader(fr);
		String line = null;
		while ((line = fb.readLine())!= null) {
				String a[] = line.split("::");
				String title = a[0];
				String rating = a[1];
				//System.out.println(title);
				if(!title.trim().isEmpty() && !rating.trim().isEmpty()) {
				try {
				System.out.print(title.trim().substring(title.indexOf(">")+1, title.indexOf("</")));
				System.out.print(",  ");
				writer.write(title.trim().substring(title.indexOf(">")+1, title.indexOf("</")));
				writer.write(", ");
				//System.out.println(rating);
				System.out.println(rating.trim().substring(rating.indexOf("\">"), rating.indexOf("</")-3));
				writer.write(rating.trim().substring(rating.indexOf("\">"), rating.indexOf("</")-3));
				writer.write("\n");
				} catch(Exception e) {
					System.out.println("Error for " + title + " : - " + e.getMessage());
					error.write("Error for " + title + " : - " + e.getMessage());
				}
			}
		}
		writer.flush();
		writer.close();
		error.flush();
		error.close();
		System.out.println("Complete.");
	}

}

