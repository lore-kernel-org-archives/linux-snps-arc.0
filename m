Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0572C33CB1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 11:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCF32073A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 11:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l6tjsKpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCF32073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=134/1SVUKmhYdBgGAsPrervzJEjdTPg2ev5pYnrDV5s=; b=l6tjsKpw9530Mp
	wAScvWYKuB/YGtCq3imbhFRV7fuKguTRP2eaXLqKIf0hrG2mDIL+j/BK6yz71VObFu7AfgbHoYwBv
	jv6jB3KK3Efu3e27oFZSXVC8416uIwiUedqIfB/0iwF6GVOuoH/xxGrrmwO2O+TFOgTV6TxhIWWRs
	98Xg+U+smpGt0lE6VxObsfGwjPFpd/n6tnNduuhwKAk/ZRqPfA2FO697ThE+zalMqLf6eX18gcl0y
	sjx7660PJbYBF/5JQEt1FSqaypQtDENoHBQMZztL/0Ejlz4+Jg35ueIwxMxNXMwgYrhXQmTRQkXvM
	1/Krrm8S52hjc35RD3Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is3HR-0003i5-QE; Thu, 16 Jan 2020 11:25:41 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is3HK-0002a6-4n
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 11:25:38 +0000
Received: from ip5f5bd663.dynamic.kabel-deutschland.de ([95.91.214.99]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1is3H5-0001S8-FE; Thu, 16 Jan 2020 11:25:19 +0000
Date: Thu, 16 Jan 2020 12:25:18 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: clone3 on ARC (was Re: [PATCH v3 2/2] arch: wire-up clone3()
 syscall)
Message-ID: <20200116112517.53luv7qolevtqjpu@wittgenstein>
References: <20190604160944.4058-1-christian@brauner.io>
 <20190604160944.4058-2-christian@brauner.io>
 <CAK8P3a0OfBpx6y4m5uWX-DUg16NoFby5ik-3xCcD+yMrw0tbEw@mail.gmail.com>
 <20190604212930.jaaztvkent32b7d3@brauner.io>
 <a58c8425-83a3-b64c-339a-7e94a72f4bee@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a58c8425-83a3-b64c-339a-7e94a72f4bee@synopsys.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_032534_328037_DC1426F6 
X-CRM114-Status: GOOD (  21.00  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Linux API <linux-api@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, David Howells <dhowells@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <christian@brauner.io>, Adrian Reber <adrian@lisas.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 10:41:20PM +0000, Vineet Gupta wrote:
> On 6/4/19 2:29 PM, Christian Brauner wrote:
> > On Tue, Jun 04, 2019 at 08:40:01PM +0200, Arnd Bergmann wrote:
> >> On Tue, Jun 4, 2019 at 6:09 PM Christian Brauner <christian@brauner.io> wrote:
> >>>
> >>> Wire up the clone3() call on all arches that don't require hand-rolled
> >>> assembly.
> >>>
> >>> Some of the arches look like they need special assembly massaging and it is
> >>> probably smarter if the appropriate arch maintainers would do the actual
> >>> wiring. Arches that are wired-up are:
> >>> - x86{_32,64}
> >>> - arm{64}
> >>> - xtensa
> >>
> >> The ones you did look good to me. I would hope that we can do all other
> >> architectures the same way, even if they have special assembly wrappers
> >> for the old clone(). The most interesting cases appear to be ia64, alpha,
> >> m68k and sparc, so it would be good if their maintainers could take a
> >> look.
> > 
> > Yes, agreed. They can sort this out even after this lands.
> > 
> >>
> >> What do you use for testing? Would it be possible to override the
> >> internal clone() function in glibc with an LD_PRELOAD library
> >> to quickly test one of the other architectures for regressions?
> > 
> > I have a test program that is rather horrendously ugly and I compiled
> > kernels for x86 and the arms and tested in qemu. The program basically
> > looks like [1].
> 
> I just got around to fixing this for ARC (patch to follow after we sort out the
> testing) and was trying to use the test case below for a qucik and dirty smoke
> test (so existing toolchain lacking with headers lacking NR_clone3 or struct
> clone_args etc). I did hack those up, but then spotted below
> 
> uapi/linux/sched.h
> 
> |    struct clone_args {
> |	__aligned_u64 flags;
> |	__aligned_u64 pidfd;
> |	__aligned_u64 child_tid;
> |	__aligned_u64 parent_tid;
> ..
> ..
> 
> Are all clone3 arg fields supposed to be 64-bit wide, even things like @child_tid,
> @tls .... which are traditionally ARCH word wide ?

This is just the kernel ABI we expose to userspace with the intention to
make it easy for us to handle 32 and 64 bit. A libc like glibc is
expected to expose a properly typed struct to userspace. The kernel
struct kernel_clone_args has "correct" typing.

Christian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
