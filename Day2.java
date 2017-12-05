import java.io.*;

public class Day2 {
	
	public static void main(String[] args) {
      System.out.println(args[0]);
	  BufferedReader reader = null;
	  FileInputStream fis = null;
      try {
            fis = new FileInputStream(args[0]);
            reader = new BufferedReader(new InputStreamReader(fis));
                    
            String line = reader.readLine();
			float checksum = 0;
            while(line != null){
                String[] strArray = line.split("\t");
				int[] array = new int[strArray.length];
				for(int i = 0; i < strArray.length; i++) {
					//if (Integer.parseInt(strArray[i]) % 2 == 0) 
					array[i] = Integer.parseInt(strArray[i]);
				}
				for(int i=0; i<array.length; i++)
				{
					for(int j=0; j<array.length; j++)
					{
						float x = (float)array[i]/array[j];
						if ( x==Math.ceil(x) && i != j) {
							System.out.println("found i:" + array[i]);
							System.out.println("found j:" + array[j]);
							System.out.println("result:" + x);
							System.out.println("result ceiled:" + Math.ceil(x));
							checksum += x;
						}
						
					}
				}
				System.out.println(checksum);
                line = reader.readLine();
				//break;
            }           
          
        } catch (FileNotFoundException ex) {
            //Logger.getLogger(BufferedReaderExample.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            //Logger.getLogger(BufferedReaderExample.class.getName()).log(Level.SEVERE, null, ex);
          
        } finally {
            try {
                reader.close();
                fis.close();
            } catch (IOException ex) {
                //Logger.getLogger(BufferedReaderExample.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}