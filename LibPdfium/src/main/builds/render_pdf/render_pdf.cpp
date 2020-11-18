#include "src/pdfium_aux.h"
#include <iostream>
#include <filesystem>

#include "public\fpdf_save.h"

#include <windows.h>


struct PdfToFdWriter : FPDF_FILEWRITE {
	int dstFd;
};


HANDLE hFile;
FILE *fp,*fw;           /*文件指针*/

static bool writeAllBytes(const int fd, const void *buffer, const size_t byteCount) {
	char *writeBuffer = static_cast<char *>(const_cast<void *>(buffer));
	size_t remainingBytes = byteCount;


	//fputs(writeBuffer, fw);

	//if(0)
	while (remainingBytes > 0) {
		//ssize_t writtenByteCount = write(fd, writeBuffer, remainingBytes);
		DWORD writed=0;

		if (!WriteFile(hFile, writeBuffer, remainingBytes, &writed, NULL)) {
			if (errno == EINTR) {
				continue;
			}
			//LOGE("Error writing to buffer: %d", errno);
			return false;
		}
		remainingBytes -= writed;
		writeBuffer += writed;
	}
	return true;
}

static int writeBlock(FPDF_FILEWRITE* owner, const void* buffer, unsigned long size) {
	const PdfToFdWriter* writer = reinterpret_cast<PdfToFdWriter*>(owner);
	const bool success = writeAllBytes(writer->dstFd, buffer, size);
	if (success < 0) {
		//LOGE("Cannot write to file descriptor. Error:%d", errno);
		std::cout << "Cannot write to file descriptor. Error:%d" << errno << std::endl;
		return 0;
	}
	return 1;
}


static bool writeAllBytesInc(const int fd, const void *buffer, const size_t byteCount) {
	char *writeBuffer = static_cast<char *>(const_cast<void *>(buffer));
	size_t remainingBytes = byteCount;

	while (remainingBytes > 0) {
		//ssize_t writtenByteCount = write(fd, writeBuffer, remainingBytes);
		DWORD writed=0;

		if (!WriteFile(hFile, writeBuffer, remainingBytes, &writed, NULL)) {
			if (errno == EINTR) {
				continue;
			}
			//LOGE("Error writing to buffer: %d", errno);
			return false;
		}
		remainingBytes -= writed;
		writeBuffer += writed;
	}
	return true;
}

static int writeBlockInc(FPDF_FILEWRITE* owner, const void* buffer, unsigned long size) {
	const PdfToFdWriter* writer = reinterpret_cast<PdfToFdWriter*>(owner);
	const bool success = writeAllBytesInc(writer->dstFd, buffer, size);
	if (success < 0) {
		//LOGE("Cannot write to file descriptor. Error:%d", errno);
		std::cout << "Cannot write to file descriptor. Error:%d" << errno << std::endl;
		return 0;
	}
	return 1;
}

FPDF_WIDESTRING GetFPDFWideString(const std::wstring& wstr) {
	size_t length = sizeof(uint16_t) * (wstr.length() + 1);
	FPDF_WIDESTRING result = (FPDF_WCHAR*)malloc(length);
	char* result_span = new char[length];

	size_t i = 0;
	for (wchar_t w : wstr) {
		result_span[i++] = w & 0xff;
		result_span[i++] = (w >> 8) & 0xff;
	}
	result_span[i++] = 0;
	result_span[i] = 0;
	return result;
}


