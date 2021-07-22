Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC9CC63793
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82BE960720
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82BE960720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fudZRaekB9a4CCEOHBIvAFfrlj0cN7LJCSfR3ftBpts=; b=qS2E0/CK28tjo5
	ATdg6+cvjwAibX7tG6oXHqsgWsnsSvhyGoIKRPxcYDWoGzA4kWOYPzMhEHu+Qqv16yJJyDgmRBJnR
	R/+2HfEP6ixsCR90S/gba22LihSShhbpMDP4M53Osdcb0ZbphkaXecn2FLpKjxZBGXvHm9+8cinoz
	SMR6PLQX2vM1HSoIyRhxlZSuqOAcnLWxoQXULaobNDDtkUS1vek3bAHaQOCicmZM3aRud81U1XX5w
	SoaYj8VKz0GqdVNCXNpXe8TJztAlv5p9bD85UW5COSDMRFfb9cMj7o2+YJgFDN10EVWGrHFt0G+Eo
	1RkwOWtJDri7oyc6mx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Z0m-001jd7-Gk; Thu, 22 Jul 2021 13:45:16 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Yvj-001iFy-Hz
 for linux-snps-arc@lists.infradead.org; Thu, 22 Jul 2021 13:40:05 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GVtqN2T6zz1qxm0;
 Thu, 22 Jul 2021 15:39:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GVtqK67MFz1rmYN;
 Thu, 22 Jul 2021 15:39:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tUFOsh9v4A-6; Thu, 22 Jul 2021 15:39:57 +0200 (CEST)
X-Auth-Info: f9rWwOu5uAsEy1IBY8DWuE4+R1S8MaC5XlHtuZQQIJTQxszPcS9RgsxOGESCjK6j
Received: from igel.home (ppp-46-244-188-81.dynamic.mnet-online.de
 [46.244.188.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 22 Jul 2021 15:39:57 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 76AF02C2658; Thu, 22 Jul 2021 15:39:56 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Vladimir Isaev via Libc-alpha <libc-alpha@sourceware.org>
Cc: Vladimir Isaev <Vladimir.Isaev@synopsys.com>,  Cupertino Miranda
 <Cupertino.Miranda@synopsys.com>,  Vineet Gupta
 <Vineet.Gupta1@synopsys.com>,  linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] elf: _dl_fixup*: make @reloc_arg 64-bit safe
References: <20210722132200.43895-1-isaev@synopsys.com>
X-Yow: Am I elected yet?
Date: Thu, 22 Jul 2021 15:39:56 +0200
In-Reply-To: <20210722132200.43895-1-isaev@synopsys.com> (Vladimir Isaev via
 Libc-alpha's message of "Thu, 22 Jul 2021 16:22:00 +0300")
Message-ID: <874kcmzcur.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_064003_829279_5F6A723D 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Jul 22 2021, Vladimir Isaev via Libc-alpha wrote:

> diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
> index 9d0d941000..6099a44ffb 100644
> --- a/elf/dl-runtime.c
> +++ b/elf/dl-runtime.c
> @@ -56,7 +56,7 @@ _dl_fixup (
>  # ifdef ELF_MACHINE_RUNTIME_FIXUP_ARGS
>  	   ELF_MACHINE_RUNTIME_FIXUP_ARGS,
>  # endif
> -	   struct link_map *l, ElfW(Word) reloc_arg)
> +	   struct link_map *l, uintptr_t reloc_arg)

ElfW(Addr)?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
