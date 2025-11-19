Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DADDCF3180
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Nov 2025 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9lyeTH0W4N3Yyuw85w9vyAohbiFLrcVgEYAMaFh/ZV0=; b=T6N6SbpdHSjW3E
	fsVhG9cPKHAEos+UnU+S8hYscI0J0OWjl8bSkP2onDvgZSbVltjkeo1cUPas8hKa/QPNi1g1VdskW
	bF/27zkIahshxrzPrmVyq7Ax34WFxH3CJtgY/6V099uKwwHC2XW/CSS/j0zAeUBR6GiRLyRXlecn7
	wE0h2x1iHukZud7wcH6i7yKCZrQN9DR9Z0JBVQSMs8GwvjiGLGgIdm4DN8x8/ujaL/oD4kr7NDRGU
	/OfukFCCSEmz8qW6q8F42me+BVe0V/pcta9nGVNlckeCKyANd++Ar2ozkZuS6ddFg+6199NE3Tf6N
	9e1vw7Y4czodag6a+V2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdzn-00000002pQ6-2oNU;
	Wed, 19 Nov 2025 08:56:59 +0000
Received: from mail.novencio.pl ([162.19.155.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdzl-00000002pPS-0l6G
	for linux-snps-arc@lists.infradead.org;
	Wed, 19 Nov 2025 08:56:58 +0000
Received: by mail.novencio.pl (Postfix, from userid 1002)
	id 1E6EC24D9D; Wed, 19 Nov 2025 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novencio.pl; s=mail;
	t=1763542612; bh=fIh67CnJs35z4uTVN1yEzBZIG1sWJSjOc8Phu/rB5ug=;
	h=Date:From:To:Subject:From;
	b=eo8KybtrW7nPfiOudiaGyoiQFbi6pU8PyqC/qFN5cvNQt1W5Z9/CecDrCMlJF+OCS
	 rTuwVz/Ty3gsh3IpaiS2YWrz8esd06fcWQ9Shb+rh6QhJlL+Z+/By6aC+UJbhkK7lp
	 O10ZeKB0c5r+4kwhY/rbQxdzglmOVXbIYkgdPL+Wu5fDA1cDDSmdvDVubvhpx8iIfX
	 nH7ii38OPsB6BhPWQaLQhUyQr1CtItkAWGiY3nv2hUtqg19mQPr1JW0Yxf0Q016aWm
	 fODd8oBCkSy+tXCjCcdFmYuhGXEAUp4vWwvQEu1otal63cttAEbrl9XRhDBA3mK49Q
	 ZGClN8ATVxlMQ==
Received: by mail.novencio.pl for <linux-snps-arc@lists.infradead.org>; Wed, 19 Nov 2025 08:55:55 GMT
Message-ID: <20251119074742-0.1.5y.z3no.0.hr0cfc5rbp@novencio.pl>
Date: Wed, 19 Nov 2025 08:55:55 GMT
From: "Marek Poradecki" <marek.poradecki@novencio.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Wiadomo=C5=9B=C4=87_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.novencio.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_005657_496573_D16A9FE0 
X-CRM114-Status: UNSURE (   1.82  )
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

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgcHJ6ZWRzacSZYmlvcmNvbSB3cHJvd2FkemnEhyBtb2Rl
bCB3eW1pYW55IHdhbHV0LCBrdMOzcnkgbWluaW1hbGl6dWplIHdhaGFuaWEga29zenTDs3cgcHJ6
eSByb3psaWN6ZW5pYWNoIG1pxJlkenluYXJvZG93eWNoLgoKS2llZHl2IG1vxbxlbXkgdW3Ds3dp
xIcgc2nEmSBuYSAxNS1taW51dG93xIUgcm96bW93xJksIGFieSB6YXByZXplbnRvd2HEhywgamFr
IHRha2kgbW9kZWwgbcOzZ8WCYnkgZHppYcWCYcSHIHcgUGHFhHN0d2EgZmlybWllIC0geiBnd2Fy
YW5jasSFIGluZHl3aWR1YWxueWNoIGt1cnPDs3cgaSBwZcWCbnltIHVwcm9zemN6ZW5pZW0gcMWC
YXRub8WbY2k/IFByb3N6xJkgbyBwcm9wb3p5Y2rEmSBkb2dvZG5lZ28gdGVybWludS4KCgpQb3pk
cmF3aWFtCk1hcmVrIFBvcmFkZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zbnBzLWFyYwo=
