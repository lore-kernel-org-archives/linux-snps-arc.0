Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25808C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 23:23:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C743B20663
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 23:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qf/h4Mcm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C743B20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6TBrvx5bv0g+NHPsJCkR8vkg+P3BkLUmuAsVa7DUyU=; b=Qf/h4Mcm25y0fw
	ZO/Izi4KUXmv6ioj4IZsAs/LYhT/x5K2TQvmM2cWi2zOv8qUEQgcYAvtW/XQNZ8PSMFhTDpmp3+xT
	HZ8X0u0OlH8BRlpu/9ksi++1r2zstCTNCdJqydr1e2eQkqA0pM64xy7vF22SPdFx8dxoGF6OPna5a
	1iSgI5z+76Fwtmc7R0QI0fImMtpLh5OfVlVgHF04yR9WFw/C6Asvu3Rc5nGOaFOmia/gQLqeSMgtj
	Zdadl8XhxZav2fF+4wzgzVtXCjD7rAIUZznRRaO89KNeXRXfSuEFZA4XfOCHPEv3JBH0RJ7lVSpuy
	ZwdmzzqYMuxhxHWspFFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHbq0-0000qo-Er; Thu, 26 Mar 2020 23:23:00 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHbpx-0000pw-7j
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 23:22:58 +0000
IronPort-SDR: 4Fbadb9iefzFI7Xw31TS4/wL51ay5kypf+WNYSu5lsAWDCxZeU+LOYIAjY0WrmAMDEz2TAoN28
 Cj5La7soT6eCmOjHecknjZ+smj+c79CBR6bdOSzuguzVsdM1KuhanFBixGgIKVJYSvVCgPPuKn
 WTviElEsvQC+8846Zg69ex2NSZMg2h4txpSnrKfaOrqjdljBdGoWMb8MP1zFdOLSODjUJUBRnU
 7r/Y9dKmr2VGeyUWxIok0LEqh9Kse8xMKi46AT4N7Z0LMUkZjEYgl1vqOpVJGlbE9w9I/W2nis
 K9U=
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="49126169"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 26 Mar 2020 15:22:56 -0800
IronPort-SDR: wDtVXZ9BljizMhptC+AB+Qb9STVo9at23j6lbZYuWl2fQmmI5+ibC013sQBZmUhwvSbVkCkqOG
 gQw1sqgw4Y81ciM1uyHIaxXRbW4l9VwWflnNEPlgCeihpFcwZkwy9JwNC0mmAfJKamDvL1Kyeu
 bilpKJEMNQ8e52xMcAJGUb94KQds5ra65l5dfxdN0QjrTwh4JV2tzEjouz5B6cvXUnFjCNGpmh
 +NEgQ4yMUzjHVNgQw5/d2xLk6z5Diyh5EuP6qcvIFI27UZbJZvbAIpTLqayd/um6D2oEXYus44
 r80=
Date: Thu, 26 Mar 2020 23:22:51 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 07/15] ARC: hardware floating point support
In-Reply-To: <20200313030419.15843-8-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003262311330.24611@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-8-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_162257_286415_29FD998E 
X-CRM114-Status: UNSURE (   9.63  )
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

> +int
> +fegetmode (femode_t *modep)
> +{
> +  unsigned int fpcr;
> +
> +  _FPU_GETCW (fpcr);
> +  *modep = fpcr >> __FPU_RND_SHIFT;

The bits to enable exception traps look like dynamic control mode bits to 
me.  In general fegetmode should only need to mask off bits on 
architectures where the same register has both control and status bits, 
not on architectures where those are separate registers and fegetmode / 
fesetmode can work with the whole control register.

> +int
> +__fesetround (int round)
> +{
> +  unsigned int fpcr;
> +
> +  _FPU_GETCW (fpcr);
> +
> +  if (__glibc_unlikely (((fpcr >> __FPU_RND_SHIFT) & FE_DOWNWARD) != round))
> +    {
> +      fpcr = (fpcr & ~(FE_DOWNWARD << __FPU_RND_SHIFT)) | (round << __FPU_RND_SHIFT);
> +      _FPU_SETCW (fpcr);
> +    }

I don't think the use of __glibc_unlikely is appropriate here.  It's not 
at all clear to me that the normal fesetround case is setting the rounding 
mode to the value it already has, as the use of __glibc_unlikely would 
suggest.

> +int
> +__feupdateenv (const fenv_t *envp)
> +{
> +  unsigned int fpcr;
> +  unsigned int fpsr;
> +
> +  _FPU_GETCW (fpcr);
> +  _FPU_GETS (fpsr);
> +
> +  /* rounding mode set to what is in env.  */
> +  fpcr = envp->__fpcr;
> +
> +  /* currently raised exceptions are OR'ed with env.  */
> +  fpsr |= envp->__fpsr;

This looks like it wouldn't work for FE_DFL_ENV, which is a valid argument 
to feupdateenv.  It looks like we're missing test coverage for feupdateenv 
(FE_DFL_ENV) (we have coverage for feupdateenv (FE_NOMASK_ENV) and 
fesetenv (FE_DFL_ENV)).

> +static inline int
> +get_rounding_mode (void)
> +{
> +#if defined(__ARC_FPU_SP__) ||  defined(__ARC_FPU_DP__)
> +  unsigned int fpcr;
> +  _FPU_GETCW (fpcr);
> +
> +  return fpcr >> __FPU_RND_SHIFT;

Both here and in fegetround you're not doing anything to mask off high 
bits of the control register.  That seems unsafe to me, should future 
processors add new control bits in the high bits that might sometimes be 
nonzero.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
