Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225EAC6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkwQYirZ2oBUSNg9iWHjuIf4R8xv8D0qKkLx+zgtgD0=; b=4jlZmOcGs8DLMk
	5794xbQ6iOOaNiz3QxnBAUDhPImNB5Qic0hcpg4DxY85tvAToESHkTMZhDRtBmzjjYUByZkRvii3Y
	ihATZ+1DaRODnYIWV8bbIoYObGH0vTuxqTgiLPq3TS48vxWgP5/roxZq2AtpP4VwVsGiubNRerQM4
	o2+i+8DH76eghGfB9mxBFL9unnUTQbEX/DB/asUkE0pgnsr0ladwIBWA30O1EdtsakOjoIEu9eFc5
	c/eRP1HMAbFOV35G7MS1n8oxnxfPsOxnaQw0hqPUJIw1sEwX89Ogvp2Q3zhnPr3haYBTOY9NRH44a
	cL+d+bEiIw3utA0nQ+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXp0V-003CT8-6O; Thu, 02 Mar 2023 19:54:27 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXp0R-003CSB-HE; Thu, 02 Mar 2023 19:54:24 +0000
Received: from [127.0.0.1] ([73.223.221.228])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 322JolfB1654568
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 2 Mar 2023 11:50:48 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 322JolfB1654568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023020601; t=1677786658;
	bh=n/GRsm1pImWCPNm4dPoe5zec7Kp4K3JReb8gPrI8/mc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EoMqj2NrvtdnnKP1K3ZY31x6mzZLyhmRVv+AfJ7wKdoAJbCxWwA+q2O/5sMmJVAVH
	 CBl1NaM0Y8H4KZuzvQjbNwKYV6dXCiIfmDalzvbDgGVmn+bMayegSv6UvQXFNOV7kH
	 d/WVC69GzUYAENKo48YQjfv0/LuQNbAN20Le/uIDHGiGr9P8B8oHP2fS95eG5xB58F
	 uasUM1VqxwzDuwffGGAapL9uswmgoHxhnTzGnsDohaOFjOu2pxA/e5nnYVugsNl2zn
	 98XlC/4jazJIi0XM8kFrS6seI0EpKbWqSgJdlLGlfl4yBTPVtfQW74gM369HHmiIcn
	 4YRgUzYFXGcXg==
Date: Thu, 02 Mar 2023 11:50:45 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, hca@linux.ibm.com
CC: geert@linux-m68k.org, alexghiti@rivosinc.com, corbet@lwn.net,
        Richard Henderson <richard.henderson@linaro.org>,
        ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
        linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, chenhuacai@kernel.org,
        kernel@xen0n.name, monstr@monstr.eu, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.osdn.me, dalias@libc.org,
        davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        chris@zankel.net, jcmvbkbc@gmail.com, Arnd Bergmann <arnd@arndb.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
User-Agent: K-9 Mail for Android
In-Reply-To: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
References: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
Message-ID: <21F95EC4-71EA-4154-A7DC-8A5BA54F174B@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_115423_600925_2CCC5F1F 
X-CRM114-Status: GOOD (  29.17  )
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

On March 1, 2023 7:17:18 PM PST, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>On Tue, 14 Feb 2023 01:19:02 PST (-0800), hca@linux.ibm.com wrote:
>> On Tue, Feb 14, 2023 at 09:58:17AM +0100, Geert Uytterhoeven wrote:
>>> Hi Heiko,
>>> 
>>> On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>>> > On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
>>> > > This all came up in the context of increasing COMMAND_LINE_SIZE in the
>>> > > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
>>> > > maximum length of /proc/cmdline and userspace could staticly rely on
>>> > > that to be correct.
>>> > >
>>> > > Usually I wouldn't mess around with changing this sort of thing, but
>>> > > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
>>> > > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
>>> > > increasing, but they're from before the UAPI split so I'm not quite sure
>>> > > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
>>> > > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
>>> > > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
>>> > > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
>>> > > asm-generic/setup.h.").
>>> > >
>>> > > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
>>> > > part of the uapi to begin with, and userspace should be able to handle
>>> > > /proc/cmdline of whatever length it turns out to be.  I don't see any
>>> > > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
>>> > > search, but that's not really enough to consider it unused on my end.
>>> > >
>>> > > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
>>> > > shouldn't be part of uapi, so this now touches all the ports.  I've
>>> > > tried to split this all out and leave it bisectable, but I haven't
>>> > > tested it all that aggressively.
>>> >
>>> > Just to confirm this assumption a bit more: that's actually the same
>>> > conclusion that we ended up with when commit 3da0243f906a ("s390: make
>>> > command line configurable") went upstream.
>
>Thanks, I guess I'd missed that one.  At some point I think there was some discussion of making this a Kconfig for everyone, which seems reasonable to me -- our use case for this being extended is syzkaller, but we're sort of just picking a value that's big enough for now and running with it.
>
>Probably best to get it out of uapi first, though, as that way at least it's clear that it's not uABI.
>
>>> Commit 622021cd6c560ce7 ("s390: make command line configurable"),
>>> I assume?
>> 
>> Yes, sorry for that. I got distracted while writing and used the wrong
>> branch to look this up.
>
>Alex: Probably worth adding that to the list in the cover letter as it looks like you were planning on a v4 anyway (which I guess you now have to do, given that I just added the issue to RISC-V).

The only use that is uapi is the *default* length of the command line if the kernel header doesn't include it (in the case of x86, it is in the bzImage header, but that is atchitecture- or even boot format-specific.)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
