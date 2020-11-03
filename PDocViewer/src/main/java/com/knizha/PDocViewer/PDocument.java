package com.knizha.PDocViewer;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.ParcelFileDescriptor;
import android.util.SparseArray;

import com.shockwave.pdfium.PdfDocument;
import com.shockwave.pdfium.PdfiumCore;
import com.shockwave.pdfium.util.Size;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicLong;

public class PDocument {
	public final String path;
	public /*final*/ PDocPage[] mPDocPages;
	public static PdfiumCore pdfiumCore;
	public PdfDocument pdfDocument;
	public int maxPageWidth;
	public int maxPageHeight;
	public long height;
	public int _num_entries;
	private int _anchor_page;
	private HashMap<Integer, Bitmap> bTMP = new HashMap<>();
	
	class PDocPage {
		final int pageIdx;
		final Size size;
		public int startY = 0;
		public int startX = 0;
		public int maxX;
		public int maxY;
		long OffsetAlongScrollAxis;
		final AtomicLong pid=new AtomicLong();
		PDocPage(int pageIdx, Size size) {
			this.pageIdx = pageIdx;
			this.size = size;
		}
		
		public void open() {
			if(pid.get()==0) {
				synchronized(pid) {
					if(pid.get()==0) {
						pid.set(pdfiumCore.openPage(pdfDocument, pageIdx));
					}
				}
			}
		}
		
		
		@Override
		public String toString() {
			return "PDocPage{" +
					"pageIdx=" + pageIdx +
					'}';
		}
		
		public int getHorizontalOffset() {
			if(size.getWidth()!=maxPageWidth) {
				return (maxPageWidth-size.getWidth())/2;
			}
			return 0;
		}
	}
	
	public PDocument(Context c, String path) throws IOException {
		this.path = path;
		if(pdfiumCore==null) {
			pdfiumCore = new PdfiumCore(c);
		}
		File f = new File(path);
		ParcelFileDescriptor pfd = ParcelFileDescriptor.open(f, ParcelFileDescriptor.MODE_READ_ONLY);
		pdfDocument = pdfiumCore.newDocument(pfd);
		_num_entries = pdfiumCore.getPageCount(pdfDocument);
		mPDocPages = new PDocPage[_num_entries];
		height=0;
		for (int i = 0; i < _num_entries; i++) {
			Size size = pdfiumCore.getPageSize(pdfDocument, i);
			PDocPage page = new PDocPage(i, size);
			mPDocPages[i]=page;
			page.OffsetAlongScrollAxis=height;
			height+=size.getHeight()+60;
			//if(i<10) CMN.Log("mPDocPages", i, size.getWidth(), size.getHeight());
			maxPageWidth = Math.max(maxPageWidth, size.getWidth());
			maxPageHeight = Math.max(maxPageHeight, size.getHeight());
		}
		if(_num_entries>0) {
			PDocPage page = mPDocPages[_num_entries-1];
			height = page.OffsetAlongScrollAxis+page.size.getHeight();
		}
	}
	
	public Bitmap renderBitmap(PDocPage page, Bitmap bitmap, float scale) {
		Size size = page.size;
		int w = (int) (size.getWidth()*scale);
		int h = (int) (size.getHeight()*scale);
		//CMN.Log("renderBitmap", w, h, bitmap.getWidth(), bitmap.getHeight());
		page.open();
		pdfiumCore.renderPageBitmap(pdfDocument, bitmap, page.pageIdx, 0, 0, w, h ,false);
		return bitmap;
	}
	
	public Bitmap renderRegionBitmap(PDocPage page, Bitmap bitmap, int startX, int startY, int srcW, int srcH) {
		int w = bitmap.getWidth();
		int h = bitmap.getHeight();
		page.open();
		//CMN.Log("renderRegion", w, h, startX, startY, srcW, srcH);
		pdfiumCore.renderPageBitmap(pdfDocument, bitmap, page.pageIdx, startX, startY, srcW, srcH ,false);
		return bitmap;
	}
	
	public Bitmap drawTumbnail(Bitmap bitmap, int pageIdx, float scale) {
		PDocPage page = mPDocPages[pageIdx];
		Size size = page.size;
		int w = (int) (size.getWidth()*scale);
		int h = (int) (size.getHeight()*scale);
		page.open();
		Bitmap OneSmallStep = bitmap;
		boolean recreate=OneSmallStep.isRecycled();
		if(!recreate && (w!=OneSmallStep.getWidth()||h!=OneSmallStep.getHeight())) {
			if(OneSmallStep.getAllocationByteCount()>=w*h*4) {
				OneSmallStep.reconfigure(w, h, Bitmap.Config.ARGB_8888);
			} else recreate=true;
		}
		if(recreate) {
			OneSmallStep.recycle();
			OneSmallStep = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
		}
		renderBitmap(page, OneSmallStep, scale);
		//pdfiumCore.renderPageBitmap(pdfDocument, bitmap, pageIdx, 0, 0, w, h ,false);
		return bitmap;
	}
	
}
