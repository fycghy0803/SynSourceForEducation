package com.hysoft.util.zip;

import java.io.File;
import java.io.FilenameFilter;

public class ExtensionFilter implements FilenameFilter {
	private String ext = "";
    public ExtensionFilter(String ext) {
    	this.ext = "." + ext;
    }
    
	public boolean accept(File dir, String name) {
		return name.endsWith(this.ext);
	}
}
