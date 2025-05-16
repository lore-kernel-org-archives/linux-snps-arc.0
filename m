Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF8C3ABDD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 May 2025 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=igvfLS4PgwgUCIjXafpVMnFSDdt+AyybjJ1MTt2Typ4=; b=R4ctV+Z+x9JCgl
	TkzLhO8XfGktyOKwX1rpNl+2oiOfow8kLyyohUZFplYBSrpWis919uyYALjbreZ8l4B3sBa7XvAe8
	bMMKqB6XTZ3Q+Nv5kwpVKtKtW3jXTzch4fvkFx6tjS3/ck1iZTUGawNVULyOYI6v8LfL+lPEHwmVp
	Ubz3s6UzEaMWEqPRWO/fM3wL4GON+vTrg137BSiNrawNQAugG2cd7F709r/bK+xDnRqCsoZj3Oe8D
	5dzbX638D93w2+/QfCk6KHCK7dYGQZmKOWwAVTyDKm8r88inR7GyshUfT46BAe37YuEG++LNUxzIS
	vB6bTaVo6/ckD4mGRlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqCI-00000002lSM-2CgA;
	Fri, 16 May 2025 08:13:38 +0000
Received: from mail.genbiz.pl ([94.177.225.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFq4J-00000002k7j-1t5F
	for linux-snps-arc@lists.infradead.org;
	Fri, 16 May 2025 08:05:24 +0000
Received: by mail.genbiz.pl (Postfix, from userid 1002)
	id 2852B833B3; Fri, 16 May 2025 10:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=genbiz.pl; s=mail;
	t=1747382722; bh=LcirBK93cQ+85aSOiW37iCYU65joqNAj97HHfwOn6nA=;
	h=Date:From:To:Subject:From;
	b=xuWoM6WEplpK2wtNuwU+QcsxaF9W7byssb/FCkR1AxTqXJWfDkw+B+LuILX/iQzzE
	 tzRkMxYPE7Gn4Bzr3gGv8/EL7piWi8uw3iJt6VQiCrdLsAEOMz1PLZbpJUe+nT0pRU
	 MqWJ5xfT67PHtP7GlMsw/dgHvLThuFEBfqkw9yU5fcDfiMfuDzewFX/jXCVZSwIsTj
	 hzgSYufp0cv/P4w68eEldll0rd2W46nU05ccrwez0huiHCQ4zKACwzvFU4sb/DsN98
	 eAvHqDDjCtGHvCWfWh+qwk8wETmDcR5sHFcKb+gLteIKPwiLzoAr3Eg3SKcpFxKjoS
	 AMYfb8TTABgwA==
Received: by mail.genbiz.pl for <linux-snps-arc@lists.infradead.org>; Fri, 16 May 2025 08:05:09 GMT
Message-ID: <20250516084500-0.1.1e.1x0p.0.e6omebaomd@genbiz.pl>
Date: Fri, 16 May 2025 08:05:09 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@genbiz.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.genbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_010523_618792_F480F2D7 
X-CRM114-Status: UNSURE (  -0.28  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/IAoKClBvemRyYXdpYW0KUmFkb3PFgmF3IEdyYWJvd3NraQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
