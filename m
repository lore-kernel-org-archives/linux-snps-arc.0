Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FC3C88E7D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vf0IaZtzINxT+RnJxDYFJ07zx31a5GKXltkV/vpGoQ=; b=UmAn0u8A3gKvff
	bZaY/tlkTOdtah1pqFGQ6VUFfLosx4Ml2VuEOIjG7CWOOzcy7ifjWanb4aa59sqoUiPS5y2CP8mh1
	rAvPiNnAybJu+bw9aedPK4wF2yKO5jYz5QNGXGySu+ZFGNmpa0hCBhlYX58JEUKjHh0AMDfnEh0WO
	nKBOG3vrU6lqf6PS+Yn4op9Bi7yM7cZw2lo2N2pUSTW8dhAfiVA0T0BC+p5EyatqoKGbiYEBDpH7Z
	xXtCDucFNzbxkChBILNHZCJ2BKm4I+xvahxcRfazBsaqub5dvgEFKdFxzdUCHm2nuRFmu8AzUfjqv
	HfQ4/dj+hgZaiKEKlBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vch-00000007Lt0-33b6;
	Tue, 15 Sep 2026 16:03:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcV-00000007Lgf-0nfP
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=; b=n7ZSiHt/TAcoBBfAguqGm8+/4Q
	0bc78LdkQY9pqED8RQmXuaQt+kfPHSX3UcBZTs4t6s6/f6I8a+aC67N+HJl3tchgpa0o50BtMyTOU
	qFbjYhlIvluugwLFlXKWNeY8OJm0feyOqkl1BP4HtBBavl13WiXtjlvFXDq2Q5l+CQJNqR52afGn/
	y98yn1EEevEk6FvWk9bVh7CdfL4zT79vZ0bzqlAqkE2N0vxymU04BdFj8qcd0F/YX1OPgDUfcmrpr
	bu23nSmnabUnet7SUL2RoL2Qn65JY4lwRvXfPASIoZ40AYzn7AEZTD1Xy1omaeLGOuoFjFzH7MlRp
	h+gRCumg==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VcS-00000006zos-1SOT
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:54 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c2953a01240so573105766b.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789488171; x=1790092971; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=YG4934BllG8UTgS4kUdYL0h5e6ogG5masTvrSPuqX7Kx66wWN/RtRzClXJ5Y3dMv5Q
         KWClP/m7+3cCXAx/dHtCbmwgCU6vRBUQe0V4Fpqo/wbKUwIsi/1JbjR0qUW2ypbTTODb
         eXVwnZSz86CA4Sbbq/kQ4xih76YlVIM72X51E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488171; x=1790092971;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cj8iWYGkmy9fr6Sp+MjBMi0cvssqzarl8Tgut8FUMEc=;
        b=AFhJ90xSf4axL/gsRtCHIYZhQiHLowEzpzbEG6FDIcUR0aaFnFz8lcPd0HflIErHfZ
         K0Lzj9WRC27zHU151Yw9d0t400Sl+dUbht4nYZLQ4URLIP/b4aF3V4LdyzaIRVcClf2x
         g8DmsPaaDpepZ8UEomf077oBKwmHAnMP14gRzpwsBTKJcQSlWDP2EblrZ1S+aa/Xu4Xs
         ppWCrfKSpVK8fjUOEztetxtehkm7XFoVls//jkSq1Byb81cKsV24RQIPHdUu63VN5lLi
         cgWRVzB2voBhNyZZtEEfBFOQhUSDJf45rDqEGCtKoqoOMqLkBBOsgAtovAbvaDokEPaM
         m4pA==
X-Forwarded-Encrypted: i=1; AKwUvBzPJ8ekwNdYp/6eICBWynFVmsWlRTGBzo3JHDQN7/HjiA2w8UuQqgRio46f+GXItaDlsdYjid8iawmkk+3KyQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lKxSsCrYLFTMEFoWwxSYDeIY0qVbmSGMTssuOMFvo4ljGc1WTG
	YiHcSTtILdQOi31VlyrbY7EixQZC/ttW4aoNK6n+Yx4eUCpuKiLd+rOHY1+khufZ11FqTrCsb7V
	4K0PWAHw=
