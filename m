Return-Path: <SRS0=aZIh=55=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE86BC2BBC7
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 06:02:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5097120731
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 06:02:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fdgkDEMj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="XmuzzXk4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5097120731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oq7IxRdXSY4xQmef7vpOhz/8Hd5yLez0JU2yDKmEsg=; b=fdgkDEMjR9GOeK
	KcAvB2Lxg3LsDh2Cj8CJImOWLzvQrROc3CJ2xGnwegAS7kNfP5uOParEM7tsfbiiFmWt+pm9wbCWp
	yFS4A0NnmL6Agq8R0AIpBZmGS/EDGh1AsnCIM2I9ZXCZSGfGcsK6OxXE8d2RV8pjceD7swAKkJHir
	S2MEj1MbGlr2htnXEDDGDoxfcQt8slRVrvvo7yL+W9e1UlgvP/shWd/UX0EBRvP/cfjOxZqkereRL
	5v/mmaKLPAXdCs78kgJyuSkeYeFrQgXOjso/DVW7datGShYPUTn3X1bt6MXUL9lqdM+RVVzg2KCw7
	fwsFJbqUIQXhuzN9ulrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNsBB-00054B-7v; Mon, 13 Apr 2020 06:02:45 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNsB7-00053Y-Ku
 for linux-snps-arc@lists.infradead.org; Mon, 13 Apr 2020 06:02:43 +0000
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 03D62M5u001015
 for <linux-snps-arc@lists.infradead.org>; Mon, 13 Apr 2020 15:02:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 03D62M5u001015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1586757743;
 bh=dCldLIbJ9wUc5jCg/74LFDjsK8+dIb6rNX9NgqkcCfc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XmuzzXk4d49RZLP4JhgIqpOKVaPbHf7NmaNsIsf6Nxchsw33yR6lwmJn7CgTvlSmm
 MvrOz9Gs7sCl9DUXCX3MWuLfV2D/mIfcpmw9OUilRujqlRnBu3+brXFpdPkJUstmjR
 GxKwV7TFN2wXNrbL+9hfOdZDSj5GaOrIITj4Zb9WjqaRdIuDFSYo+1PpkVjf1QcSX3
 Tj1iR/UTLCplsvMabhkfV8ThcDpqjJOpxRzETuU9QZec9fkRcflK+1T2EWwjiKWlRL
 1dTXADqJyk/Rb/TMtdzPCK6XazEF4msQH4hX7F0hVRLaRs4E36SogPzVp9rGJmsinC
 h1T0N4mjdlXKQ==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id c7so2764040uap.12
 for <linux-snps-arc@lists.infradead.org>; Sun, 12 Apr 2020 23:02:23 -0700 (PDT)
X-Gm-Message-State: AGi0PuYYvU/6cE25AZBW+7DuRLMVEjDOphAD0zpgAG6Zxb0nvEwlW8x9
 2SD7He4bMdTAlNKCN2kyPY+qp1dS+YZ23A5A7v4=
X-Google-Smtp-Source: APiQypIRzlzTI3/K1bXcS+XC/wkyUZRtM88QdPPpTtukKFCA9wEHvuhTs9GnOYz/o/wkgZ30jUafw7FukDococDiXuM=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr10404061uak.95.1586757742027; 
 Sun, 12 Apr 2020 23:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200413020538.31322-1-masahiroy@kernel.org>
 <eff00d87-3659-e036-3e24-3f8c9414fda9@synopsys.com>
In-Reply-To: <eff00d87-3659-e036-3e24-3f8c9414fda9@synopsys.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 13 Apr 2020 15:01:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR1jK_O2=LSeunFiMO26F1SGR3ga1gUAi6hcxXuiWaxDA@mail.gmail.com>
Message-ID: <CAK7LNAR1jK_O2=LSeunFiMO26F1SGR3ga1gUAi6hcxXuiWaxDA@mail.gmail.com>
Subject: Re: [PATCH] arc: remove #ifndef CONFIG_AS_CFI_SIGNAL_FRAME
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_230242_030125_388E5376 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Apr 13, 2020 at 2:38 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> On 4/12/20 7:05 PM, Masahiro Yamada wrote:
> > CONFIG_AS_CFI_SIGNAL_FRAME is never defined for ARC.
> >
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Where, how ?


I was working on various cleanups of x86 CONFIG_AS_* macros.

https://lore.kernel.org/patchwork/patch/1214512/


I removed CONFIG_AS_CFI_SIGNAL_FRAME from x86.

Nick pointed out the same name macro used in ARC,
which is not defined anywhere.





> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/arc/kernel/unwind.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> > index 27ea64b1fa33..f87758a6851b 100644
> > --- a/arch/arc/kernel/unwind.c
> > +++ b/arch/arc/kernel/unwind.c
> > @@ -1178,11 +1178,9 @@ int arc_unwind(struct unwind_frame_info *frame)
> >  #endif
> >
> >       /* update frame */
> > -#ifndef CONFIG_AS_CFI_SIGNAL_FRAME
> >       if (frame->call_frame
> >           && !UNW_DEFAULT_RA(state.regs[retAddrReg], state.dataAlign))
> >               frame->call_frame = 0;
> > -#endif
> >       cfa = FRAME_REG(state.cfa.reg, unsigned long) + state.cfa.offs;
> >       startLoc = min_t(unsigned long, UNW_SP(frame), cfa);
> >       endLoc = max_t(unsigned long, UNW_SP(frame), cfa);
>
> Actually there's more scope for cleanup here. The while signal frame stuff is not
> relevant here at all as this is only kernel stack frames. So all of
> frame->call_frame stuff is bogus at best.
>
> I once had an branch with ~15 patches to clean this all up. Let me go find it.


I am not familiar with ARC code.

So, I leave this up to you for further cleanups.

>
> Curious though about the CC list, is this patch part of a bigger series or some
> such. So many people from all over suddenly interested in ARC ;-)


Presumably, they touched this file in the past,
and scripts/get_maintainers.pl picked them up.


masahiro@oscar:~/ref/linux$ scripts/get_maintainer.pl  -f
arch/arc/kernel/unwind.c
Vineet Gupta <vgupta@synopsys.com> (supporter:SYNOPSYS ARC
ARCHITECTURE,commit_signer:2/5=40%)
Kees Cook <keescook@chromium.org> (commit_signer:2/5=40%)
"Gustavo A. R. Silva" <gustavo@embeddedor.com>
(commit_signer:2/5=40%,authored:2/5=40%,added_lines:3/11=27%,removed_lines:2/14=14%)
Enrico Weigelt <info@metux.net> (commit_signer:1/5=20%)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:1/5=20%)
Thomas Gleixner <tglx@linutronix.de>
(authored:1/5=20%,added_lines:1/11=9%,removed_lines:4/14=29%)
Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
(authored:1/5=20%,added_lines:3/11=27%,removed_lines:3/14=21%)
Arnd Bergmann <arnd@arndb.de>
(authored:1/5=20%,added_lines:4/11=36%,removed_lines:5/14=36%)
linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE)
linux-kernel@vger.kernel.org (open list)



> -Vineet



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
