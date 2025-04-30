Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B2DC369DC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Apr 2025 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqWy7q1x2uCLjfLcHX7PlZS1IURnIwGJZbyHIj4pMHk=; b=q4CnQ21IZtYb1n
	WbQnietgwHlec0ikq2XJ7tYWamRqESoXE3WzAbw69v6uPsB5yeP7qUrNPFbhjMOKr+bDmT7iZ3ZYP
	pYrd/c97rxo/JbAZxqvBR16IOwK9LOArtrbbHPFyNfBQeU5h7Ka5duykO/Bsg3vvRqVxQ0WSiLmns
	kOyWR7cA19Dne7eqK4I+jpVN2hpG2Obb03rjOGQde0NQ2+j7bJA82oDrDc55EntD7ARI6TBeYojEP
	L03yLide4WFcaEBwZ4FIId5rNcvRnMGwXCkzo2UTf9AJAVIHKAddjAk4FLjhOaZoI4OUR6iB7q0vC
	xTsGSBLdoSG026ZFQy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2Pc-0000000C5Gr-1KeA;
	Wed, 30 Apr 2025 08:03:24 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA26D-0000000C1ig-2Om1
	for linux-snps-arc@lists.infradead.org;
	Wed, 30 Apr 2025 07:43:22 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 710E7834D0; Wed, 30 Apr 2025 09:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1745998900; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=lEPkoHmOYEFdW75Fb93UCxDh/mQrzVj34I89i8rtEbuUEeln1hUi+bylH/zUkljsi
	 w7XG1VivR4LnO36GLnIYRWgf+KOw58nFCZktJyBDutjNB0YC06/ZDZ0vlVuMpiQhgS
	 ZAuVHms51bTdKrTUMvlLDk8GJV/Gc0ach3ZGea/6DdnjmYQMNLbtXVGvzoxdVnifHa
	 fkHsjlhzUV5owplbWHqYTNb0BUCKUA41WAHatT6+mYbHMsPltNJRNwbPy/T6y6gf4M
	 xujlwLqQPuko3rvAv92HY8dAYeGIHbxutS21fI+XMqYBPR1GQBxdKe9kKMXiAmQupc
	 AtcLXQZ8ydmZQ==
Received: by mail.commetro.pl for <linux-snps-arc@lists.infradead.org>; Wed, 30 Apr 2025 07:41:06 GMT
Message-ID: <20250430084500-0.1.2a.qbdt.0.zi5gl06dpr@commetro.pl>
Date: Wed, 30 Apr 2025 07:41:06 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_004321_734108_70801B3C 
X-CRM114-Status: UNSURE (   0.38  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXNucHMtYXJjCg==
