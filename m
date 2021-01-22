Return-Path: <SRS0=wFQm=GZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86179C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 Jan 2021 08:55:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2591E236F9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 Jan 2021 08:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2591E236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OZEK+k8mWthFfcHbfQz9/+VTKZk/bFRd4/yw+j2mV6g=; b=jXSV7orCCV93hgbStlCUhNtW1
	NCEd3+r49xCY6FSEDhJcOfv4pVTGnThDsXaZ5FNNJDirmjOV2sy+rbpuANizoaYYSvMetpxBfFjEx
	bI5/FOwAqSnIFCQrCbMZXBRtBtXXgJV+Y5oDzwX8fkx7xN+eOU6M9enA182wdR9B0f9kpN/gx+6z2
	TYdXRP1l8GQq/krNl1fy99ngzSxtjEXpGAfekTEGUWYazhgiFsfEyk9Xm15lEl9az4r2+PWti8GgZ
	l3P3TkJTtOyd1OhooXittaqGUW166zF3MMWz2xNwMRYhoKnb5l367Gagg7MVAjoAvWt9IlFMyEX9B
	HWBfwk6iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2sDl-0001QT-E4; Fri, 22 Jan 2021 08:55:09 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2sDi-0001P1-OT
 for linux-snps-arc@lists.infradead.org; Fri, 22 Jan 2021 08:55:07 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id dj6so2315573qvb.1
 for <linux-snps-arc@lists.infradead.org>; Fri, 22 Jan 2021 00:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lBh78Ul9GczjuYP9UDWZfNliAS7jv7SG97xIvLE8KOs=;
 b=r+0kcTQPJqoFhQRPAgQCK5lx9LQFY9iDBMMdWlX22lUS/HUIfLxrGFSxjjMG21I+nq
 /0wTc6Lm57a855bHPxpvfLa9oGRDFgDGRWv4oW1dY5ETzjmZRe56zpZJSw8VEIz5jLrm
 XuUCHYAP1/0oo7Naoyvanf+9ysqRbV4dquLnKFIEbnvRga2yp51oAGaDSqPDhIAbWaMk
 +GlxiKSDrhkL+eAUZusXu7a0F6MfUhfzZlx/uYi0fQm28COmtC1v6agTIV8isZpNwIo3
 ryZ99wiA7xipIzaSnip9IyowZqsvGGVdeWuXeIqJe8RcfogzQ6hDpUOJn2btlpYubEZf
 8Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lBh78Ul9GczjuYP9UDWZfNliAS7jv7SG97xIvLE8KOs=;
 b=diquj81bfbLQvVOdtube3hSHFoSYXdGS7HtXY6KP94E78hyrxCcbLXtOIXjjUK0e4B
 p9UUa68rm6Da81wSyLGD410lFomtswztGDdFUGi697IuQC1C5sE05EDRhko/+5beMEvv
 d42g6qAjrTAwGd4mEcYS0lcx6UZQsdIYv23dvFbbhSNnESpAzi6AY5bGKjTCUvQOzGjm
 CQop8FU3cebef6SJQ3DQeXv0bpjyBHya+bdjlUl1foSBJMiDsC/9kmnHM4IpeqoA4eXC
 p4+9ZVBk4u6SfpAMYJ0WfhCgCnZlIiquew6OXLAXHdGEduwryQHdGC9JKXFdNIOZixW3
 gp+g==
X-Gm-Message-State: AOAM530+recTgR7tb2ecF98VNIW/iCGeBZ4edSJQ+5/+rlC81OstI3cs
 CD3coJ8DWUpxC5RCUJHps8Q9AFSV8BVX39rDZ8/6pw==
X-Google-Smtp-Source: ABdhPJz1LoHdsIggwjXMz6Q7Be2qtH11nG+tFY5xwSrvq12vmTrsbQ0sduj7RIu4W14P7giFQ36ajxJk0hS2XfcXR0w=
X-Received: by 2002:a0c:e850:: with SMTP id l16mr3705837qvo.38.1611305701379; 
 Fri, 22 Jan 2021 00:55:01 -0800 (PST)
MIME-Version: 1.0
References: <1610963802-11042-1-git-send-email-vjitta@codeaurora.org>
 <2f12a84c-132b-7141-a89e-9e19de0e4b90@infradead.org>
In-Reply-To: <2f12a84c-132b-7141-a89e-9e19de0e4b90@infradead.org>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 22 Jan 2021 09:54:50 +0100
Message-ID: <CAG_fn=X8SPyHWZnxzauAPY2SG-6fpCkjt-umLaDvC4wz3khLVw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_035507_076376_0FC1F988 
X-CRM114-Status: GOOD (  17.99  )
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
Cc: Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, vinmenon@codeaurora.org, broonie@kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, ylal@codeaurora.org,
 Vijayanand Jitta <vjitta@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 dan.j.williams@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 11:54 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/18/21 1:56 AM, vjitta@codeaurora.org wrote:
> > From: Yogesh Lal <ylal@codeaurora.org>
> >
> > Use CONFIG_STACK_HASH_ORDER to configure STACK_HASH_SIZE.
> >
> > Aim is to have configurable value for  STACK_HASH_SIZE,
> > so depend on use case one can configure it.
> >
> > One example is of Page Owner, default value of
> > STACK_HASH_SIZE lead stack depot to consume 8MB of static memory.
> > Making it configurable and use lower value helps to enable features like
> > CONFIG_PAGE_OWNER without any significant overhead.
> >
> > Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
> > Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
> > Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
>
> Hi,
>
> Did you see
> https://lore.kernel.org/lkml/202101050729.cwTd47Yw-lkp@intel.com/
>
> It seems that arch/arc/ does not have:
>    arc-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
>    (.text+0x6): undefined reference to `__irqentry_text_start'
> >> arc-elf-ld: (.text+0x6): undefined reference to `__irqentry_text_start'
> >> arc-elf-ld: (.text+0x26): undefined reference to `__irqentry_text_end'
> >> arc-elf-ld: (.text+0x26): undefined reference to `__irqentry_text_end'
> >> arc-elf-ld: (.text+0x34): undefined reference to `__softirqentry_text_start'
> >> arc-elf-ld: (.text+0x34): undefined reference to `__softirqentry_text_start'
> >> arc-elf-ld: (.text+0x3c): undefined reference to `__softirqentry_text_end'
> >> arc-elf-ld: (.text+0x3c): undefined reference to `__softirqentry_text_end'
>
Hi Randy,

Could you try out the following patch?

Thanks,
Alex

diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 33ce59d91461..94d3f9620d0b 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -83,6 +83,8 @@ SECTIONS

        .text : {
                _text = .;
+               IRQENTRY_TEXT
+               SOFTIRQENTRY_TEXT
                TEXT_TEXT
                SCHED_TEXT
                CPUIDLE_TEXT

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
