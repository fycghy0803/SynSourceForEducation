package com.hysoft.util.zip;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public class ZipUtil {  
    private int k = 1; // ����ݹ��������  
 
    public static void main(String[] args) {    
    	ZipUtil book = new ZipUtil();  
        try {  
            book.zip("C:\\Users\\Gaowen\\Desktop\\ZipTestCompressing.zip",  
                    new File("C:\\Users\\Gaowen\\Documents\\Tencent Files"));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
    }  
  
    public void zip(String zipFileName, File inputFile) throws Exception {  
        ZipOutputStream out = null;  
        BufferedOutputStream bo = null;
        
        try {
        	out = new ZipOutputStream(new FileOutputStream(zipFileName));
        	bo = new BufferedOutputStream(out);
            zip(out, inputFile,"", bo);
        }catch(Exception e) {
        	e.printStackTrace();
        	throw e;
        } finally {
        	if(bo != null) {
        		bo.close();
        	}
        	
        	if(out != null) {
                out.close(); // ������ر�
        	}
        }
    }  
  
    private void zip(ZipOutputStream out, File f, String base,  
            BufferedOutputStream bo) throws Exception { // ��������
    	if (f.isDirectory()) {  
            File[] fl = f.listFiles();  
            if (fl.length == 0) {  
                out.putNextEntry(new ZipEntry(base)); // ����zipѹ�������base  
            }  
            
            for (int i = 0; i < fl.length; i++) {
            	String tmpPath =  (base.equals("") ? "" : (base + "/")) + fl[i].getName();
                zip(out, fl[i],tmpPath , bo); // �ݹ�������ļ���  
            }  
            k++;  
        } else {  
            out.putNextEntry(new ZipEntry(base)); // ����zipѹ�������base  
            FileInputStream in = null;  
            BufferedInputStream bi = null;
            int b;            
            try {
            	in = new FileInputStream(f);
            	bi = new BufferedInputStream(in);
	            while ((b = bi.read()) != -1) {  
	                bo.write(b); // ���ֽ���д�뵱ǰzipĿ¼  
	            }  
            }catch(Exception e) {
            	e.printStackTrace();
            	throw e;
            }finally {
            	if(bi != null) bi.close();  
                if(null != in) in.close(); // �������ر�	
            }
              
        }  
    }
    
    public void unzip(String path) {
    	File parFile = new File(path);
    	ExtensionFilter efilter = new ExtensionFilter("zip");
    	File[] zipFiles = parFile.listFiles(efilter);
    	for(int i = 0; i < zipFiles.length;i++) {
    		boolean opt = false;
    		ZipInputStream zin = null;
    		BufferedInputStream bin = null;
    		ZipEntry entry = null;
    		File fout = null;
    		try {
				zin = new ZipInputStream(new FileInputStream(zipFiles[i].getAbsoluteFile()));
				bin = new BufferedInputStream(zin);
				
				while( (entry = zin.getNextEntry()) != null && !entry.isDirectory() ) {
					fout = new File(path,entry.getName());
					if(!fout.exists()){  
                        (new File(fout.getParent())).mkdirs();  
                    }  
					FileOutputStream out = null;
					 BufferedOutputStream bout = null;
					try{
	                    out = new FileOutputStream(fout);  
	                    bout = new BufferedOutputStream(out);  
	                    int b;  
	                    while((b=bin.read())!=-1){  
	                        bout.write(b);  
	                    }
	                    
					} catch(Exception e) {
					   e.printStackTrace();	
					} finally {
						try{
							if(null != bout) bout.close();
						}catch(Exception e){}
						
						try{
							if(null != out) out.close();	
						}catch(Exception e){}
	                    
					}
				}
			    opt = true;	
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
		        
				try {
					if(bin != null) bin.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				try {
					if(zin != null) zin.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if(opt) {
					zipFiles[i].delete();	
				}
			}
    	}
    }
}  