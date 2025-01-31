Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF854C0218D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Jan 2025 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKQOZVkYlPSYg9eiydUdXjXrHgH5NM92GO0h2IKYDvQ=; b=SICWb8e8fGt/J1
	80d3w7TT61JRcd37XVHTs3RoLUu2p2+6RLyXdlyg/LZnh7xXxXA292+WLuM0uQZOOCf8Ln8z5NDCV
	kW+j42hMYmcMiIGLNFX1c/Z59PLtq4E7PVPo/sf+QWYthDkICQH/MdtFn+PhrOExuCJ+9yEJCx1Bu
	VhYthlxB4B9vuqpd68aR8FMIGUM1npdIhsrUN71v3E9r9Z1g73Udi8yN9jg3a7XSf2jLVfg7LwGuK
	Vv0i5XumRLJRul+RPsMXMMsBDg8Fi1Y0IwY3qOq55mNFuZzx+cHd0hrgue3mW+qoX2vIFiSRwt1ip
	q2V0X0LaZyryrzisLjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmV6-0000000ADcU-2SwY;
	Fri, 31 Jan 2025 08:35:44 +0000
Received: from mail.cybercitadel.pl ([57.128.173.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmV4-0000000ADZv-0YVP
	for linux-snps-arc@lists.infradead.org;
	Fri, 31 Jan 2025 08:35:43 +0000
Received: by mail.CyberCitadel.pl (Postfix, from userid 1002)
	id C77F34E2AD; Fri, 31 Jan 2025 09:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=CyberCitadel.pl;
	s=mail; t=1738312352;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=;
	h=Date:From:To:Subject:From;
	b=fiK5KLWbn917/Z/HXURxFoaGSBH/zQVrWOmzafHrElHwHMo0C+SlWG7xFluU8oR6N
	 r8Fm+tTWxRJyGpf3+RAUdfvE90MNLb+S3VNi88G0J6FoTJu7hBSCaq/Hf4OlBVAxFQ
	 fmBWluR5gbOdkK9QXebb91RPGaDNPSRH2ljSIJQBwjBKxrG//N3br32KM3hsQu0wpj
	 tKyEFWe7ugTBpHXEaXXciJRn0F8TvCMURy5Hg2m4zODCDyUBSSNhEVQTRApE2jpybc
	 DF9YuHeZVcC+AxgNgT2BTUCBGQuV23mFnGyMOrqv0DbAD2vbJ1ExKFvhdJSwuOrSJB
	 4LF8VrYY7kxMg==
Received: by mail.CyberCitadel.pl for <linux-snps-arc@lists.infradead.org>; Fri, 31 Jan 2025 08:30:32 GMT
Message-ID: <20250131084500-0.1.d9.2drtb.0.1kexkyl0qg@CyberCitadel.pl>
Date: Fri, 31 Jan 2025 08:30:32 GMT
From: "Marek Kucharski" <marek.kucharski@cybercitadel.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_003542_306263_1F63190B 
X-CRM114-Status: UNSURE (   1.09  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYXJlayBLdWNoYXJza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
