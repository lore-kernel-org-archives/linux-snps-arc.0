Return-Path: <SRS0=2k9h=4I=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91128C11D05
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 16:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30AE206F4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 20 Feb 2020 16:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FT5tQMXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30AE206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkTeDftykqXsU88Wt6PxLM05r0T+ysdy5lveFom8N4o=; b=FT5tQMXBiykRyc
	mYHy3+WoAeuDAPqxKEZewcAagFfUUPxk8l19yHu0WQz0+RKfvv6XGJuU3vIjQwEQV5sZAGtftCEnU
	6I9oP5EAh3z8ydhnBJz+ihWurT64u/sk+c1IZUHOtCX0gvJFjkja0m3gufR3oOvbpvfX+wHXPWlzf
	ZsCgixN4fjpj6De8tK/Hnoy2/zIzbvjtzZHUbdMju7j8uK8dcpOnY6vCTJrr4c4W9+VsGEfe1SSHR
	9cJdmVL1/X+htvnY3ty2Am4Yipi7SYyMnmn3zrMG4A4rzfruPgHNAM5ZJCzNa4Vu53fPD44iSQqGi
	v85KizpUT9nUfYT42ccw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ogB-0004EZ-Qm; Thu, 20 Feb 2020 16:27:59 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4og8-0004Dq-8G
 for linux-snps-arc@lists.infradead.org; Thu, 20 Feb 2020 16:27:58 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id 21589200B42;
 Thu, 20 Feb 2020 16:27:49 +0000 (UTC)
Date: Thu, 20 Feb 2020 17:27:36 +0100
From: Helmut Grohne <helmut@subdivi.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200220162735.GA26634@alf.mars>
Mail-Followup-To: Helmut Grohne <helmut@subdivi.de>,
 Arnd Bergmann <arnd@arndb.de>, Lukasz Majewski <lukma@denx.de>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alistair Francis <alistair23@gmail.com>,
 Joseph Myers <joseph@codesourcery.com>,
 Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Zong Li <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 debian-arm@lists.debian.org
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_082756_440807_8E5C7DA0 
X-CRM114-Status: GOOD (  13.76  )
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
 GNU C Library <libc-alpha@sourceware.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Lukasz Majewski <lukma@denx.de>,
 Zong Li <zongbox@gmail.com>, debian-arm@lists.debian.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On Thu, Feb 20, 2020 at 09:31:32AM +0100, Arnd Bergmann wrote:
> > > How do I build a latest RISCV 32-bit kernel + userland - do you have
> > > a buildroot branch somewhere that I can build / test with qemu ?
> >
> > Maybe a bit off topic - there is such QEMU and Yocto/OE based test
> > sandbox for ARM32:
> >
> > https://github.com/lmajewski/meta-y2038
> >
> > (the README provides steps for setup).
> 
> (continuing off-topic, with debian-arm and Helmut on Cc)
> 
> Would it be possible to take a snapshot of your glibc tree and
> start testing this out with debian-rebootstrap [1]?

This is exacty what rebootstrap is for. You should be able to experiment
with different ABIs without committing to a particular ABI. You can
fiddle with such aspects and then cross build a pile of around 120
Debian packages. That should uncover the most significant problems. You
don't even have to change the GNU triplet. You can just create an
incompatible throw-away port with an existing architecture name as
rebootstrap refuses to reuse any existing binary packages for the host
architecture.

If you want to pursue that route, get in touch with
debian-cross@lists.debian.org or #debian-bootstrap on irc.oftc.net. The
usual route is forking the rebootstrap.git repository. You just hack up
your toolchain modifications an retry the bootstrap from scratch until
you are satisfied. Be prepared to put up with half a day or a day of CPU
time for a single run. Don't hesitate to ask for help if you have
undecipherable build failures. Balint Reczey has done something quite
similar to what you're up to: He attempted creating ports that are
instrumented with sanitizers.

Since I saw arc in the subject, I also threw arc at rebootstrap. Turns
out that glibc 2.30 does not yet cover arc and using unpackaged versions
of glibc is non-trivial for rebootstrap, so I cannot do much about that.
Once arc support is in a released version of glibc, I'd be happy to be
pinged about it.

Helmut

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
