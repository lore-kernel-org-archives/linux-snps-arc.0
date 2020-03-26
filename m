Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24432C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 02:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E61BE20737
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 02:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hYR5jXyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E61BE20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzaBRVwAQ9lfRWhn0za95wSPlRohpbLFqaj+IJ9DSwA=; b=hYR5jXyTCS/a3e
	89erMLEMKNl6yyUCogyT6MVv1PRGBQvU1OgCSMNn2DKdOFQa4/aBuJBjbCDLng9ooguhYJG7lUeqh
	hLIJ85y0lZg5/Krp0ZQbKtce3ZG+NZuT/8AF0WF8xIJoicjrqVWMnKePbRcPvnPSaSh9mK9u0n+YZ
	DOT7X4+bND8XBwM3XZh29FvfTHQiSlPcLqB12E8hwWP15RH9YCOCeKcx7dUEswgsgdE6++RDpR66r
	fM6s93UD41GGekD5ovFIodnBAn/FKrLM9xkxDyj0CT1XSg0OvcDicmATl9TRxmytPCoHVaG8VumB2
	fJd9/EPttfWWMZSMSgGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHHuR-00020J-O1; Thu, 26 Mar 2020 02:06:15 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHHuP-0001zz-Ap
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 02:06:14 +0000
IronPort-SDR: DinNFiUHHu8e70KroTEnckkjlfpqOuUkgnUqA1Q+MXIzicN/9xxVacSZN6Nkh3d/z/xj5SekpM
 j7msv1ylvUUQ+T5lSga6TweovyFn7hmecCM7q085p8M92ErIZVw5X1aGWTIAf18KUmjs4y5YHC
 7fS8mnGeWN5PTQTmZh7etaHLodwxfM3/CgcY9QS31KkpBm0cKXy+tj/Z6hyqwFFblPCY9ICUqd
 a3vRszgOhBa6WA+ik3W1TwpMvMtPnRtXX5jb83OO4dDPSsFTupqnd3fMSojwV0fLhWS1iLhTaF
 BI0=
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="49085367"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 25 Mar 2020 18:06:12 -0800
IronPort-SDR: YCSJWME822vh+H4mp5K+1TbCkviG+h0zhD/m1lOAQcszTxuskO0zLQtfSyggp89WK41bc91qj+
 /VlYhEUz/qXCFXM2syacC6yo/PwRRvKuIOrfwyiQU+eG1otoP+BxWxl1l6v8LcYtuMHPEQx8C2
 0ZdzAdBLNKGp6by59o0QMqNA2EcRoPqmhikl61qSY6yOlSoTnXN27RqEp1MAyTupVmbjkZ7Bpe
 UFZmnmGsQjO6ynx6PyygnWnqhVdawRRqUPvrhcM4kcgxbMlJwHIpIn0KzTol2tN23axrNqGbl0
 KYg=
Date: Thu, 26 Mar 2020 02:06:05 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 07/15] ARC: hardware floating point support
In-Reply-To: <20200313030419.15843-8-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003260201510.31593@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-8-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_190613_378470_61DEBFC7 
X-CRM114-Status: UNSURE (   7.99  )
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

> diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h

This is another example of one patch fixing up another.  You're using the 
same ABI for both hard and soft float, so the first patch adding a 
bits/fenv.h header should be using that ABI for fenv_t, rather than one 
patch adding it with one ABI then a subsequent patch changing the 
definition of that type.

> diff --git a/sysdeps/arc/fpu/libm-test-ulps b/sysdeps/arc/fpu/libm-test-ulps

This will need updating for the recent changes to remove separate inline 
function testing (so there should be no ifloat or idouble entries any 
more).

> diff --git a/sysdeps/arc/tininess.h b/sysdeps/arc/tininess.h
> new file mode 100644
> index 000000000000..1db37790f881
> --- /dev/null
> +++ b/sysdeps/arc/tininess.h
> @@ -0,0 +1 @@
> +#define TININESS_AFTER_ROUNDING	1

In the soft-float patch you define _FP_TININESS_AFTER_ROUNDING to 0.  
Formally it doesn't really matter since you aren't supporting exceptions 
for soft-float anyway.  But typically I'd expect the definition of 
_FP_TININESS_AFTER_ROUNDING, on architecture with support for both hard 
and soft float, to match the architecture's rule for tininess detection 
for hard-float.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
