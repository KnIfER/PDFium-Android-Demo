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




int main(int argc, char* argv[]) 
{
	hFile = CreateFile(L"D:\\tmp\\tmp.pdf", GENERIC_WRITE, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);





	//fopen_s(&fw,"D:\\tmp\\tmp.pdf", "r+");//r+可以选择位置，a只能在最后加入内容，w会清空原来内容

	try {
		RenderPdfOptions options(argc, argv);
		if (options.invalid()) {
			std::cout << "usage:\nrender_pdf.exe inputfile.pdf [output_file.png]" << std::endl;
			return -1;
		}
		InitPdfium(options);
		ScopedFPDFDocument doc(FPDF_LoadDocument(options.inputFile().c_str(), options.password().c_str()));








		std::cout << "rendering " << std::filesystem::path(options.inputFile()).filename() << "...\n";

		auto[from_page_index, to_page_index] = options.range().get(doc.get());
		int num_pages = to_page_index - from_page_index + 1;
		for (auto index = from_page_index; index <= to_page_index; index++) {

			ScopedFPDFPage page(FPDF_LoadPage(doc.get(), index));
			auto bitmap = RenderPage(page.get(), options.scale());
			auto out_filename = options.outputFile( (num_pages > 1) ? std::optional<int>(index) : std::nullopt);
			WriteImage( bitmap.get(), options.imageFormat(), out_filename );
			std::cout << "    generated " << std::filesystem::path(out_filename).filename() << ".\n";
		}



		FS_RECTF rect{0,0,100,100};

		ScopedFPDFPage page(FPDF_LoadPage(doc.get(), 0));
		FPDF_ANNOTATION highlightAnnot = FPDFPage_CreateAnnot(page.get(), FPDF_ANNOT_HIGHLIGHT);
		FPDFAnnot_SetRect(highlightAnnot, &rect);

		FPDFAnnot_SetColor(highlightAnnot, FPDFANNOT_COLORTYPE_Color, 0, 0, 25, 128);
		FPDFAnnot_SetColor(highlightAnnot, FPDFANNOT_COLORTYPE_InteriorColor, 0, 0, 25, 128);



		//UnloadPage(doc);

		//FPDFAnnot_AddInkStroke(highlight_annot.get(), kFirstInkStroke, kFirstStrokePointCount);

		//FS_QUADPOINTSF  quadpoints{0,0,100,0,100,100,0,100};
		FS_QUADPOINTSF  quadpoints{0,0,100,0,0,10,100,10};
		//FS_QUADPOINTSF  quadpoints{0,0,0,100,100,100,100,0};

		//FS_QUADPOINTSF  quadpoints{0,0,100,0,100,100,0,100};
		//FS_QUADPOINTSF  quadpoints{0,0,0,100,100,100,100,0};

		std::cout << "FPDFAnnot_AppendAttachmentPoints " << 
			FPDFAnnot_AppendAttachmentPoints(highlightAnnot, &quadpoints);
		//FPDFAnnot_SetAttachmentPoints(highlightAnnot, 0, &quadpoints);

		FPDFPage_CloseAnnot(highlightAnnot);


		PdfToFdWriter writer;
		writer.dstFd = 0;
		writer.WriteBlock = &writeBlock;
		FPDF_BOOL success = FPDF_SaveAsCopy(doc.get(), &writer, FPDF_NO_INCREMENTAL);

		std::cout << "FPDF_SaveAsCopy success? " << success << "...\n";















		CloseHandle(hFile);
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




