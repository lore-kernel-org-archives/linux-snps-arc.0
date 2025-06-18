Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D29C71157
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Jun 2025 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JR86VWJUep4/ALsRz5zFOIzTSp17LGHILJXwxtXqct0=; b=2c2tDguZzvMHyB
	hJWXc6GmdFMS5BJMbx/aahINrpbmAk7sbRI2h70TULWfNbV+nGOHb99PvIxCoEcWYSdC1TecE3LYK
	0Lm4CiJW6uvQz3Uh7qHXxpxQWw2Mt8tZq2orvzJT6RLCid5D59pL7+vRz7jdSdv3Ms55XWQ4qNbuw
	P8vnpj79eUbceZ5Btc4oOZjK05cB4kspgsaQfuQzfEsyQyef1Gj+6OGUxk1uiVuPF6SADuyAkr1xT
	TZlO4lmoQAmWFwnCs/qpWzH6Ii4t+UcIzVH5LBd96030rXFlOBeMexkz0C8dODdDU3XcYo0zeCsMg
	7aGRw+TIETEget7D05tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRny8-00000009Nq8-3KRW;
	Wed, 18 Jun 2025 08:16:28 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnvI-00000009NUh-3beF
	for linux-snps-arc@lists.infradead.org;
	Wed, 18 Jun 2025 08:13:35 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id 7BD1A4AB87; Wed, 18 Jun 2025 10:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1750234345; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=P10IaWV4ryW0zxtDHBBGcwEHyJsl/ba70o8CDmxBDLWLI5LY5B3aMyUwNv8u6rKYb
	 lwswrXEitRiM69/SdVslM8+DjS5cB2PIgvZJ0KPz9sQV13/g6Wl96xTljEKrelAHR4
	 Gr0Uewn9L2gOvF2fxPyfeQa1c6M0trQoD6ZjngLxasYpRPscH1IojaDH1HC5xjXci/
	 zTYd0ov+VqFfKQ+/v6JglySnVeKK94n9a/TKinSqWW6ki3S6o2fQUYnmxwZYMUyaBR
	 CFT1mPTxhAAdmymAUYjPTuhjgl+hsLVNCQyuoHCnGyAbrymlVi5zWOBqtp8czV+j6b
	 yBjrCjNwvI7mw==
Received: by mail.fintara.pl for <linux-snps-arc@lists.infradead.org>; Wed, 18 Jun 2025 08:11:11 GMT
Message-ID: <20250618084500-0.1.a6.2lpx6.0.lcurkp9uhi@fintara.pl>
Date: Wed, 18 Jun 2025 08:11:11 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_011333_575224_5064DFBD 
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
