Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3812C369B2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Apr 2025 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bqWy7q1x2uCLjfLcHX7PlZS1IURnIwGJZbyHIj4pMHk=; b=NplEiSfmON/HQQ
	Lt7sPi8hSzscmMmFUqQu+0krGDEHZPPzpja0OsDlnatcrQcJis+5IhWHpQr9Mg2Zf/Vz1d5vem73w
	5vAPkSKx+ylQh17J4EWom4PIAWniHrkX+M7Qgw2CZueL96/6/TCIZUSbE8NPSYcQTxbqmmE3hOLJ+
	plW7+ZSLNkXoE/wY6pDv0GXDLbAo88drcg4nGhqu6KsVnngfwqXZbMueA5vaeIvZUJ5d+EKoJ/saG
	0Qx1xBgpVZ2YDNaU20Vu5v7YHAuoUS0HfTP8y/M85612EZfb8RWt1hP/GUEF0E90zjITXZPow3W2R
	G9I4bRGZnjjeE5e7Wg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ear-00000000zbw-0ekN;
	Mon, 14 Apr 2025 07:51:01 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ean-00000000zbT-3fmE
	for linux-snps-arc@lists.infradead.org;
	Mon, 14 Apr 2025 07:51:00 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 018E082E4F; Mon, 14 Apr 2025 09:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1744617053; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=zLIZl/l18ilQfwaSpqWUfRHV2lbl6kFt3z+c+N11jTfRWTUE0JqGMsGPXUgEooUM4
	 X6GJzjE5FHXy6XxwaTAB7lpVSMkFLuwsHv66SoICKQUF1MlQmre+dlbkRvwuXmLRvt
	 xsCVZCsAJAEQ1VJfAa3QAbZbp7VJorrODVBIojzsEicGQghfOi9tOqoEvYXuD/hc6P
	 TbWtqFgTrUrfmuQUd+calcxjPIlQr75+NakqejDxrE3D5Q5chb50Eeh/BdMD8Jsl9t
	 wGeqW7zDsYyXURON+XruWgXSugOxTshI5S6c5vvu64e+556KnzrNUswaU2Jca2uLXn
	 SH6p7FeIEfR6Q==
Received: by mail.commetro.pl for <linux-snps-arc@lists.infradead.org>; Mon, 14 Apr 2025 07:50:37 GMT
Message-ID: <20250414084500-0.1.1z.n23c.0.ljeqig5dr5@commetro.pl>
Date: Mon, 14 Apr 2025 07:50:37 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_005058_580891_1DF9BF69 
X-CRM114-Status: UNSURE (  -0.00  )
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
