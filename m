Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A04C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:37:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230A220716
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 18:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLlg/XQq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230A220716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdyFLLUZ3YmIJsbgWoO0YkT+XEDql01jo4VjvRwdCSw=; b=GLlg/XQqdCFv2h
	uUUf1bGGYAoNVla8Q79Y8wBTpI4Ifh6doO9hB/lqkUR8wuYFAFKFz+6vDwg+OxFS4zdc3IZWPwYHi
	V2Twa4zond8FHhTKRPsK4So+LtM1uJcwnhpgWc+gb9F+MRdFZV9t22hj8SGiuQxYhrsdmHbK1wbLF
	33R6uTu+wgdLa4xFQcQ2sjaOaVzyRDygyFBgAP6yog/4dYMItg410E8k88GGXFWtq3047DdbEQc/A
	pQCDXzjcFbfdKR7OwF3DaGsYpk91UoCicPqKzduDp8TyhPFWoZ9fRR9HRKEQiN4YSYt0TRI+5qtN6
	GpH/K2oWxhF+n6CF48GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHtr8-00013G-Vy; Fri, 27 Mar 2020 18:37:22 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHtr5-00012t-Sj
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 18:37:21 +0000
IronPort-SDR: yNliPUsh0dZOpvxo1AEntLD/FIikoXQOM5yg5b5s6UHFVDU4Q5N3e0AElyR26aTk7kYPv7yW0L
 TtVFz/eVbFq4jXwRp4CnbHl9b2AqeRxWfLv/0mIDkPM0wQ9EZc7UOsA+7qGztD8MVEc5tYbJ2K
 d7za7fivw1zwlmYKYooO8EwDDviw3PFUUSkMLxmHqUPqnCKtgvJujTX7di7hGh1TYb0iHNceUr
 gTziL7WR6z742klbB0D61uO41An22MRKTQGxK/MS2nu9zg1fhZ+p+mEXv8bu4doAJ3iOfN4bxj
 hiI=
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="49161093"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 27 Mar 2020 10:37:19 -0800
IronPort-SDR: FaCkgodGZwEf1lr79Uv8Y5XcUeyYIBlTA6N4uml6dac5AO3DILQj0Oj2M4LAY2nUSg1iYQz0Xj
 OzfoMsYLp9/dvefIOKD/fv9d254i8LkoAILJSB05Ng8Uwc310gAcu5VryO4o/5pCiz/p8j5q0n
 cIVJGtgnBWfzhSD4tZbznVsLnHA5hYAkcuqZFrf5aDOLUPYjx39RIxJXUhRF5Sc61tTb6MJaie
 lFssOPNGaoTzsAdkY0b4oxTWAnucnCh9QiNLEnXjsPooo/vHk7ksbvjTHoxbUL9MeSaeIv77b0
 w/A=
Date: Fri, 27 Mar 2020 18:37:13 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 07/15] ARC: hardware floating point support
In-Reply-To: <7462f741-d7d8-57f2-0fe9-c21b4b2829eb@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003271834390.5132@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-8-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003262311330.24611@digraph.polyomino.org.uk>
 <7462f741-d7d8-57f2-0fe9-c21b4b2829eb@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_113719_932947_AD2DA0AF 
X-CRM114-Status: GOOD (  10.81  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 27 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> > The bits to enable exception traps look like dynamic control mode bits to 
> > me.  In general fegetmode should only need to mask off bits on 
> > architectures where the same register has both control and status bits, 
> > not on architectures where those are separate registers and fegetmode / 
> > fesetmode can work with the whole control register.
> 
> Yeah, looking back into my old dev branch, that is how I did it initially, but
> then switched to current implementation to "make get/set mode functions
> inter-operate with get/set round" - although there was no inter-calling between
> the two. We can go back to that implementation as it seems slightly better in
> generated code, but I'm curious if it is wrong too....

fegetmode / fesetmode deal with the complete set of dynamic control modes, 
not just rounding modes.  I don't think any masking or shifting is needed 
or appropriate in fegetmode / fesetmode.

> Is following pseudo-code correct for semantics ?
> 
> fesetenv(env)
> 
>    if FE_DFL_ENV
>       fpcr = _FPU_DEFAULT;
>       fpsr = _FPU_FPSR_DEFAULT;
>    else
>       fpcr = envp->__fpcr;
>       fpsr = envp->__fpsr;
> 
> feupdateenv(env)
> 
>    if FE_DFL_ENV
>       fpcr = _FPU_DEFAULT;
>       fpsr = _FPU_FPSR_DEFAULT;
>    else
>       fpcr = envp->__fpcr;
>       fpsr |= envp->__fpsr;   <-- this is different

feupdateenv has to preserve the previously raised exceptions even in the 
FE_DFL_ENV case.  It's equivalent to

exc = fetestexcept (FE_ALL_EXCEPT);
fesetenv (envp);
feraiseexcept (exc);

> In some places I have following:
> 
>   if (((fpcr >> __FPU_RND_SHIFT) & FE_DOWNWARD) != round)
> 
> So FE_DOWNWARD (0x3) is used as mask, is that OK or would you rather see
> 
>   #define __FPU_RND_MASK 0x3

I think it's cleanest to have a separate define for the mask.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
