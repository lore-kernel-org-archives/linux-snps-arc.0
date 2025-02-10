Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0CC0219D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 Feb 2025 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SwbNqVRrovvtUlxKRQYkulyMSd8PeixKBxXp/oI0siI=; b=rB7Y4rDopA13jt
	WEhrt01+H8CdjcyBu0fM6iDCmm38VZ8drnpd8hvWB1oJ8U4z2W54UgNy94Tn2Ag/ViOlx5TnDaUo0
	8MdNJ8BHIyoKcM+01yySHsVSE20JyV+5hIQrT4HQJIvPWODS4r07syNY2n0psbsY2joQlM1zGsyvk
	QFS06ascW6ZjgrOYwiyAOKwKFRg/BT6p19ddGwby8Sysn1/NjKl+lAJbz2Hw/otnnGezhoj5xK/UX
	H34lsWqYlTjup0wcZVl8KKUy/Bi/kT/Zsz4YYLTWoTSEL3QquN2bzcjw6QGmaPlWh7gPU32RU32wk
	0mhX20kVs0qQYumC5cXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thPIS-0000000GgBI-1Ug7;
	Mon, 10 Feb 2025 08:37:40 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thPIP-0000000Gg8V-1xtN
	for linux-snps-arc@lists.infradead.org;
	Mon, 10 Feb 2025 08:37:39 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 9168AA3B2B; Mon, 10 Feb 2025 09:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1739176640; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=LrKR0WbpZ5gyC+347LrGQQGnIVfUX9rKI046QkAocc0wBne4KgzJXs128I6XRRXC+
	 WIvOpHDsI/HuOorWk7uxAtQ3u9akeSA7UNG5RYRVSfDfzyWKmeeAaatZNRdkwRmmyT
	 fLHcwlageG9kgcvK+iaGD1Q9hrtvCMNZ+1EASm9cDuREc+RYU6y6PqoXN93+1s6D/I
	 MVOuIsZBG5VbbTsKR3wU8wJM1kmOXdl4Sot2kpVxZEB+Qa5EB86N1zUeyQbVpp5r7H
	 7TV4VNDj5R1BWf0OsNh819WCSZywPkm/TjIAHhic+Rw0rd+YOCmQMwJaVsve1DNI4l
	 AKsh6PaBZ1lyw==
Received: by mail.novaplan.pl for <linux-snps-arc@lists.infradead.org>; Mon, 10 Feb 2025 08:36:15 GMT
Message-ID: <20250210084500-0.1.jr.17j2i.0.adfi2o6ny7@novaplan.pl>
Date: Mon, 10 Feb 2025 08:36:15 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_003738_191982_82EFB3BB 
X-CRM114-Status: UNSURE (   1.33  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