X-Gm-Gg: AYBFou3Zlkm5C/tdnqnVUMTZCiKGPRFsSyPe5evCI3RG7eVPTUX1ZOJHHdCKpZ7Jb26
	J5SU+WfpBWPPbQpCubkmmIrc9aa4L7R3ImYmEZrKQD/yQe3I60CK2GOgh59HWms2/yJ7Eca3K9D
	I2ajt06Xy/hLoCaWDIHUxKScXt/O+3MUlC+YP8ZLFSVz4Un23KjRKtFvjNgzO1/4I6jG3jHEYrZ
	11QZGpE8l4exm2qt+qiXvy1dWQunnZD+QNZ2UdXeCVWNI83fhLlJpDuPDfRMdzJI2csXVJVROz3
	OBHl0vokE46OSUq5OwIzBTc7NA6vt2JtXgJhN0knx8meX2v9qvOVcM7AXf/GgP70BiB/9F0c8MV
	mFbyBlodYWmUuqLTOnr01ewUM3nGqTIL6pv2HfLo+19zDl0AzKDfLj/GkQoxvMgnH/0xPlc9Xqc
	uU3z/NmGbSXUkulQdhhwXfVTPkCqduNGdPyH8FzG/UMQRyivmvklqAr9kSo4bd802ffM95JjyOt
	RPnU5sEWgEwZmfTVDyiYg1LyWY/BFlFF+M6l1spNJvdCw9DpA==
X-Received: by 2002:a17:907:1c9e:b0:c26:19de:9acc with SMTP id a640c23a62f3a-c29b871c20emr554666766b.36.1789488171094;
        Tue, 15 Sep 2026 09:02:51 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de08513esm2380366b.2.2026.09.15.09.02.48
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:49 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so573092566b.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 09:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQHYpzrdScWa6l1mmpfkvJmWv6JbkKVyL0sD0+8DCIxBzOCUmZyXcbX7RFfV2dYx8GKUTCWliZlZkKew9Wqg==@lists.infradead.org
X-Received: by 2002:a17:907:cd0d:b0:c29:439b:d5c1 with SMTP id
 a640c23a62f3a-c29b86141b9mr553591866b.16.1789488168046; Tue, 15 Sep 2026
 09:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 09:02:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
X-Gm-Features: AcwNN1WK06t9f9BcKFBIanysXcyUXK4eRICuH4x14s60AdlpF6ijCATIYaYAAvQ
Message-ID: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, 
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
X-CRM114-CacheID: sfid-20260915_170252_431406_ECE9333E 
X-CRM114-Status: GOOD (  17.50  )
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

On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wrote:
>
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

Honestly, I am *not* a fan. At all.

I think this adds complexity rather than removing it.

The diffstat tells a story:

>  106 files changed, 962 insertions(+), 861 deletions(-)

in how this adds a hundred lines more than it deletes.

But to make things worse, it adds them in bad places: low-level
architecture assembly code.

Those extra lines are *not* making complicated code simpler. Quite the
reverse. They are taking fairly straightforward "just deal with errors
with normal cleanup in the place where it makes sense" and makes the
*straightforward* case simpler, while making the big picture more
complicated and subtle, and adding new code to places that are not
simple and just blindly do somethign that makes no sense in that
context.

IOW: it's more code, and it's more abstraction, and it DOES NOT HELP.

And yes, most of the well-maintained modern platforms (read: x86 and
arm64) use the generic infrastructure and they don't show that
low-level asm effect. So for those cases, it's mainly just  that added
conceptual complexity and a new odd rule - and makes a *successful*
system call go through that "extra work" and indirection phase that it
didn't use to go through.

So it just spreads out the work, and moves it to a less obvious place.

All for the very questionable advantage that you can now randomly add
a file descriptor without the few lines of fairly straightforward
rollback.

IOW, I do not see a single real upside to this, and I see immediate
downsides to it, and a more abstract complicated machinery.

I do *not* see why we woudl want to make this be a "every system call
exit" kind of thing. If there are places that think it's complicated
to do, they could have *their* local little stack of fd's pending. Why
force it onto the low-level system call entry for every system call
when there are only a small handful of actual real cases (the vfs
itself, and random ioctl's by odd driver subsystems).

              Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
