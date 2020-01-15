Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC66C33CB1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 14:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19BA214AF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 14:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgNyJYyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19BA214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LDITjd0AU14iFCT0CD9PWAmjq9TNztDfPvKSm4HarM=; b=fgNyJYyUOK9ZGv
	5gnyoijJ0VnFkKRDVU6qemmoVt9NoldEU40cE4lfOojneOu7hhYVX5gTQXy7QqdLcD7nh26QDkzmW
	/NGVNrrz8N11SGrm7EsbqEr7PYzTLe4r7stcRPx0Fp+k3VAEl/VMs2plApX655ozIJg7mF31So0SG
	vcm2oHdiVR7aR4cFNZyBbm/yAEEIyVwou5Lc9FjtqfAXHOqx4N2RMC1pzcQTvC2pcDbKcg7x1eMSz
	pWH4YRUmNBr7Gka1/oDKd90bB5QvaT9UQOsPN5QWgacAEtWs1AwUZX1wTvEzNNj92OCmCwbvd6ydd
	fK/NdCFQ+iv5jOzT8jdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irjYq-00055r-RS; Wed, 15 Jan 2020 14:22:20 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irjYk-00054l-VC
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 14:22:20 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MPXMa-1j4THU3kVm-00McsN for <linux-snps-arc@lists.infradead.org>; Wed, 15
 Jan 2020 15:22:11 +0100
Received: by mail-qk1-f179.google.com with SMTP id c16so15748207qko.6
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 06:22:09 -0800 (PST)
X-Gm-Message-State: APjAAAVRQia4CK9utaThMxjP4ykKibYmmDactrC9mRv2MpbWlf4mGg5c
 hsY1KeYin11aS7rCXDjpFcUsu11XjOBx94eWmiA=
X-Google-Smtp-Source: APXvYqxx2a39ERgImZn16gvReU3L59K4NPZ7rVI6r40qbh59bC6C4RPdM9GIKIPaH4dZYMYOAUlFtEAF/+VlIcIk3y8=
X-Received: by 2002:a37:84a:: with SMTP id 71mr26665185qki.138.1579098128765; 
 Wed, 15 Jan 2020 06:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-2-vgupta@synopsys.com>
 <CAHk-=wjChjfOaDnGygOJpC36R6mtT7=Xf6wWTzD_wLJm=quu0Q@mail.gmail.com>
 <CAK8P3a2ao=xBuy3XHBkdo03KEjpMHGe9ahwj-uogtkZBXsMkGw@mail.gmail.com>
 <20200115141224.GH8904@ZenIV.linux.org.uk>
In-Reply-To: <20200115141224.GH8904@ZenIV.linux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jan 2020 15:21:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0eu-2ov-Y0EEuv_XSGUTWoyiScf5z5P=kn5S+ORhxF-A@mail.gmail.com>
Message-ID: <CAK8P3a0eu-2ov-Y0EEuv_XSGUTWoyiScf5z5P=kn5S+ORhxF-A@mail.gmail.com>
Subject: Re: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
To: Al Viro <viro@zeniv.linux.org.uk>
X-Provags-ID: V03:K1:z57FHwBbzM2trjJ6E3KMlSX1p8HNdeVz0I21dpwqIzmIZPAhg3P
 D45Iv3F1QWBiAKmaw8tkeAOwYcj0PNPFNIxe5ZTlp4AM3wQojH1TRtlJ3Z8ChZM+8lDnbzx
 v/oPkervKUKGqK+d4rIVVOrv/YPpvTrMPL/sOs7EnkOUpr1oQTaBx7+Xv6qmR8psMRIVjgM
 uQCedyfgGkGM5Fi7aboYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ut3yalytkPM=:lsxBN8Z+MoN6yKGPDqErOx
 t1Kw8JEZWYp758+Ha8oQ13+b0Y0SRQzxQZqoQT1A/pfYL8k6lii0iSP4iB7rIBgxofnKD51WV
 5De1T+DKajZSkG+mhxU3RWdwn29ni0dX1NPX9sHjYFz/WH44A3Xoqws/a18FdxeaBZPNNh9Ez
 dw5hzbLJSLcNKYz8lorQ09GsHOmNFzloi2hMh4Iw3I9hVEvqbmoEot6TygsvRPSt1fkeIW5Xj
 PdIFQtuHJ3ljz/uhXLTem5UxB0GYCym7e9lY+PWKDCqDshfnFoqyLsL2p5pi1DWz7tZA6ZVe3
 f5jLa1rQZR+epE0h6W5fQeqqONUWP/uH/uF/lwO/TKnzjZqK2/uROhWfGPdybzxeNfa1TD12O
 H0c8vqQGWlmARehlMCVH+51TseIDNX+1rODOBabMb0MiEli9Yb9c8T/dCz/K3r/J6DBgs7Xb2
 705ErbuKrgKjeiR4sJ6/RDNlne9WvZrpOHC1TOkp3Ppmu4Fj2VIHLc8IruUBYPD+CJ+Z9kWen
 rEKr2fXYPP6aqy6F3qwjgJZN2bKXorWywpbKrMLG2g4qTo4sYbgF5xSsq13kZ7mvbkNjHGlpS
 AM6YBxQaiQT4q5NQ5prMl3Pd3pM1qHTpcBWakzaxVr/Uha+E6z8vM0qq6RH+JtQApRPv/HTHf
 03Wuq9MygavzFaLr2CngOId8mNsae8n9EeJrsI/lwydC7nHz7gIRX9QqbEO1dC2oSXrKxxclF
 jlGEuwAmGffauqk/LxeVkT6nw5fMGeuZ2ID9Fm8oO4ueg5e/gAh8Afgs0lDAavmXIhTMQsD21
 0MFyahVUP9Uespl8yDiDLTz/03m2iygcFUH6p+Pv29N1Iuf2Aflaq3REP0+ueMjM2TL8YYZMl
 zlq6nj3tx4ZeQGVHLzRQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_062215_294666_652BB80F 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 3:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Wed, Jan 15, 2020 at 10:08:31AM +0100, Arnd Bergmann wrote:
>
> > > I would suggest that anybody who uses asm-generic/uaccess.h needs to
> > > simply use the generic library version.
> >
> > Or possibly just everybody altogether: the remaining architectures that
> > have a custom implementation don't seem to be doing any better either.
>
> No go for s390.  There you really want to access userland memory in
> larger chunks - it's oriented for block transfers.  IIRC, the insn
> they are using has a costly setup phase, independent of the amount
> to copy, followed by reasonably fast transfer more or less linear
> by the size.

Right, I missed that one while looking through the remaining
implementations.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
