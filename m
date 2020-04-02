Return-Path: <SRS0=zcuS=5S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83CAC43331
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 08:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB9DE2078B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 08:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DkHhyDK4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIvf+o6D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB9DE2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEkI/oK5qSjOe9p8oY8dMB8HN8+XXyVHSOK7r2cUM8E=; b=DkHhyDK4JV6fv4
	HA+1mO+QGvZBwRFtJ6duSomWw47uqO3JmblI4W6PAqFUxe7DI1OLQtO+yOehDRfqjBFKK7WghRjlG
	GES2PBjwqd3wWnNsVoQmBLh4uc/OJwLhp9n6OinkcjHXX1yGm6wnaw1aV+mLgW+D65onTb1iwwLrm
	egP2MyOJyYqr76Bqv98GsxODz+pqE1DIE/to2oZ237t/RG4tUOkal1CpaHPmlKyv8xWVzQMGLoEpo
	b6RkF5Gw62YWtaN9It6FdRtCzzJ5mMPubiTd+Ls6w1/4IjjHqd51GhCmaOfyKokw0VWHD5rh21wDj
	G/i9f/cmw4+/Kq7E8yeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJuvy-0002ev-Uh; Thu, 02 Apr 2020 08:10:42 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJuvw-0002eL-U2
 for linux-snps-arc@lists.infradead.org; Thu, 02 Apr 2020 08:10:42 +0000
Received: by mail-vk1-xa42.google.com with SMTP id b187so622249vkh.12
 for <linux-snps-arc@lists.infradead.org>; Thu, 02 Apr 2020 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4bE/P5QRiIPVIk+HS8o/GuyaLeRlIHc/vpiFLIW3628=;
 b=LIvf+o6De+0RaBbwtWEoEAptfdZMe0Tu3sJeB1IA9SjLJC/XJdpmGPjoNToMA4Q69P
 I24Zs/XfThwmpkr2gNrGNryD5rN5zajr/uGIjyCep7d0g+gHWwU6z4NZ4MO04JN3o1wX
 x1pZdiSk0R63juyw5tB7bWFE9qBhCHLOoRE7HAAZ6I55ak0Yg/YRBbRsADxYJWaM5+5W
 391Lc3+RitaL46WTShZHt2EUfib1jpXpxbE3zB9yVBdoMGqWOHKTXxVcNZewuHwdlkIS
 4HARo33DpKQS4IUbZrPzZe6hLZ+9SIDoAX9v67GkIlujCC5oZZ/OJsnDZX+gmlryGHtU
 iX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4bE/P5QRiIPVIk+HS8o/GuyaLeRlIHc/vpiFLIW3628=;
 b=DucUMVp9YfAI6oG6e7/rpW2AEhFIf6pGisRWwteXbKGaM8D70E68vk1S5T6Gxr5ucE
 G4w3eNA8ED5M8STI9HWcO5hhzi70GvkPDvpmTFLBiVzuaz1dUq3e7qeJic9MFknf+93V
 rAVoyWMCCqWwCejWDkD4zVJKgUbO0lIr3G3mZ79tzbMsTskhRBOXGZMGiEbOPIB2NNTG
 md4plurq0gMBMWGM0/l6OyvPsI6xE9InyKjv+DKO6kLcMIBAYxUz/5QblJI5+PC90luR
 ztO2QWfVB5IDitJg8sZzKh6+4SG2Yx3QtVzaIXXppHv0fI39DRUplZ3mr47ix79YK8di
 Ivsg==
X-Gm-Message-State: AGi0PuafAqIh0nNpab2JJmTtvggiO2zhwpO00ldP7k/xBDj623pIGD1V
 lqkdufDLQnVhVNu4aJ9hdIqdBkG0q/T4b7yyuL3wSU9d
X-Google-Smtp-Source: APiQypIQJhYpg5u1nZdNMQEdZsk+1RgGZcHR8b75FyTrxYu2HsqvwSqJ6vfEmOoJXSI0oU69GPLvArhZCWJ/qrVNuEs=
X-Received: by 2002:a1f:a055:: with SMTP id j82mr1181103vke.75.1585815038690; 
 Thu, 02 Apr 2020 01:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
 <20200327131020.79e68313@gandalf.local.home>
 <fe7ae84c-745a-04b4-dcc0-5df8cc35ee0c@synopsys.com>
In-Reply-To: <fe7ae84c-745a-04b4-dcc0-5df8cc35ee0c@synopsys.com>
From: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Date: Thu, 2 Apr 2020 11:10:27 +0300
Message-ID: <CAL0iMy3i5+_owqJcUKWzGNFakVV2P=oFdyAWCY2LP7YTusKP_Q@mail.gmail.com>
Subject: Re: [RFC] ARC: initial ftrace support
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_011040_992481_D818A50E 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

ARC-gcc has two modes to call the mcount routines. When using elf32
configuration, the toolchain is set to use newlib mcount. When
configured for linux, gcc toolchain is using a library call to _mcall
(single underscore)  having blink as input argument.
So, using the proper linux toolchain, your patch should work.

//C

On Thu, Apr 2, 2020 at 4:17 AM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> +CC Claudiu
>
> On 3/27/20 10:10 AM, Steven Rostedt wrote:
> > On Fri, 27 Mar 2020 18:53:55 +0300
> > Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:
>
> Maybe add a comment that gcc does the heavy lifting: I have following in glibc
>
> +/* this is very simple as gcc does all the heavy lifting at _mcount call site
> + *  - sets up caller's blink in r0, so frompc is setup correctly
> + *  - preserve argument registers for original call */
>
> >> +noinline void _mcount(unsigned long parent_ip)
> >> +{
> >> +    unsigned long ip = (unsigned long)__builtin_return_address(0);
> >> +
> >> +    if (unlikely(ftrace_trace_function != ftrace_stub))
> >> +            ftrace_trace_function(ip - MCOUNT_INSN_SIZE, parent_ip,
> >> +                                  NULL, NULL);
> >> +}
> >> +EXPORT_SYMBOL(_mcount);
> >
> > So, ARCv2 allows the _mcount code to be written in C? Nice!
>
> Yeah, the gcc backend for -pg was overhauled recently so it is a first class "lib
> call" meaning we get all the register save/restore for free as well as caller PC
> (blink) as explicit argument to _mcount
>
> void bar(int a, int b, int c) {
>         printf("%d\n", a, b, c);
> }
>
> bar:
>         push_s  blink
>         std.a r14,[sp,-8]
>         push_s  r13
>         mov_s   r14,r1
>         mov_s   r13,r0
>         mov_s   r0,blink
>         bl.d @_mcount
>         mov_s   r15,r2
>
>         mov_s   r3,r15   <-- restore args for call
>         mov_s   r2,r14
>         mov_s   r1,r13
>         mov_s   r0,@.LC0
>         ld      blink,[sp,12]
>         pop_s   r13
>         b.d     @printf
>         ldd.ab r14,[sp,12]
>
> @Eugeniy, this patch looks ok to me, but a word of caution. This won't work with
> elf32 toolchain which some of the build systems tend to use (Alexey ?)
>
> The above _mcount semantics is only implemented for the linux tool-chains.
> elf32-gcc generates "legacy" __mcount (2 underscores, blink not provided as arg)
> likely done by Claudiu to keep newlib stuff unchanged. Perhaps elf32 gcc can add a
> toggle to get new _mcount.
>
> And this is conditional to ARCv2 due to future ties into dynamic ftrace and
> instruction fudging etc ? We may have to revisit that for BE anyhow given such a
> customer lining up.
>
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