int main(int argc, char* argv[]) 
{

	try {
		argv[1]=(char*)"D:\\Books\\sig-notes.pdf";
		//argv[1]=(char*)"D:\\PDFJsAnnot\\1.pdf";
		//argv[1]=(char*)"D:\\PDFJsAnnot\\gunners.pdf";
		//argv[1]=(char*)"D:\\PDFJsAnnot\\page0.pdf";
		//argv[1]=(char*)"D:\\PDFJsAnnot\\YotaSpec02.pdf";



		RenderPdfOptions options(argc, argv);
		if (options.invalid()) {
			std::cout << "usage:\nrender_pdf.exe inputfile.pdf [output_file.png]" << std::endl;
			return -1;
		}

		options._scale=4.f;

		options._range._to=13;

		InitPdfium(options);



		auto doc = FPDF_LoadDocument(options.inputFile().c_str(), options.password().c_str());




		if(1) {
			std::cout << "rendering " << std::filesystem::path(options.inputFile()).filename() << "...\n";
			auto[from_page_index, to_page_index] = options.range().get(doc);
			from_page_index=0;
			to_page_index=options.range()._to;
			int num_pages = to_page_index - from_page_index + 1;
			for (auto index = from_page_index; index <= to_page_index; index++) {
				auto page=FPDF_LoadPage(doc, index);
				auto bitmap = RenderPage(page, options.scale());
				auto out_filename = options.outputFile( (num_pages > 1) ? std::optional<int>(index) : std::nullopt);
				WriteImage( bitmap.get(), options.imageFormat(), out_filename );
				FPDF_ClosePage(page);
				std::cout << "    generated " << std::filesystem::path(out_filename).filename() << ".\n";
			}
		}

		// E:\GPU Pro 1.pdf
		// D:\PDFJsAnnot\1.pdf

		auto page = FPDF_LoadPage(doc, 0);



		if(true) {
			double width, height;
			int result = FPDF_GetPageSizeByIndex(doc, 0, &width, &height);
			std::cout << "Page 0 FPDF_GetPageSizeByIndex Dimension : " << width << "x" << height << ".\n";
			double px, py;
			FPDF_DeviceToPage(page, 0, 0, width, height, 0, width, 0, &px, &py);
			int dx, dy;
			FPDF_PageToDevice(page, 0, 0, width, height, 0, width, 0, &dx, &dy);
			std::cout << "Page 0 Size : " << px << "x" << py << ".\n";
			std::cout << "Device 0 Size : " << dx << "x" << dy << ".\n";
		}

		if(true) {
			int annotSize = FPDFPage_GetAnnotCount(page);

			std::cout << "Page 0 Annot Size = " << annotSize << ".\n";

			FPDF_WCHAR buffer[512]={0};
			char buffer_c[512]={0};

			std::cout << "Page 0 Annot Size = " << annotSize << ".\n";


			for(int i=0;i<annotSize;i++) 
			{
				FPDF_ANNOTATION aI = FPDFPage_GetAnnot(page, i);
				if(1) { // Apperance string
					auto ap = FPDFAnnot_GetAP(aI, 0, buffer, 512);
					// /MWFOForm D
					WideCharToMultiByte(CP_ACP, 0, (WCHAR*)buffer, ap, buffer_c, 512, 0, 0);
					std::cout << "Annot AP = " << ap << " = " << buffer_c << ".\n";
				}


				std::cout << "Annot FLAG = " << FPDFAnnot_GetFlags(aI) << ".\n";

				std::cout << "Annot TYPE = " << FPDFAnnot_GetSubtype(aI) << ".\n";

				FPDFAnnot_SetAP(aI, FPDF_ANNOT_APPEARANCEMODE_NORMAL, 0);

				FPDFAnnot_SetFlags(aI, 0);

				if(false) {
					auto objs = FPDFAnnot_GetObjectCount(aI);
					for(int j=0;j<objs;j++)  {
						FPDF_PAGEOBJECT obj = FPDFAnnot_GetObject(aI, j);
						std::cout << "Annot OBJ = " << obj << ".\n";
					}
				}

				auto attachCount = FPDFAnnot_CountAttachmentPoints(aI);

				std::cout << "Page 0 Annot attachCount = " << attachCount << ".\n";

				for(int j=0;j<attachCount;j++)  {
					FPDF_PAGEOBJECT obj = FPDFAnnot_GetObject(aI, j);
					FS_QUADPOINTSF points;
					FPDFAnnot_GetAttachmentPoints(aI, j, &points);
					std::cout << "Attach Points = " << points.x1 << ", " << points.y1 << ".\n";
					std::cout << "Attach Points = " << points.x2 << ", " << points.y2 << ".\n";
					std::cout << "Attach Points = " << points.x3 << ", " << points.y3 << ".\n";
					std::cout << "Attach Points = " << points.x4 << ", " << points.y4 << ".\n";

					//FPDFPage_CloseAnnot();

					double userWidth, userHeight;
					int deviceX, deviceY;
					int width = points.x1;
					int height = points.y1;
					FPDF_DeviceToPage(page, 0, 0, width, height, 0, width, 0, &userWidth, &userHeight);
					FPDF_PageToDevice(page, 0, 0, userWidth, userHeight, 0, width, height, &deviceX, &deviceY);

					std::cout << "Attach cvt.Points = " << deviceX << ", " << deviceY << ".\n";

					FS_RECTF rect;
					FPDFAnnot_GetRect(aI, &rect);
					

					std::cout << "Rect = " << rect.left << ", " << rect.top << ", " << rect.right << ", " << rect.bottom << ".\n";



				}
			}


		}
		

		if(0) {
			hFile = CreateFile(L"D:\\PDFJsAnnot\\tmp.pdf", GENERIC_WRITE, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			//fopen_s(&fw,"D:\\PDFJsAnnot\\tmp.pdf", "r+");//r+可以选择位置，a只能在最后加入内容，w会清空原来内容
		
			FS_RECTF rect{0,0,100,100};


			FPDF_ANNOTATION highlightAnnot = FPDFPage_CreateAnnot(page, FPDF_ANNOT_HIGHLIGHT);
			FPDFAnnot_SetRect(highlightAnnot, &rect);

			FPDFAnnot_SetColor(highlightAnnot, FPDFANNOT_COLORTYPE_Color, 0, 0, 25, 128);
			//FPDFAnnot_SetColor(highlightAnnot, FPDFANNOT_COLORTYPE_InteriorColor, 0, 0, 25, 128);


			//UnloadPage(doc);

			//FPDFAnnot_AddInkStroke(highlight_annot.get(), kFirstInkStroke, kFirstStrokePointCount);

			//FS_QUADPOINTSF  quadpoints{0,0,100,0,100,100,0,100};
			FS_QUADPOINTSF  quadpoints{0, 100, 100, 100, 0, 0, 100, 0};
			//FS_QUADPOINTSF  quadpoints{0,0,0,100,100,100,100,0};

			//FS_QUADPOINTSF  quadpoints{0,0,100,0,100,100,0,100};
			//FS_QUADPOINTSF  quadpoints{0,0,0,100,100,100,100,0};
			FPDF_DOCUMENT asd;

			std::cout << "FPDFAnnot_AppendAttachmentPoints " << FPDFAnnot_AppendAttachmentPoints(highlightAnnot, &quadpoints);
			//FPDFAnnot_SetAttachmentPoints(highlightAnnot, 0, &quadpoints);

			FPDFPage_CloseAnnot(highlightAnnot);


			PdfToFdWriter writer;
			writer.dstFd = 0;
			writer.WriteBlock = &writeBlockInc;

			//FPDF_BOOL success = FPDF_SaveAsCopy(doc, &writer, FPDF_NO_INCREMENTAL);
			FPDF_BOOL success = FPDF_SaveAsCopy(doc, &writer, FPDF_INCREMENTAL);
			std::cout << "FPDF_SaveAsCopy success? " << success << "...\n";

			CloseHandle(hFile);
		}





FPDF_TEXTPAGE text = FPDFText_LoadPage(page);


int len = FPDFText_CountChars(text);

FPDF_WCHAR* buffer = new FPDF_WCHAR[(len+1)];

		 TCHAR* wchars = new TCHAR[(len+1)];

char* bufferStr = new char[2*(len+1)];


int retlen = FPDFText_GetText(text, 0, len, buffer);

		for(int i=0;i<len+1;i++) {
			wchars[i]=buffer[i];
		}

WideCharToMultiByte(CP_UTF8, 0, (TCHAR*)buffer, (len+1), bufferStr, 2*(len+1), 0, 0);

std::cout<<bufferStr<<std::endl;

std::cout<<retlen<<" == lenlen == "<<len<<std::endl;

if(0)
for(int i=0;i<len;i++)
{
	std::cout<<buffer[i]<<std::endl;
}

if(0)
for(int i=0;i<len;i++)
{
	std::cout<<(char)FPDFText_GetUnicode(text, i)<<std::endl;
}

		FPDF_CloseDocument(doc);
		//fclose(fw);
		std::cout << "complete.\n";
	} catch (std::runtime_error e) {
		std::cout << "error: " << e.what() << std::endl;
		return -1;
	} catch (...) {
		std::cout << "error: unkown fatal error occurred" << std::endl;
		return -1;
	}

	return 0;
}




