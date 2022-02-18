Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB93C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 09:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwu8QhM9QfgOcMs4ExVw/HTkEKD0W6IaibsxhYX/EQM=; b=mAbMmCs7dCok0x
	z21Shwdc90OxbdL287hrouCN0D4LJ1Lu7OndQpgVhT99DrZRFXFRojdowyWWBs9KXdRdB98m4L12/
	ahAZPatKh4+5cmJW9uGtgzxa43XpHfB3Rk15xCoRnBZjEG00ycdwUShoYwxka2tWO8GJ/3Bc0gys3
	fEa7gWOueYMWxgN9QVJKdb3AyF9a0k4NnZ3INh5c2BnX1yo9BEr4o3q0wYt3RUIni9j0RjEnXlevF
	tKHJVEX9SQQ+peEDLEwqo4mQVZSh1gFopigpiSneDlSC5HfyMrcGl39nzPc9i2wNGcxcqA/2ojiY2
	LLEEx9aufzmd4MDZSylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzZE-00DXT7-Ju; Fri, 18 Feb 2022 09:28:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzRk-00DTRu-KK; Fri, 18 Feb 2022 09:21:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D82E4B825BE;
 Fri, 18 Feb 2022 09:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67FBC340F6;
 Fri, 18 Feb 2022 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645176056;
 bh=iKhg0GBIaPe+CQxdRyb4Yd6fYvnOL1KGipyOpowy2ho=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kGX6zbKnx1V58BNNLylZKoAuSF4ReIgBQqBt4dNQXGvgg2oi0HA/f9LUZVuwHyBWV
 mg5pCM9Rt+spQyje33QEp0c+aCuC8aKFt2FMZfRqn/7AXaofnUHDU/0en8KkeKXLv6
 KABjo84/BhTe0Q0VHw7YDA7ZU0kHzYDUskwkfFWrQ37aBtp2SUFFlhvxE4zEdq3C6Y
 n20bhElsCWhy3qU9eja5s1kteeZAzqxIiwZZ6bEY9ZjBGZj4RXBRkBjrfFIX1l86n4
 fwF6xBW0jhnf04cIEV6bo6qDfBixXNSEwg23XQj0Tfg9+ioxxTNxiurSMLHoQgfEhB
 wrFbaCMlSRtoA==
Received: by mail-wr1-f42.google.com with SMTP id h6so13408152wrb.9;
 Fri, 18 Feb 2022 01:20:56 -0800 (PST)
X-Gm-Message-State: AOAM532PfNL6PSIO1Q/1LQWDEFSrCzts7qLPmboHCYAf+dCB+rwkRngn
 k3fBNymGsPmSe4ykJMHM3UVB2loSyqdgnTbePBo=
X-Google-Smtp-Source: ABdhPJyGR3PQRCwNo0b6q27n8W/CBFQ1qGTyO2eZuzZDzHloL87fpnteJNso35Jub1TB9UHbj8TuXAAIoiRTkKAAdXc=
X-Received: by 2002:a5d:59a3:0:b0:1e9:542d:1a35 with SMTP id
 p3-20020a5d59a3000000b001e9542d1a35mr816366wrr.192.1645176055050; Fri, 18 Feb
 2022 01:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
 <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
 <Yg8CjZwjWYIibrsd@zeniv-ca.linux.org.uk>
In-Reply-To: <Yg8CjZwjWYIibrsd@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 10:20:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0_uJQXshn5N0o4J_8dVPNCw885xGHqnKj3i5kYB+GtBg@mail.gmail.com>
Message-ID: <CAK8P3a0_uJQXshn5N0o4J_8dVPNCw885xGHqnKj3i5kYB+GtBg@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dalias@libc.org" <dalias@libc.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>, 
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "guoren@kernel.org" <guoren@kernel.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "bcain@codeaurora.org" <bcain@codeaurora.org>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>, 
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>, 
 "geert@linux-m68k.org" <geert@linux-m68k.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, 
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, 
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "green.hu@gmail.com" <green.hu@gmail.com>, 
 "shorne@gmail.com" <shorne@gmail.com>, "monstr@monstr.eu" <monstr@monstr.eu>, 
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "nickhu@andestech.com" <nickhu@andestech.com>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>, 
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "richard@nod.at" <richard@nod.at>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_012101_187251_E38CB067 
X-CRM114-Status: GOOD (  29.94  )
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

n Fri, Feb 18, 2022 at 3:21 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Thu, Feb 17, 2022 at 08:49:59AM +0100, Arnd Bergmann wrote:
>
> > Same here: architectures can already provide a __put_user_fn()
> > and __get_user_fn(), to get the generic versions of the interface,
> > but few architectures use that. You can actually get all the interfaces
> > by just providing raw_copy_from_user() and raw_copy_to_user(),
> > but the get_user/put_user versions you get from that are fairly
> > inefficient.
>
> FWIW, __{get,put}_user_{8,16,32,64} would probably make it easier to
> unify.  That's where the really variable part tends to be, anyway.
> IMO __get_user_fn() had been a mistake.

I've prototyped this now, to see what this might look like, see
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?h=generic-get_user-prototype

This adds generic inline version of {__get,get,__put,put}_user()
and converts x86 to (optionally) use it. This builds with gcc-5
through gcc-11 on 32-bit and 64-bit x86, using asm-goto with
outputs where possible, and requiring a minimum set of macro
definitions from the architecture. Compiling with clang produces
no warnings but does cause a linker issue at the moment, so
there is probably at least one bug in it.

Aside from compile-testing, I have not tried to verify if this
is correct or efficient, but let me know if you think this is headed
in the right direction.

> One thing I somewhat dislike about the series is the boilerplate in
> asm/uaccess.h instances - #include <asm-generic/access-ok.h> in
> a lot of them might make sense as a transitory state, but getting
> stuck with those indefinitely...

Christoph also complained about it, the problem for now is that
asm-generic/access_ok.h must first see the macro definitions for
architectures that override any of the contents, but access_ok()
itself is used at least in some of the asm/uaccess.h files as well,
so it must be included in the middle of it, until more of the uaccess.h
implementation is moved to linux/uaccess.h in an architecture
independent way.

Would you prefer having an asm/access_ok.h that falls back to
the asm-generic version but can have an architecture specific
override when needed (ia64, arm64, x86, um)?

>         BTW, do we need user_addr_max() anymore?  The definition in
> asm-generic/access-ok.h is the only one, so ifndef around it is pointless.

Right, the v2 changes got rid of the last override, so it could get
hardcoded to TASK_SIZE_MAX, or we can convert the five
references to just use that instead and remove it altogether:

arch/arm64/kernel/traps.c:      if (address >= user_addr_max()) {
                 \
arch/parisc/kernel/signal.c:    if (start >= user_addr_max() - sigframe_size)
arch/parisc/kernel/signal.c:            if (A(&usp[0]) >=
user_addr_max() - 5 * sizeof(int))
lib/strncpy_from_user.c:        max_addr = user_addr_max();
lib/strnlen_user.c:     max_addr = user_addr_max();

user_addr_max() first showed up in architecture-independent code in
c5389831cda3 ("sparc: Fix user_addr_max() definition."), and from that
I think the original intent is no longer useful.

          Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
