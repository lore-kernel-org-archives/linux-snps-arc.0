Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9674C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 19:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMzG/k2wAiebwoI5/WFWsewlhAMYpMKnwfmcXsIKgxI=; b=EiKM+AXE1f2DVF
	dcMtcOIPWGp4wQfgpLJDtJBx6MIftyACyFjXkQBGZlqavq9RJmEA+pY0sPc/Y0V7KRk4r0mtAETb2
	YuA9RycyzNLXmD8pHf3CcrF9vHcu9boxHPzOYsnD3RnnH38xQRRzRVC888g1Igl7MBaq7+N03a3su
	rRVZbbBLhBGW4ANCrxkD5opC3N+/uNcDo0hsf2mb+l7pbbXxhLONZPETwRYHywTHIpcHn7baertSJ
	E8tkkT6lRjPuFJ2wfE9GN0a8876j39d74bNimWjDj/7v/85HfG3ySCreYF7Cii/k5N81tpzePewLf
	YBzs0usPLwNneE2k++aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Yds-00000007qPF-1uW2;
	Tue, 15 Sep 2026 19:16:32 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ydp-00000007qOd-3WJc
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Sep 2026 19:16:31 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so94781e87.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499787; x=1790104587; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=TsAXKRk3IfHwJiyRz3m/QIkaXlNhHg4n/e6u54xSA50v8Gm/Hlt5uLcr8ZRAFAXgP4
         Jf1HV/D6L52fa1umZunqUbscOVepde3vivQ1SsMsAwOzdWkw2jLqXeT+KGEW/S9Mu9iU
         rJDFPAvvaB564Uo1gi+UO0dj8BE8DdCWQthbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499787; x=1790104587;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=Vl4Zg6I6un+ZhrG9B4STHBTBCA/3cYNVWzwoF83Bzh/So2K5K3lwofOeWaAtyqU+pr
         HthUCYT5UxyUHBYPFu9RyIJ34OCaG8N+eN7hCI5z2U65L1QzWyTK937JYRVlqfHBYfZU
         U79pg2Qjga6x8RUZbs970LFvcsEbcU0vdYMgvm10cg7DgqIMq/GIHSRFdffhjlc7Al+m
         q14dUQKwgbz0c36AUsjzG2KJmZULsMRI0S+wV68yKY5N7d2tJUGDfDOf1thX1Xu+Qqxk
         zCW1riRHNROm0p7ws1Sm2ImrrGHifzIO0quyVV2pevt+Apwbn6ektlYz5ymVgMyZ5Wl1
         pMjw==
X-Forwarded-Encrypted: i=1; AKwUvBxo1Oi2em1hJjF8IV1//1zVMSg8zWladCplLLqtA5+bdcT+JJ8OOc2zrNA/87eC4MSY4WohTjPXj48B/bCIsw==@lists.infradead.org
X-Gm-Message-State: AFuF++lrGcfmB9NE39z74inkmIbWh06mT/JgY8CeBN3v/kTQ3MYoFIZW
	hAX1FwUAsfbi3o+SO8I1TC/eF8Vk+G8JzztCPgkTC1GWNAbSrjy+aFAQM+NmOTdc7dd9HHv1eu2
	iMu0CeCad4S6V
X-Gm-Gg: AYBFou2RkUBzuaDgxKcSxS7Nr5XvRqSY6vDAjWbMpiPjiS8VTQJaCRl0MZRm1DHqXma
	eCyapeneBJi+AvIES+0B+kGDQBaySV16j1kWclov3xKMb3PnJlBtaUmGLbQwq+NnEGO5hoJTIya
	an/kFrNIJfKCzJneKlNiB9Oe6oMqsU7QhGm/NYMuChDgE9BLF6WPrTiwVhE+UNFRkzEqJ5dlveQ
	MZzAu2EnwP8u4F8bz+LIkL4NJ5YlGLBUT4NcueeB6oD5dUfk1sCXdOTWM74VOmbU3kVE/odACaM
	o0Bw101Jv3our6O7v1BebJ2Zfz/Bo3SS+O9xmkoGcI/qJpc0cVv8wQ7hXRqMKWcdwukE1SlgvA9
	40CTRWpeawOgAl6v1IIkV0Ynt1xC1GWPkO2Cjcy/S5almEGWfvQ/hvlKG3TRtiyj/fuW5Nd5sYf
	4GTStl8DykUIzhDSQEm0olCeZuPwqWdfxipHjwOcEzC+3jpyPp9yt3yuOq5FBTBR04Bgerr871U
	yW55pBoa3W4+hJoCYE6lxnia7DtXYdhoXAIJjttuYE/LQnAwBrO441CduGd
X-Received: by 2002:a05:6512:32c5:b0:5b1:5ab5:ea09 with SMTP id 2adb3069b0e04-5b8ae63580bmr4776612e87.0.1789499787502;
        Tue, 15 Sep 2026 12:16:27 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e7f5asm166004e87.73.2026.09.15.12.16.27
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:16:27 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so106044e87.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 12:16:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByP3ccciU9Wq3sdsMSftZFUrosBpbtnpE4dyGVK7BthL5HSwLyckci/SknzcK2x7ROsYOObj6UzWFXXogUdwQ==@lists.infradead.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_121629_897656_F7CB00D2 
X-CRM114-Status: GOOD (  16.44  )
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

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
