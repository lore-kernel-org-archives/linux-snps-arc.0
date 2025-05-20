Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F6EC3DA6D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 May 2025 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SwbNqVRrovvtUlxKRQYkulyMSd8PeixKBxXp/oI0siI=; b=I9RaFY38vaJtVT
	3eFs3Vkd3UImrUND5FuYdNOBEA8i9OXzyd1BAlP3QL7CZXdgHjbJPYFGSTulFQ/pG59fWtvx+yshK
	IG0p4MP9O3hvdbCZ7jlLjMuMYreyfpRKMbSMw4iM+c8pPXLxBiC2nt3L0bEqaqt00RdSSiU5NZel/
	FT9XuWzLybZRqTYPP7XoUEFPqJLReUV9LAqIcRC0b4i+r0tZ6rMR84cY2RdfbmXrKthfvmsaZNA0J
	0JDzpV3QsHbEQVuzoqie7i2lbItaKSU+pd44PFfwla/obUEmBYSHxD6P7ZFAF3lkbViakKZSdz7YK
	gJhCErnqgLRMitL80CYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHyz-0000000Bxum-47K5;
	Tue, 20 May 2025 08:05:53 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHHyw-0000000BxrP-2QcY
	for linux-snps-arc@lists.infradead.org;
	Tue, 20 May 2025 08:05:52 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 4A994A48AD; Tue, 20 May 2025 10:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1747728147; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=V5Jlmz+eOG1H2ZGyq4S6ucJgQotcPY125sxGHmi2u3XV1fSjevcTOZZyiGv80rnQu
	 H/8BnJ0b5VcTfvMnveUOf5d4cDvXtHOZ/fUKonNW2tCwvmf+zcFpH/U1OV6Nt0C708
	 0uKQnCarSAFz5u1pG8dJqd89PwCUPoiZb1PEq8wsRsKNqVf9eIFaXIrpOrr0ijERtS
	 HoQMZ94kJgiE2A2hA5YeQIM+FF2FMbsHJw0peY5IT5IZy+Yq7i6mj5G8ZM9HBMJFIR
	 VaFfB1Xj7TISUGF66Sw8kNnO40nwG//J94IiGZQ3zc03eB7qdAzkoxBUp/uEAaWIDA
	 +DKD4sagTgRNw==
Received: by mail.novaplan.pl for <linux-snps-arc@lists.infradead.org>; Tue, 20 May 2025 08:00:37 GMT
Message-ID: <20250520084500-0.1.ln.1ypj5.0.vl4g1650nr@novaplan.pl>
Date: Tue, 20 May 2025 08:00:37 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_010551_298961_CA098DDF 
X-CRM114-Status: UNSURE (   0.28  )
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
