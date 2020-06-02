Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9FBC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 18:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66772068D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 18:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lpv2HlrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66772068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/8G8gl957+H84u+8QisNXz6+i6FzpLdYBQlG9RoPF8=; b=Lpv2HlrWkNl1Vm
	5MzlE29samSX3tmGTd0/FhuRte6WkASSpraKV7GEkg29XMnzbkqm2wwZtAIRXHJ2hM0IjubNS5urd
	OMftl+HmuX/oaEghk/bArMz3CcRbbW182xGEZ8CC7pk5rfpRbDdk2OBrfIwTUuu3QfKjzkCEXyUlb
	VEK4I394KjGYcY1hApDdpNLXK/LGGotm9at4/fJoZ12f1O3/Iaie+0PGIYjQ8DAeWaBb9KDcsnRrR
	bM03h5mtGbYF7Ov2SGT2as59y4dMFwAoqhH+twvY/b7cGfU4/8OSTBcT7n9bZMA3d5yQzOHLJdJWw
	8MGhU2C/jAs7VNeHRbsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgBOw-0001XL-CB; Tue, 02 Jun 2020 18:12:38 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgBOu-0001Wv-2f
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 18:12:37 +0000
IronPort-SDR: /GnfyjloUA6gXVq2yNaeiUopClqp9YLkZk0JVnQzVaVE5LWVyGp7l78Cm30V8vYLL9Bf9gC+8u
 1+1KKbRcGpS1x8Um7mG+DXjKPKBvvZvG8UpfLOnQJ/oHSbNV18Dz5lABKREOOcNGP6yFX0awY1
 ezrp2vEkK1+iUaSIUvcP4eFEuMSwi/bkoiRtDD+whc7tsYxlOG+SKlLRDiqcZS9q8qlgwPYY5r
 6G6C2vK3Z3cFDFrFNNR7ep8xnOd5lkM1/Ikp5wTXXty767vU/xoSuq3UP4Bg3AMgqGxF9fYx+i
 eHM=
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="51493186"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 02 Jun 2020 10:12:35 -0800
IronPort-SDR: 1UrNGQ+G3s6LQ+0eI0AhBXXT8BfDfyE4UxWmDgar+Y3SI9faLZN4FVcDIHuFrYVjcEon4yQWzh
 dkdWj8ZBmsMqYVa/wbuuL7eUvHmZJqX3iieMSJCHeDvRKrqrRxD/k7rDUFV2Gaehfnk8+uTD4G
 jVua3JY/I8yWkAxhRFNC5A4EiYsxZD/6B3q3llH3rAJ+6eNg8BSX4K010xle9S5ooL82aCALSB
 E8QvHpyIiVF/DzwIpEbA7NVkPFUIascqJ2azLHBx/J2zXpb/CCSJpyC1mBkaWoJn3s23rWPykv
 6Lg=
Date: Tue, 2 Jun 2020 18:12:30 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 4/5] aarch/fpu: use generic sqrt, fma functions
In-Reply-To: <e6b5ba39-dfd4-abe3-5743-ae1bf1b8e9a9@synopsys.com>
Message-ID: <alpine.DEB.2.21.2006021811230.3673@digraph.polyomino.org.uk>
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-5-vgupta@synopsys.com>
 <c20755dc-bd3c-2ef6-c0ce-665529a62243@linaro.org>
 <e6b5ba39-dfd4-abe3-5743-ae1bf1b8e9a9@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_111236_130568_56308AAD 
X-CRM114-Status: UNSURE (   4.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 1 Jun 2020, Vineet Gupta via Libc-alpha wrote:

> Also I don't understand one thing. Both the generic and aarch64 code have this
> 
> float
> __rintf (float x)
> ...
> libm_alias_float (__rint, rint)
> 
> The alias arg 1 __rint seems to lack suffix 'f' ?

Please see the comments in sysdeps/generic/libm-alias-float.h.  The 
arguments are *unsuffixed* names.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
