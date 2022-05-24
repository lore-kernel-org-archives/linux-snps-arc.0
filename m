Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79761C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rgKNLW8lTKRr7Qmkvu1c57sI32a7JmSKCIlL/l9JNYc=; b=hF5sl9kNAS7UcE
	rpWt+FtnfsKNkUE5Pes9VyLPDNCbpZllK67Va+IAAEk5ekJaqBKSDr2odvGq55oj5aRgcQaN12Ibu
	Q4DrEiqfCf9pX14baTRRzelbQl353QYtMxadjn38z9At/Yf5QJmYHpf2IMnHAXpNB+Ur6XYh/hNm8
	xld7lRvVxunAyKZA5h0Gqv+FAOlwdC7dUxem5pvmmm//moaTrj492uRbYCwdY4adX9SKOlmu+wWcs
	1b/4dNQVHjHeqxP/UZM1BlbOQR12h00qI4ilscrNjk9QsHSpH3UfQ6bX9iNRzzpOezjfK9uhrHhoD
	DQCK1odGxVGSSclUDKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqZg-00BAag-Vj; Wed, 25 May 2022 12:57:17 +0000
Received: from hwsrv-970840.hostwindsdns.com ([2607:5501:3000:21a5::2] helo=box.indicandustries.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntqZe-00BAZp-Hu
	for linux-snps-arc@lists.infradead.org; Wed, 25 May 2022 12:57:15 +0000
Received: from authenticated-user (box.indicandustries.com [104.168.149.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by box.indicandustries.com (Postfix) with ESMTPSA id 140D0108754
	for <linux-snps-arc@lists.infradead.org>; Tue, 24 May 2022 03:25:26 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=box.indicandustries.com; s=mail; t=1653384327;
	bh=V6VCn7WEbqHjVVQ20/+SYu6rwS1WmTHcxX88g+j430s=;
	h=Reply-To:From:To:Subject:Date:From;
	b=UZjO4sJ+d0pKDSuNvLHSJAC+bPalDVn7BSCuQQhmUJM/Fc0jzNCeiTFpqP8gTPeuO
	 Ygat4Y2kyRAGdWrNv1ZkjzjOgGF10eVql1GZox6mTjl7aPtN1KmFjV2Ox6zDTKUg2+
	 ZfCb0XEuAsO9nwqybZQrOf76k4LG7Ti4OowTN3QiCawWXSJRJoOniYTwh4U59PzOCC
	 ZB/CGnKCmsrkn4c5uVsnxhZ43FOAENH2bt6RHTpYD9T6ac7d9oPPFOXU2ujxfzljQD
	 NbEkpXAIoytIM0EHdr0fy7u5SHNvHO+Bs1guoWHyc6Yg1HRyKrf/JLB1EN8ZuW3Y/K
	 7H3wx0n5npUmA==
From: amjad.ali@box.indicandustries.com
To: linux-snps-arc@lists.infradead.org
Subject: Hello Sir, I seek your urgent consideration.
Date: 24 May 2022 11:25:26 +0200
Message-ID: <20220524112526.7982404986D1D3D2@box.indicandustries.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_055714_654917_E17F281E 
X-CRM114-Status: UNSURE (   1.49  )
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
Reply-To: amjalia90@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpHcmVldGluZ3M/IEkgYW0gQW1qYWQuIEkgd29yayB3aXRoIGEgbGVhZGluZyBCaW8g
RmlybS4gIER1ZSB0byAKdGhlIHNldGJhY2tzIG9mIHRoZSBwYW5kZW1pYywgbXkgY29tcGFueSBo
YXMgb3BlbmVkIGEgYmlkIGluIApzZWFyY2ggb2YgbmV3IHN1cHBsaWVycyBmb3IgYmFzaWMgcmF3
IG1hdGVyaWFscyBuZWVkZWQgaW4gCnByb2R1Y3Rpb24uCgpJIGFtIHNlZWtpbmcgYSByZXByZXNl
bnRhdGl2ZcKgYXMgSSBhbSBhIHN0YWZmLCBJIGNhbiBub3QgYmUgCmludm9sdmVkIGRpcmVjdGx5
LiBJdCBtYXkgbm90IGJlIHlvdXIgYXJlYSBvZiB3b3JrIGJ1dCB0aGUgCnByb2ZpdHMgYXJlIGdy
ZWF0IGFuZCBJIHdpbGwgZ3VpZGUgeW91IHRocm91Z2guIEkgaGF2ZSBhbHJlYWR5IApzb3VyY2Vk
IGEgbG9jYWwgc3VwcGxpZXIgZm9yIHRoaXMuIEkgb25seSBuZWVkIGEgcmVsaWFibGUgCnJlcHJl
c2VudGF0aXZlLgoKUGxlYXNlIGdldCBiYWNrIHRvIG1lIHNvIEkgY2FuIGV4cGxhaW4gdGhpcyBp
biBmdWxsLgoKQW1qYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
