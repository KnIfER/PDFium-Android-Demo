package com.knizha.PDocViewer;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.io.IOException;

public class PDocBenchMarkctivity extends AppCompatActivity {
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//ImageviewDebugBinding UIData = DataBindingUtil.setContentView(this, R.layout.imageview_debug);
		
		
		try {
			//PDocument pdoc = new PDocument(this, "/sdcard/myFolder/sample_hetero_dimension.pdf");
			PDocument pdoc = new PDocument(this, "/sdcard/myFolder/Gpu Pro 1.pdf");
			
			
			CMN.rt();
			Bitmap bm = Bitmap.createBitmap(16, 16, Bitmap.Config.ARGB_8888);
			for (int i = 0; i < 10; i++) {
				bm = pdoc.drawTumbnail(bm, i, 1);
			}
			long time = System.currentTimeMillis() - CMN.ststrt;
			
			Toast.makeText(this, "PDF_RENDER TIME::" + time, Toast.LENGTH_LONG).show();
			CMN.Log("PDF_RENDER TIME::", time);
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
