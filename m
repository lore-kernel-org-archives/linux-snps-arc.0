Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C0CA0FE8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JR86VWJUep4/ALsRz5zFOIzTSp17LGHILJXwxtXqct0=; b=OuaNEegzn35mho
	LMUCgK+R42FitgLcJcXUdrCGrL2K9IKKldSH/qXpgQDCfw0oHEaXaBhgz9G8fLYIO4GweORNIFNa6
	p8jANRsDeaM58Qcx7KsCUDDscHZ8qYSxxkkH4Pbu2VDyzZDdaidTHef/EO2t87wOpszenrFj7FaCo
	5nKpVxBq1Le0WMY6KkNGq6ewHV5L7AW7sbP73OMkzIjuludLRK0HwPJUGzlePaCi6nXn7eozSd/IC
	xzzYcgv/dKyzKO7RLRJnA7UFpgs4xNqDYGDpaXI07L1yxEixC2qDZE7mRXB83a7TGORoV01T58lz+
	InXxxi8MONjPysehSI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmV-000000032AH-1p0q;
	Fri, 22 Aug 2025 15:34:19 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMut-00000001uMJ-2BI4
	for linux-snps-arc@lists.infradead.org;
	Fri, 22 Aug 2025 08:14:32 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id B7F514E39A; Fri, 22 Aug 2025 10:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1755850351; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=IRvptqsQrxy3ysO5QBBepHn5oK1w2x/UUEoDG73ZsgzwW1jaNCuAIJuMrEm/WA+Ui
	 DiB43hu+klm5nGjlE0trdogQUSF6KET6C+bakgBmi2bHA1ElGT9Ufhhy/C2MBixP8k
	 Myhj8hQiHVr4e+4H2D80EiuPlETgWPWhdcublWs3H6/2BHaDvJV9p8naExF0Py5Ez2
	 guaL7gGuwR4Y4J91RsPNAKUGpHqNQ2qQfkm7WX2XLsqhxW1XHb3LqPtUplVZ6GOo5Y
	 x7u85UvqaANEbwbyTNNIrC2fNjTiko/FhxlPDc1Q49fDuMB7+tvlWvFwqzu2o3ut0r
	 0iuA+Y5qujjtA==
Received: by mail.fintara.pl for <linux-snps-arc@lists.infradead.org>; Fri, 22 Aug 2025 08:11:05 GMT
Message-ID: <20250822084500-0.1.bf.39yn6.0.i1tjr5qpf6@fintara.pl>
Date: Fri, 22 Aug 2025 08:11:05 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_011431_819473_E5417ECE 
X-CRM114-Status: UNSURE (   0.24  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
