Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34586C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40EA20714
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xo7AOSH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E40EA20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9egua6ar/prcOM6BgHL1e52t0W0wOduGM0Q8QLVnhxM=; b=Xo7AOSH5OCxjOg
	Bk+/JYvFnDAEInTtoej+XmFfsgcZEi70iZ/v+fX4oSJUuToOgarindiQlZ+ZzAR6eXiZWpDMjndak
	GBHJfY6hzyPsVu3oHsawXHa9trqrAcxM9LB6v+H9VZUu2gxol2Wzd6fKCQUfShw9ajcP2rpZ2CBbu
	MU+D1tm+PtlJOUxd4t56gIhKb7AIkTRDI/YR8BLYXdVM+g2Yk8uCk0rHXV6EBTBxY8+0s07SPxw0T
	fVYncHge0P+X2KArM85u7ALPGQ/Gtjx5xPiFPmgu/WugXEJLvJg5lpXtPD3wx1llcFdcpboTZ+jG2
	93wzNf/NbyITxJuwNU7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHHkY-0007Mw-82; Thu, 26 Mar 2020 01:56:02 +0000
Received: from esa4.mentor.iphmx.com ([68.232.137.252])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHHkV-0007MR-Pk
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 01:56:01 +0000
IronPort-SDR: Eh2BfzrcUttyAXvev1CZWFeeKjNyr/nsncF0hfMngbeyjpN9spIDDAFq7GMX+UjqjmOZTKxbUq
 Tkd2IVAudsWzA6u8FzGCpmEtDyudHSXe3Y3PsXU+pTauVYL8m3/fB9We5Yu2tNw6L2V50BnhW3
 5WmjX01YGdZ9vvhbJIW1V8ayvgR6L8Fe5sXf4o2+HAcjwvcrOw4brX97aux503hv5nESlV7IxA
 F87QY06OJzWAacg1/rxzF2PRsjoyR1kc/Hpw12hzZzahZ68yHuIkeNUH2EwByt3x3dyIx769ez
 b/k=
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="47166418"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 17:55:56 -0800
IronPort-SDR: a745On7cnjvYkZnsTemOjPbWnFsYqvvWjihBVbf7rTiy9hg2tDOw7NQ4zeYLnBQY6lvxfDWn55
 rM8bcB3iESnH4vrzOOC9xvAS6FY45QTDLGnVAs0pOR7p0pWx0nSEli8uvP7IvNv0dKd5RxV82b
 yn5ItM1tQRw3BqbKB/m0oTWdozBrvJ8ssCPa//ifCrdp/wMLPjvVVWG3FbVwt3GyNlmNEEkbjy
 KBJtCC/XfQe3TAuc5QN8jrDO/NaBFtmK7d6Hri1lrN+6X1we2rAvZSDShIbfphdg9Q0f9xuikf
 EZU=
Date: Thu, 26 Mar 2020 01:55:50 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 03/15] ARC: startup and dynamic linking code
In-Reply-To: <20200313030419.15843-4-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003260155160.31593@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-4-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_185559_868249_77CC1566 
X-CRM114-Status: UNSURE (   4.35  )
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

On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> +        case R_ARC_TLS_DTPOFF:
> +          if (sym != NULL)
> +            /* Offset set by the linker in the GOT entry would be overwritten
> +               by dynamic loader instead of added to the symbol location.
> +               Other target have the same approach on DTSOFF relocs.  */

Do you mean DTPOFF?  Otherwise I'm not sure what DTSOFF is.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
