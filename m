Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B812EC43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 00:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D772074D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 00:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTWWlSiN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D772074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vO7+/nzENzy+FTZw4g7JKnEydayIWU0cACORkrOU9mk=; b=WTWWlSiNpBabq9
	4zILqr1GDzYzpWd+6MK1UKeXur5nxd1E5/paB3YS+QXbeioiIODIKxmAj5AN0oujT2zFi4p1pJJgG
	+F+jEw950wEyPirclWnOvOUupP7JrmmZRfxV2LmRpexiwRyDYEkDa+5whFqim+pAKx/sc1xXyyXTF
	XdeTW32kqyDEmnq2LWss31HG2GB8a8pr8x2MVpRm0HQSqT420iND2r/LshBiBALf2gjH3krbx8ljT
	CbA/69Hi0Jum8iPE9CdjNfOMaD8N6B95lVtR/XRzh3fN0fcbEnwfR9P7S9qtaj/FFDfSUVzy5qwtw
	jYSilfcUGL1V5aQWiX+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHd1L-0002Sm-Nd; Fri, 27 Mar 2020 00:38:47 +0000
Received: from esa2.mentor.iphmx.com ([68.232.141.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHd1J-0002SR-4b
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 00:38:46 +0000
IronPort-SDR: v1az6GdKX/ymlLqyYrujYU6h7Yiyp3rG84+MlC7iHfXlOC/oF1n5NXp1WM+lzXKDpNPiHGh4hn
 4+dru+FcgVJsNVo6WktiidHBNfp/JbCBY5RYmkyDeOLv1VAbiRalHqRyMyyF4mibDf/i/gZvbT
 LOq3iSbG04XM4xmBaiINm0NBWKcQD/mjc+65jQzvmqKFPLL03YMJxijC+M3J5sGsaIs31/9BD8
 CqZG3kv/bD1qDDR2wJ7B5VRHfOyjb963vDJrAD6JHnd3WkcKgvaSuC5xhV/4w8PjsAJ7xtf/PK
 BQY=
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="47075576"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 26 Mar 2020 16:38:44 -0800
IronPort-SDR: wVXu91Y8zogGwtLHKl5uVcKFa76i6VWfqtbiJUAJ113YTiLVc8uUc0oqHT+v26ZjFjBJPP0BeU
 pTfeM497b/c4Nw+HpzbgvBut4As+1WngbqKUCykmLxNZXCqsxZBV5qWJG+8lmnSGG0rwPcVlvO
 gT031vPj1qCPVJSQLRqTtMRdhy7Mcz+L/hQWJHNHN/wxDo5WPtRccqCHc+QmWbf4jttR0Qjp0U
 9oJkZxploF7WVFEd23pIRf7sg1TfcBf9/H0rx9QKA3ActUE10nOrMelmEYrAfaYaJWPULt2AT6
 GIg=
Date: Fri, 27 Mar 2020 00:38:39 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 09/15] ARC: Linux ABI
In-Reply-To: <20200313030419.15843-10-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003270035170.24611@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-10-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_173845_187778_38546332 
X-CRM114-Status: UNSURE (   8.10  )
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

> +/* And the whole bunch of them.  We could have used `struct
> +   user_regs' directly in the typedef, but tradition says that
> +   the register set is an array, which does have some peculiar
> +   semantics, so leave it that way.  */
> +#define ELF_NGREG (sizeof (struct user_regs_struct) / sizeof(elf_greg_t))

Missing space after second sizeof.

> +  /* __startcontext is sort of trampoline to invoke @func
> +     From setcontext() pov, the resume address is __startcontext,
> +     set it up in BLINK place holder.  */

GNU standard is that you don't use parentheses after the name of a 
function in documentation (including comments) just to indicate that it's 
a function; empty parentheses after the name of a function indicate a call 
with no arguments.  Likewise elsewhere in this patch.

> +  reg_args = argc > 8 ? 8 : argc;
> +  for (i = 0; i < reg_args; i++) {
> +      *r-- = va_arg(vl, unsigned long int);
> +  }

Bad formatting; the open brace goes on its own line, indented two columns.  
Missing space after va_arg.

> +  if (__glibc_unlikely (stack_args > 0)) {

Likewise.

> +    for (i = 0; i < stack_args; i++) {
> +        *r++ = va_arg(vl, unsigned long int);

Likewise.

> +#undef __ctx

You don't seem to have a macro __ctx, so no need to undefine it.

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
