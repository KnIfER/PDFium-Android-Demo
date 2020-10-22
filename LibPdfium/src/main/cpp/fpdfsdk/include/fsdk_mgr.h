// Copyright 2014 PDFium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Original code copyright 2014 Foxit Software Inc. http://www.foxitsoftware.com

#ifndef FPDFSDK_INCLUDE_FSDK_MGR_H_
#define FPDFSDK_INCLUDE_FSDK_MGR_H_

#include <map>
#include <memory>

#include "core/include/fpdftext/fpdf_text.h"
#include "fsdk_common.h"
#include "fsdk_define.h"
#include "fx_systemhandler.h"

class CPDFSDK_Document;
class CPDFSDK_PageView;
class CPDFSDK_Widget;
class IFX_SystemHandler;


class CPDFSDK_Document {
 public:

  // Gets the document object for the next layer down; for master this is
  // a CPDF_Document, but for XFA it is a CPDFXFA_Document.
  UnderlyingDocumentType* GetUnderlyingDocument() const {
  return GetPDFDocument();

  }

  // Gets the CPDF_Document, either directly in master, or from the
  // CPDFXFA_Document for XFA.
  CPDF_Document* GetPDFDocument() const {
  return m_pDoc;
  }



  int GetPageCount() { return m_pDoc->GetPageCount(); }

  FX_BOOL GetChangeMark() { return m_bChangeMask; }
  void SetChangeMark() { m_bChangeMask = TRUE; }
  void ClearChangeMark() { m_bChangeMask = FALSE; }


 private:
  std::map<UnderlyingPageType*, CPDFSDK_PageView*> m_pageMap;
  UnderlyingDocumentType* m_pDoc;
  std::unique_ptr<CPDF_OCContext> m_pOccontent;
  FX_BOOL m_bChangeMask;
  FX_BOOL m_bBeingDestroyed;
};


class CPDFSDK_PageView final {
 public:


  CPDF_Page* GetPDFPage() { return m_page; }


  CPDFSDK_Document* GetSDKDocument() { return m_pSDKDoc; }

  void GetCurrentMatrix(CFX_Matrix& matrix) { matrix = m_curMatrix; }



  void SetValid(FX_BOOL bValid) { m_bValid = bValid; }
  FX_BOOL IsValid() { return m_bValid; }
  void SetLock(FX_BOOL bLocked) { m_bLocked = bLocked; }
  FX_BOOL IsLocked() { return m_bLocked; }

 private:

  CFX_Matrix m_curMatrix;
  UnderlyingPageType* m_page;
  CPDFSDK_Document* m_pSDKDoc;
  CPDFSDK_Widget* m_CaptureWidget;
  FX_BOOL m_bTakeOverPage;
  FX_BOOL m_bValid;
  FX_BOOL m_bLocked;
};

#endif  // FPDFSDK_INCLUDE_FSDK_MGR_H_
