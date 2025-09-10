Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C436DCA101F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Sep 2025 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=anBLIfQpd5IW5qzyx9UTVck32vX5hzLfYlwuAmAmqGE=; b=3v/kUQT/JAabat
	xSl2w3kZdE86YrIolghodvsyhhXNztiJTT9kcqcCgev3He2mLa8NmvXimSAHSLAehxxmzKwBmWkJP
	KZCHVAGaHbi/IfVqQSY+bEX87GMjgxt5B43aFr1F9PJ2Wbu/ZQfwACXn/z4mOBwTtOawFIOwzPVnK
	vUoPlGw7e5eHCobVDKoDnemiLQfy58Y1W6QwY0IDNnvffXtF0o5b/tZKSECWqJTx3m6965W9ypDC9
	v882CWhjddsajiEPDFOQqdLlCEC7QqyDwsefsn8fmuWeLaUbBzfn4hcdT9yDFPNohv2OVbK9r3AEF
	XXUQJOnUcGREwlDZ02fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFNP-0000000CbHL-28ag;
	Wed, 10 Sep 2025 07:36:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFNO-0000000CbGs-2dRP
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=; b=fKmeV+6mc0s6oD3TV7YnN+vmoj
	pVEj7i2y2XX4JXiwe/ahg88/3EFIv3zAd3J9R/GdX/cZ0JSU2w4LzCMiFaLKglTKERK3ctb3HUzCO
	5GlEYVt+6HLXLE8/30Wyd2XfkUcwl9jODfyDf5ZsHKQsL3y3rxgoxaaLbJ8KWWZc4oabHu+VwpKZm
	u/s40M8C0UpL1hWgJA8NLC/cTWPvbA6xvadJJV2VVMb86Ij6q+/3PWUNDP7s7C26iAOY4/erlC9JA
	kL88tnTGxnoJXyJciIXaFVF/wXl4wUkLKdGkiPpIXVy/o+Jr7zKDquNPS32UGlq0hQEWbJ8dKCRJk
	7F5lTjYw==;
Received: from mail.bizosto.pl ([151.80.59.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFNL-00000005ljK-3eef
	for linux-snps-arc@lists.infradead.org;
	Wed, 10 Sep 2025 07:36:21 +0000
Received: by mail.bizosto.pl (Postfix, from userid 1002)
	id BCB1623C78; Wed, 10 Sep 2025 07:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizosto.pl; s=mail;
	t=1757489760; bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=;
	h=Date:From:To:Subject:From;
	b=m7tSmZ6gO57PlZRzCNpaj2VfulVFNAiplg1ZBaxEgwpqAISQNEY8V5biAAh1wDT4V
	 rSQWlXCiqtnwh67rVmWojFgKigmiZmx2uIF7JCHMZ3249YXuyItZemG8LbEqBWJFNQ
	 sk73tB9Ge3I/kP/eTTwe9AufvlafV0Wnr6vEuRyOHiYXWd/D+89+Mbo1/cyB3LFE4U
	 FioUhwLVYRHon+1HvSp6d2VK8b/NNOMFhtxlKxyNIgjkjyJK1dWEmK8P9Auk5qu3hZ
	 7GcRDdEkdxbhIXX449hefQ7EpFjAkcZ0KM36gfIT4nzx/CtzBqC47GYUQBk8zV1hIH
	 jAppvXq38D8vg==
Received: by mail.bizosto.pl for <linux-snps-arc@lists.infradead.org>; Wed, 10 Sep 2025 07:35:57 GMT
Message-ID: <20250910064500-0.1.3v.1ahou.0.w1epglerl6@bizosto.pl>
Date: Wed, 10 Sep 2025 07:35:57 GMT
From: "Kamil Nakielski" <kamil.nakielski@bizosto.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zatrudnienie nowej osoby
X-Mailer: mail.bizosto.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_083620_001979_431C89D1 
X-CRM114-Status: UNSURE (   1.44  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB3IHNwcmF3aWUgemF0cnVkbmllbmlhIHBy
YWNvd25pa8OzdyB6IFVrcmFpbnkgdyBQYcWEc3R3YSB6YWvFgmFkemllLgoKU3RhbGUgb2JzxYJ1
Z3VqZW15IGZpcm15IHByb2R1a2N5am5lIHcgdHltIHRlbWFjaWUuIEplxZtsaSBwb3RyemVidWpl
Y2llIFBhxYRzdHdvIGRvZGF0a293ZWdvIHBlcnNvbmVsdSBkbyBwcmFjeSwgcHJvc3rEmSBvIHdp
YWRvbW/Fm8SHLiAKCgpQb3pkcmF3aWFtCkthbWlsIE5ha2llbHNraQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
