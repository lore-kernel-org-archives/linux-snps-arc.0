Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB2FC433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 08:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sj7Pi6evXz6Eh3X9jYEU0b6IVPtd923tuAKgcvQBOmY=; b=hytvw4pABCyfX+
	jGE+AwAjFV01DF0uR++mj3WvbM7yz6PAA/rG/IkDGZjMVlY6XfNswjgnE+1bIQnzC6gNAwt3ULvMT
	PP2M4eRZA7pd7Ql4mJY7Zz/oXtVqmYX7/qTndQwRfAaMPiPBbF/KOCTfOosCp0LOrexTl3sdEn3ko
	b5p/XkS7UFoffHQ1S7IOY+w3DSYg6dIOdgsTkHKccXE7mcABKc5MZDyS7/L05ugWFI7HEkCoHbKtC
	uksJUtlZW9pEFDEVU7Z1xxosIrWfVp5y4s0Cr/ra8lQLZTkCmV1VaaoPH78CZ1ZaKM+BPKFeeyuKT
	bP1NP0+tKBT0M4c2qzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVTb-00H2Ps-I8; Fri, 27 May 2022 08:37:43 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuVTY-00H2No-Sy
	for linux-snps-arc@lists.infradead.org; Fri, 27 May 2022 08:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653640660; x=1685176660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e8+pSY1x+l3uGIZDMc8m/MwYXF+f6ONLrv/OSYV1yzM=;
  b=KXQYVgWOT2yycPoqROcCLXKQLd7m2iyAqmhHHkUeC77jW22M743Jag7Y
   dpl8mFjEp0QVe7pEyyFjJifF7aCRFaVzqc+xQBQaaqW3jCzGTcBiaOUjs
   Tqt58yMhJpJpAmuKJGOu43L/j5RAJJJGxBtVNfQMSYjdkhTKm8EpM1W3V
   D5WMyY/nAfW0ow0lbmm4bAuVYQ7y1KI+Mg9KsLtALLrZE/O+LNn24PKIl
   PXxV8V0SoRdhmwGgTyCw0fd/mwv/JNAVKNTGp4JV4A/HMOyQD1lM752+a
   iNThi2JaixW+7YgqY3WVEb6bNC8YAViPiI1hUSE8umsY+1Q14aARFU+P/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="299765310"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="299765310"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 01:37:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; 
   d="scan'208";a="746823906"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.33]) ([10.99.249.33])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 01:37:35 -0700
Message-ID: <04c05bd5-63c7-bbac-889c-6e9897f7b990@linux.intel.com>
Date: Fri, 27 May 2022 10:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ARC: bitops: Change __fls to return unsigned long
Content-Language: en-US
To: Vineet Gupta <vgupta@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-snps-arc@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com>
 <20220525144844.1571705-2-amadeuszx.slawinski@linux.intel.com>
 <17bdbca6-8352-50a8-0a3e-49ffe09422a2@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <17bdbca6-8352-50a8-0a3e-49ffe09422a2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_013740_982511_5221388A 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gNS8yNi8yMDIyIDU6NDIgQU0sIFZpbmVldCBHdXB0YSB3cm90ZToKPiBIaSwKPiAKPiBPbiA1
LzI1LzIyIDA3OjQ4LCBBbWFkZXVzeiBTxYJhd2nFhHNraSB3cm90ZToKPj4gQXMgcGVyIGFzbS1n
ZW5lcmljIGRlZmluaXRpb24gYW5kIG90aGVyIGFyY2hpdGVjdHVyZXMgX19mbHMgc2hvdWxkCj4+
IHJldHVybiB1bnNpZ25lZCBsb25nLgo+Pgo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBleHBl
Y3RlZCBhcyByZXR1cm4gdmFsdWUgc2hvdWxkIGZpdCBpbiB1bnNpZ25lZAo+PiBsb25nLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraTxhbWFkZXVzenguc2xhd2luc2tp
QGxpbnV4LmludGVsLmNvbT4KPiAKPiBBcHBsaWVkIHRvIGZvci1jdXJyLgo+IAo+IFRoeCwKPiAt
VmluZWV0CgpBbmQgYXBwYXJlbnRseSBfX2ZscyBpcyBkZWZpbmVkIGluIHR3byBwbGFjZXMgaW4g
QVJDIGhlYWRlciBhbmQgSSBvbmx5IApjaGFuZ2VkIG9uZSwgc2hvdWxkIEkgc2VuZCBpbmNyZW1l
bnRhbCBwYXRjaCBvbiB0b3Agb2YgYWxyZWFkeSBtZXJnZWQgCm9uZSBvciB2Mj8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
