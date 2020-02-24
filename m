Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37638C35679
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 09:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1E820828
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 09:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e6AjGXvw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1E820828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=If1naNGs+pDVMm1oM/vJE6h+6aMkNHpNMcUFf6anUoA=; b=e6AjGXvwm9g3Q0
	J+6REUU+wi2hodjn+CbLfCtutkrTdYxYmsWDYkaURAkgxugg8KhFjLzvV9G0Jwo97uJnPEZP3uIRy
	eqc6A9nnwtsXBwoMFu/zc/LY6KgDpoSvgQWdiUlLrJ8YnzqmWtWJws5IFtiYZtcDCeRRYx76aNMRk
	4i/6D6NHP8J7/K5S4VIWZDdlBMgEtUOc0mAXLAziF64RtsDjuJtb05aQpEh3S32E4t7m7QrvmgSS1
	FDCprqEtIiVsUQR3bMIC78KhPqIqwcopN3EtSbW7bsZOXRdAw82Br15tQqWobBfw0hUXR7ATgNjrg
	QCkioGIeThrGgn4N+ihw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ATm-00045e-PZ; Mon, 24 Feb 2020 09:56:46 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6AKM-0000iL-OC
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 09:47:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6B405ACE3;
 Mon, 24 Feb 2020 09:46:57 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a2n6fRm4C5Ywyk5ys92jSOAc5SwvBVZyFOY9=4rB2pyjw@mail.gmail.com>
 <20200224100051.2511d797@jawa>
X-Yow: A wide-eyed, innocent UNICORN, poised delicately in a MEADOW filled with
 LILACS, LOLLIPOPS & small CHILDREN at the HUSH of twilight??
Date: Mon, 24 Feb 2020 10:46:56 +0100
In-Reply-To: <20200224100051.2511d797@jawa> (Lukasz Majewski's message of
 "Mon, 24 Feb 2020 10:00:51 +0100")
Message-ID: <mvmpne4xqpb.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_014702_944174_B4854319 
X-CRM114-Status: GOOD (  10.42  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Helmut Grohne <helmutg@debian.org>,
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

On Feb 24 2020, Lukasz Majewski wrote:

>> elf/check-localplt complains about the newly added symbols
>> 
>> Extra PLT reference: libc.so: __lutimes64
>> Extra PLT reference: libc.so: __wait4_time64
>> Extra PLT reference: libc.so: __setitimer64
>> Extra PLT reference: libc.so: __utime64
>> Extra PLT reference: libc.so: __timerfd_gettime64
>> Extra PLT reference: libc.so: __clock_settime64
>> Extra PLT reference: libc.so: __utimes64
>> Extra PLT reference: libc.so: __gettimeofday64
>> Extra PLT reference: libc.so: __clock_gettime64
>> Extra PLT reference: libc.so: __futimesat64
>> Extra PLT reference: libc.so: __clock_getres64
>> Extra PLT reference: libc.so: __futimes64
>> Extra PLT reference: libc.so: __futimens64
>> Extra PLT reference: libc.so: __utimensat64
>> Extra PLT reference: libc.so: __getrusage64
>> Extra PLT reference: libc.so: __timespec_get64
>> Extra PLT reference: libc.so: __getitimer64
>> Extra PLT reference: libc.so: __ppoll64
>> Extra PLT reference: libc.so: __timerfd_settime64
>> Extra PLT reference: libc.so: __clock_nanosleep_time64
>> Extra PLT reference: libc.so: __sched_rr_get_interval64
>> Extra PLT reference: libc.so: __settimeofday64
>> Extra PLT reference: librt.so: __timer_gettime64
>> Extra PLT reference: librt.so: __mq_timedreceive_time64
>> Extra PLT reference: librt.so: __mq_timedsend_time64
>> Extra PLT reference: librt.so: __timer_settime64
>> 
>
> The above problems are somewhat expected. Those are redirected symbols,
> which are exported as GLIBC_PRIVATE in several Versions files.
>
> I do guess that we will have a consensus if we add those as a "normal"
> exported symbols or keep them "private".

They need to grow hidden aliases.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
