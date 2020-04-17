Return-Path: <SRS0=p2sK=6B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B5BC2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D490C214D8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Apr 2020 23:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAHn0x3K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D490C214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIvLtT4joVdl6TQH1tM0lAMFfQGfKuSCygpqEt61USg=; b=fAHn0x3KpOhQr1
	+6djlKLcVB+/2HSCuQZzzt7qXb0FjmCIzQ7+79oqjQX9cXAFZpISwM+W3VbhKU5Pm3CZswEU7wiaD
	HFggEw4MJ7hi27qiIe6RsvAb4ckxt1JForoTVWPTmAzE2i907/TZfuWvvO/7gx4gT5EGR22QpNuwJ
	AzSBANUn3KrP1Rh4xRD0gCa2WXJDJG2y27Nd4a69ksYED1zrEpl+xZB+lN3NU48iihR8Vff1pPL62
	ZN+8sEqINbRg1dYOkA2FbihLPC2dh+Isk49raqu8Ge7Ueu+ZNnl1SCXxVo7BKmFmS96EjLBrrXXti
	Eqr4wrcxlcUFgzevVMHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPa9q-00045z-JM; Fri, 17 Apr 2020 23:12:26 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPa9n-00045L-Cv
 for linux-snps-arc@lists.infradead.org; Fri, 17 Apr 2020 23:12:25 +0000
IronPort-SDR: 6qWvb6CAnwIX+6RT/zLQ19e8CfhwNG5rZlz8AHa0fgqQrNGp3x4cXMJhx7dhJoGi87XS2hn1uC
 kqHNFD0zoxD+f4O2M+wiubPlECdJlEU571V6gr7jIXkMg3u194OjrI5PQAE7IuoBuiG/w8xixi
 PKfaIh8C/wRjIbRvBagW/n0pk/SuCI08kYizOVebieptX8NDUPzb/IOSULZhX+mnWQnLtsCoRQ
 yHb1E0heVSyJW0xgVH6R/5Gxf+49aiQVsQmFGz6NwIQTCsxomXxIOk/EXkgOtBZqU4LRSWEcra
 oEs=
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="47930417"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 17 Apr 2020 15:12:22 -0800
IronPort-SDR: Dp+O6AU7Fxy7h8pISujmUWg3HTvqRNuV5Uk4i35JqvIVNh/VwAC92u3kBO2PVhgTJvu7JvaOJV
 36Tqs2wcHw290qeON2HwcU6+9OOlhAQ9HiiqHhqCb4LsJPmYF7xTT37XzBXB6VSUAfzJlf4xiS
 AFuE6oTmG0LzsLqBKX1ZAKwgUfMwt/wiTvWRycoW3JFbb69T0uQqliJP8pK8jWoeFiZWpOJhkq
 WiNXYcx5bWAGHmza2m+xRD6hcVsn+BKWpQruwBNd7HEcgHP7KA4BUrH5VUdwDfiZ6+SaG2dsKL
 Xv0=
Date: Fri, 17 Apr 2020 23:12:17 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v5 13/14] build-many-glibcs.py: Enable ARC builds
In-Reply-To: <20200409025615.27003-14-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2004172311280.1082@digraph.polyomino.org.uk>
References: <20200409025615.27003-1-vgupta@synopsys.com>
 <20200409025615.27003-14-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_161223_483544_090ED9BF 
X-CRM114-Status: UNSURE (   5.78  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 8 Apr 2020, Vineet Gupta via Libc-alpha wrote:

> diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
> index 64a836c52ea9..77b686d34cea 100755
> --- a/scripts/build-many-glibcs.py
> +++ b/scripts/build-many-glibcs.py
> @@ -1248,6 +1248,7 @@ def install_linux_headers(policy, cmdlist):
>      """Install Linux kernel headers."""
>      arch_map = {'aarch64': 'arm64',
>                  'alpha': 'alpha',
> +                'arc': 'arc',
>                  'arm': 'arm',
>                  'csky': 'csky',
>                  'hppa': 'parisc',

The description of this patch seems a bit confused (the actual enabling of 
the ARC builds is in a previous patch, this one is just adding some 
configuration required to do so).  Anyway, this patch is OK with a better 
description.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
