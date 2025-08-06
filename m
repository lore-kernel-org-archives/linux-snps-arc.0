Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61EAC87FD1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Aug 2025 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKQOZVkYlPSYg9eiydUdXjXrHgH5NM92GO0h2IKYDvQ=; b=Vsj9aPbkXaNOgZ
	dbio/WAFpZhnoAmSVQJEyb23QD5Qua4pWrL8eqWZkXW5Afg4eSmp2djjPlY5/hWLmongADx0AgskU
	Rio/fWgSj4017a11XYCNYF7VLOzliY3jfJzWHrvY50iLJl9xzm9PhFmKB2sjR9NaE4xQUBcJidxOc
	trKjjTRDPXHBnyFJpGdkEeljC+ufyhAA/Y3/7ymrHuVgJui5kPPJPSyTrRAVW3VNw8UuWfEmmTEJP
	/mjbBjSTUmY1vsmxQNvuOO4IVHpedn6cQRDxV0yB9nnx6yVzYOBGTLi7zqeiiQ3EWyqATGdF+Drov
	dGT1SWsSQTtUeZAXQC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYv1-0000000EYzo-29pW;
	Wed, 06 Aug 2025 07:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYv0-0000000EYzd-48PA
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 06 Aug 2025 07:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=; b=cacaZhaF7kQNuDsG0wS8OsMwU1
	ISEgOzU/Sisyh+3HK5ZgynM3YauUOMatVCLef2QysFaB9oF9e6zXWz5b+cSCo1oVWDut/u7KbH7PD
	PCl92FTQ2dA6csS3earWhxBEcN1nr4n5Cu0OZO0f+k5/8h5rkz0SL9R8NH4DOVIdXoy5FXhO2HH1x
	8dka/xaog89dA5dEP9BBwmFgoFnj3bXkzGaRJuHmOsvUYeESYif0tdW3rkx2TwyiGF792j3UWnpv4
	HApgiN+1jsDDmmiEPQ9VF6NO42p5xaq4b3gMAKMeetl3JzvMdLnQSlC7l0GgqpcVyzoqmyt/lYGBh
	VWMYnjkw==;
Received: from mail.fundixo.pl ([57.128.173.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYuy-0000000EFEC-0Q9C
	for linux-snps-arc@lists.infradead.org;
	Wed, 06 Aug 2025 07:50:37 +0000
Received: by mail.fundixo.pl (Postfix, from userid 1002)
	id F348B4DF59; Wed,  6 Aug 2025 09:46:22 +0200 (CEST)
Received: by mail.fundixo.pl for <linux-snps-arc@lists.infradead.org>; Wed,  6 Aug 2025 07:45:29 GMT
Message-ID: <20250806084500-0.1.gw.3nfv6.0.qr37s0pbr4@CyberCitadel.pl>
Date: Wed,  6 Aug 2025 07:45:29 GMT
From: "Marek Kucharski" <marek.kucharski@fundixo.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_085036_255570_F5A1C045 
X-CRM114-Status: UNSURE (   0.53  )
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
