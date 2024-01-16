Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8891C47077
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Jan 2024 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmIMzcmwIt4IWasovq+iQ8DFFmXK0h48w3zcnYg5B+Y=; b=ef4mLEWqQ2ZVPB
	n03Xwl/btnG9/RgeWCbn7Xl47yIH55BpJD/4wSsTjWpNIBfEOtD+YzcWeJjqs3Suvb4L1bqhm1/Dg
	728VWEWbpMPZ2xoh6YEfji/fQtmrTs7lRcZn642x3vVcymEk4Ozr45k7ecfBCMHarqFrb74U+H4k4
	4a4xjPVvatMA2wkq2QMFDY+ExXIiLQuIf86SMnpCYgfYTsDdgECLaRHEx3ihARRmhRZEoubO9+I6n
	GXA1NdcLWqsNMb4BnVW9nZ8dIWzYHyFpoO8JYpK19bn0mAncS7TZmtXXHypu9yP1KwPzJUDYJOrQy
	eKhXQNGHJkhOcF86mNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPer3-00BQCr-0X;
	Tue, 16 Jan 2024 08:31:29 +0000
Received: from mail.entropitech.pl ([141.94.250.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPeqz-00BQCB-0c
	for linux-snps-arc@lists.infradead.org;
	Tue, 16 Jan 2024 08:31:27 +0000
Received: by mail.entropitech.pl (Postfix, from userid 1002)
	id 664C2A3D39; Tue, 16 Jan 2024 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=entropitech.pl;
	s=mail; t=1705393878;
	bh=3C0lFFl3FyqJxhWazybBxamNtYGn+JlC8TtPqc/zclI=;
	h=Date:From:To:Subject:From;
	b=M/HA5xnHtdNXKwWq9eVsqTY7KjYiOR7B9aiJzrnh8001VZLegzgmadm4Z5/q59Ak9
	 BtxDmEqUiF4nLNRwObdWCVY8y6HiXU3SU+vIpzCwtsd9WBfhscOvo8DlnJOUf52KMZ
	 H0iXCxT79LAIhqDfr/VygznobWflr1AtxaDJRTESuc5IIYZ+UNTiccxVgUuPcWkv14
	 CcRjrTz50wZAJhJdqoGYQGSKKr+qAXj/8stD3d+u33ca90fO8SDHWGkSaLpzEnMnsF
	 lsc/c+K23Ds1Mvapr7CedfPJ/6C8duDfhFwS5bbUdQv70cw7Imt6+ErJv966GDejmk
	 3907lmRb9fArA==
Received: by mail.entropitech.pl for <linux-snps-arc@lists.infradead.org>; Tue, 16 Jan 2024 08:31:12 GMT
Message-ID: <20240116074500-0.1.ed.p5ql.0.5hbo153fig@entropitech.pl>
Date: Tue, 16 Jan 2024 08:31:12 GMT
From: "Szymon Faryk" <szymon.faryk@entropitech.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Zam=C3=B3wienie_na_klimatyzatory_postojowe?=
X-Mailer: mail.entropitech.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_003125_960182_09ADC84C 
X-CRM114-Status: UNSURE (   1.18  )
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

RHppZcWEIGRvYnJ5LCAKCmtvbnRha3R1asSZIHNpxJkgeiBQYcWEc3R3ZW0sIHBvbmlld2HFvCB3
IG9mZXJjaWUgbmFzemVqIGZpcm15IHpuYWpkxIUgUGHFhHN0d28gc3plcm9raSB3eWLDs3Igbm93
b2N6ZXNuZWogaSBpbnR1aWN5am5laiBrbGltYXR5emFjamkgcG9zdG9qb3dlaiBkbyBhdXQgaSBt
YXN6eW4uCgpPZmVydWplbXkgc3dvaW0gS2xpZW50b20gdXJ6xIVkemVuaWEgY3pvxYJvd3ljaCBw
cm9kdWNlbnTDs3csIG1hasSFIFBhxYRzdHdvIG1vxbxsaXdvxZvEhyB3eWJyYcSHIGluc3RhbGFj
asSZLCBrdMOzcmEgc3BlxYJuaSB3c3p5c3RraWUgb2N6ZWtpd2FuaWEgaSB6YXBld25pIGtvbWZv
cnQgdyBrYcW8ZHljaCB3YXJ1bmthY2guCgpNYW15IHcgc3dvaW0gYXNvcnR5bWVuY2llIGtsaW1h
dHl6YXRvcnkgcG9kxYJhd2tvd2UsIGthbWVyb3dlLCBrbGltYXR5emF0b3J5IHogcGlsb3RlbSBv
cmF6IHJvendpxIV6YW5pYSBkb3Bhc293YW5lIGRvIGthbXBlcsOzdyBpIMWCb2R6aS4KClpham11
amVteSBzacSZIG5pZSB0eWxrbyBzcHJ6ZWRhxbzEhSwgYWxlIHLDs3duaWXFvCBmYWNob3d5bSBk
b3JhZHp0d2VtIGkgbW9udGHFvGVtIGtsaW1hdHl6YWNqaS4gxZp3aWFkY3p5bXkgcsOzd25pZcW8
IHVzxYJ1Z2kgc2Vyd2lzb3dlIGkgcHJ6ZWdsxIVkeS4gCgpDenkgc8SFIFBhxYRzdHdvIHphaW50
ZXJlc293YW5pPyAKCgpQb3pkcmF3aWFtClN6eW1vbiBGYXJ5awoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
