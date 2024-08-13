Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA017C52D7F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Aug 2024 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y+R8QkZbSMKsmqtU4odEr+8l//qid3JRLgnH17ggUsE=; b=JJ4k+aqXRIZhap
	xxTWCu8x3KHpVIGFYAGlHiNHRgYkhYCDbEE3LpczKBrL3RanTKj+YZU1eyaSO2HQkXhHeZEJ2JKCT
	xZ5tQMNeOCkRLMaoT+xL342m06QQAGZeVGtHkFc6tcvufmRKPQE6lsndGJ9MsckFcrgcoHOeKEn7N
	m21gbbNgWckGBKIsc0fVc27VW8QISNvtRoV96yBCu84D+lxvtNNI3d+/n4oM5OxvxJO032MGq425W
	Tg6Eh31Zl1myfdqhtP68l1aBGo0voLw6jtT9yrcxbMnHmtydh3FKXY/+KDokZg9JPl/6J19/xdn5r
	ztfycxgneCGVDsbdDK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmSj-00000002oHA-16S0;
	Tue, 13 Aug 2024 08:01:01 +0000
Received: from mail.widebizscope.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmSf-00000002oFK-2bP9
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Aug 2024 08:01:00 +0000
Received: by mail.widebizscope.pl (Postfix, from userid 1002)
	id 75D352466A; Tue, 13 Aug 2024 10:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=widebizscope.pl;
	s=mail; t=1723536051;
	bh=7b2Hseb9QY/049WYSH5jOQc1GsDAtRo2MBj6O2PAhWg=;
	h=Date:From:To:Subject:From;
	b=qIED8Kc6zxXxhrIWO+Cf4num1bySfVUNNA9IgvqW0MFXC1WF7MPc63zsmph82PPst
	 wloIXVUv/jfH112JKk2SCpHjbrP8lTgnASgy18PXR8RIkstidpXyy2B2XRTc3xfqV+
	 BbCnRMjPtFNTGlfOggUc9LKdxlPcHoqn+ndoMKdRo8uVEnQ85iHgpS3QuT+yZN4rX0
	 jZBxL8ebKhbrD04PMsMYwzSkEtPsD6B03UIbCOl7kxWVAKzMgQDlrVLHST8wO+FBIV
	 QsO2UIYqTMqUcX36OdsPe/NB3ui+KtQWFGheTbno29CVYM4Y0yzLk3X6DU/y77BG6q
	 /Tx3cyz9SKY/Q==
Received: by mail.widebizscope.pl for <linux-snps-arc@lists.infradead.org>; Tue, 13 Aug 2024 08:00:44 GMT
Message-ID: <20240813084500-0.1.d2.rm2o.0.3arp8r2jf6@widebizscope.pl>
Date: Tue, 13 Aug 2024 08:00:44 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@widebizscope.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Faktury
X-Mailer: mail.widebizscope.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_010058_358699_9BE9190B 
X-CRM114-Status: UNSURE (   0.06  )
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

U3phbm93bmkgUGHFhHN0d28sCgpDenkgem1hZ2FqxIUgc2nEmSBQYcWEc3R3byB6IHByb2JsZW1h
bWkgcMWCeW5ub8WbY2kgZmluYW5zb3dlaiB3eW5pa2FqxIVjeW1pIHogZMWCdWdpY2ggdGVybWlu
w7N3IHDFgmF0bm/Fm2NpIG9kIGtsaWVudMOzdz8gCgpOYXN6ZSB1c8WCdWdpIGZha3RvcmluZ293
ZSBtb2fEhSBiecSHIHJvendpxIV6YW5pZW0sIGt0w7NyZWdvIHBvdHJ6ZWJ1amUgUGHFhHN0d2Eg
ZmlybWEsIGFieSBzenliY2llaiB6YW1pZW5pYcSHIHd5c3Rhd2lvbmUgZmFrdHVyeSBuYSBnb3TD
s3drxJkuCgpKZcWbbGkgemFsZcW8eSBQYcWEc3R3dSBuYSBuYXR5Y2htaWFzdG93eW0gZG9zdMSZ
cGllIGRvIMWbcm9ka8OzdyBmaW5hbnNvd3ljaCBwbyB3eXN0YXdpZW5pdSBmYWt0dXJ5LCB6YXBy
YXN6YW0gZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpTemN6ZXBhbiBBbmRyeXN6Y3p1awoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1h
cmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
