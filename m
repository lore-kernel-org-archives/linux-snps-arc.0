Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9493C3ABB0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 May 2025 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ijs/uK4FUIU5XVZCieX0MkBFefL4UywcpHZd+r2uOg4=; b=EQdaJiCwvDhX4e
	dYkjWGtXvtg1mgGwcc+vCE0/ZPaOocoR9N/J1p1ay1LkUiSEMeprQIYrgl4V1/MKCLEKloloVjIGN
	fyx3fsuQ6j9hLTBbD0umhDTnachQweOFf7ybYtv35gG+QozQNF1Npo8AlZ4djoM6vQkIlrYTmR2Lz
	f6ITaEqxv+Wtdj66NzDzb2vULtQyd6eLOH1fbp8R4rPG6OTfMM7R1IFLu72n82u0gb0pQV02/sIxO
	G9ncnwWHPT5Zq/emU8j9ZiLGiTpmP9bAHOlTnENrP5P4j1aNHlUnL5EbsVWRi9S9hXn3eZeOyZFFC
	p3BibN0/Y69hEn3QsYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqlw-00000006ivy-0y4X;
	Mon, 05 May 2025 08:01:56 +0000
Received: from mail.bizotrix.pl ([217.61.97.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqjp-00000006iXq-3LfB
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 May 2025 07:59:46 +0000
Received: by mail.bizotrix.pl (Postfix, from userid 1002)
	id 0CAAE83141; Mon,  5 May 2025 09:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizotrix.pl; s=mail;
	t=1746431745; bh=lA009qM0j4YRzFUfPgrXk13BGm3QuXjamWZpOmZ+a7M=;
	h=Date:From:To:Subject:From;
	b=SdGsYrO3tq9LUWMtFEOkeTaEq2bi/FngFXbaBsnDasHHQg3Y4TJ4giM3u4Y6moyFk
	 UZZw5rnGwHzPYUa235y1bHzcxMBPjSHhya1W2W/i7Ti2YfOSE/tBx3jmJm7hYMg0jN
	 QoJJ4ENM9yUd78tvVCXWO9yyQwyRMUYdVYD5WqbmPMdWdui/Tl3pTGqw+Cpuy0LYTV
	 IGKbSmzelkTzWdeciWNXFXNrsAE1AXHuhG42BE0+aRwuxXl8wVuKwEYRP6stA+6fxY
	 CC+kLEWabNpGEfM8mlpsOFhPB3GrMOKh82v3Q/kKC/Ce1z9UcxIdT3ONzs60osEBmz
	 mFXmPPZGArhmA==
Received: by mail.bizotrix.pl for <linux-snps-arc@lists.infradead.org>; Mon,  5 May 2025 07:55:44 GMT
Message-ID: <20250505084500-0.1.9x.k1s2.0.ac9b736mqo@bizotrix.pl>
Date: Mon,  5 May 2025 07:55:44 GMT
From: "Filip Gerlowski" <filip.gerlowski@bizotrix.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania_?=
X-Mailer: mail.bizotrix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_005945_963270_A3805DF5 
X-CRM114-Status: UNSURE (   0.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIHN0cm9uxIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KRmlsaXAgR2VybG93c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
