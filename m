Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65D1606A320
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2026 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZX/Rzt//;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Sl19RIdo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kwCSsJaF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=wwehnducC5ATPAKZBCgUVOtxUxdujhDCBdHYF88p9QY=; b=ZX/Rzt//NXMquSu8dcycOMZJbO
	WZpMfnEhBOLUZQqhP+9MU9ukXGsZagZeEBok+QfZIXl0qrhM9DWWFamoOa0o303/KRuCNbPt3M0GP
	M+iy4m1dE9ziNbphXECK2QCzKEOKKY6zBKcXEmGK1zvDGjXEL2Ebq/8kz+2gDaZo38ZiVLCX7iPX0
	8oJSr35XlmctS4+Sb23h9z5WWZJZ+HiCH79QdillKZniLafVohDAF1EZMrg4oTLtqlYcHJzTzkykj
	hZselgy+ZtXJFecuYJAnSUX2fA8JpHYSZtSDL2RdvI8y9elGiBlgxHCvXsmGIRZZ1BRY7heItYVqe
	0HYe8m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiBZ-0000000H1dJ-1ydl;
	Sat, 21 Nov 2026 10:19:09 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiBV-0000000H1cc-2VT3
	for linux-snps-arc@lists.infradead.org;
	Sat, 21 Nov 2026 10:19:08 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AC39414003B6
	for <linux-snps-arc@lists.infradead.org>; Sat, 21 Nov 2026 05:19:00 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 21 Nov 2026 05:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795256339;
	 x=1795342739; bh=0i2RZjftSStdvjT26RVNrK0X4WD4WsU8buWEUfYaDkA=; b=
	Sl19RIdopFfPFw2p2r0FkpT5VlzB5fySxJbRRjaYg7ctVn9t7y86MuBfUXkx1AjV
	DJJ/5VjgFbE5EUS4daE/NZYPOi6GTr94TRf8aluVYA0vFTD0tHUjhJaLT7QXG4o7
	q98hJKGAjhz8gSKmGDtju7lkb4R9biicYHosWZewyZrJuzUhJHH4pQ8aWTGDn8uk
	ihYqgGrJS+QYev3sNNwFh4CnjEZ/7LdBDqsHrESP+JVUI0lNJ6n/PPJSBBwBFjHW
	gYMRWrqDugLF9spz6QnCrW4iw8nIN31RgUH5gNTdGeldgNDW6Vwu0o62BzTRtNBs
	aWVWxQ9Cj2zU5UjrP18RNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795256339; x=
	1795342739; bh=0i2RZjftSStdvjT26RVNrK0X4WD4WsU8buWEUfYaDkA=; b=k
	wCSsJaFV3ZNTeZoQpRGGOW4nOfvnOLKAwveIia0fMTHE8onwSykOxf1asL7bWc8j
	Cfjq08pfPbL0p8W7bg85RGoHXFzX+gOLbaktxIMQyknckVmT7aaV2D2Cge8J3dqZ
	qRF2ogoRBnTKQsXCicJqxP5pAwlTLCLGO6oL2IKGZxuxR2NlKo7Ps1ylM+GbVh5X
	8WnZBaOw9qJdDdsHhb0JRRQCsMAPvQDOAjyzah+uEpsRZHCgEuM/w7/DBEYPaStF
	h3xAHV1FtifUW+eM+QqQ65nERR/OdTP/fZUn0M7OFEgETCHmaF5Db5O+7F+lTZRV
	owgXUgUH1Ixvmas+U30zw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795256339; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:DgRVzLiF6boEDRPBuMnf3weyuJ34oBQLBqIzTDcVcnUi7v4
	3oLOWXoHMDGlro4NoMBQsl1KBxHvNVZHECAdJymDansYLO5fG445b/tF/tzSd8Ju
	Ws2qpNV4WozLJLNPaE9eujfK77F5RWNNplfGeDKLA5dKBiiwx1k6sZizMNPOYO3+
	5YCIV7Xx2JkHRVGC0hYitrWt5cMbD71L8cPI2gkk8Ax6ekyRPcJrej1VBKm3//8X
	sEuTNZ7tosTNAgRYU09BvX37vlP5TCHF7BCRWCw07eNmwtTJb1cNHQdUy8YZXJAS
	IJtqew0M/iVoWmF3I7pJUit0eWW8Ow8qN23ij+g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yqD/FmXZljdyQiUFDJYEx/4iiCA0LQnUyEYAKvk6x+I=:SaZhmevZseYNj8BYa1MZacE8OaKkN9to1HzsTqm5YKg=;
X-ME-Sender: <xms:D3ABa2fIMZzKGR5hII2nRkctAySJk7BE49R_AdCsVYP0JXD9-Ds9jg>
    <xme:D3ABa7CxwSdjWYNMhSLiWbzzCkkv6yTiUKdXtGGVKjaXoTSg0Uviu5cmSU39f0dgX
    4GrIU5WLLONCSlYNwLkPKuDPnJmPHKzkSidhn7_U0NbufjyCymROg>
X-ME-Proxy-Cause: dmFkZTFFq/RFRtsgGQdv5iAMLs3oNd4tFruLJNmDKGQSzqUOqJKymCaxn6q3mKWOgSTsY2
    8ZIVReXnvjQIVUXQjL6n75fSU5akFU/BEx4uIZC9vWAnuUpYBP7A885yXFgbksvziIhi4h
    8GeQtl1QoKeeFc6o34N7EBkLbP5Ux7c5UxS+P87+Bn44WEJ23xFi2IFJJw0KWe5E19QxM/
    CfOPNjDh4T/AV7dg7sEH6vxopxjpS3Kx4f+r6Hg/QUZEdzGYvnxzVKrBCZvpDWXTVXPBqk
    NzIVppT9bdag9QgJThPoA2/yTcKmWLDO3mQ9CkGs1vsYFY0buTOPRwpd3qceqt982/NASE
    jbINSt2yDy19JKV3KPgDLOo7tvD+RnEDQHXPgUmq70fkieWrbqwsioh28mQbKeH4GFU1Bg
    ClL1YlIwzXDlLZJ7m6EyGgI49ZHRO33dD3scKhMFMlhtNuhptF8Yu0KaKFx9/5PIHJphGy
    W+uny/QuvP/zA8E6OomuqGiS82Dkg+0pV/2xg7D/yQdqv6+Ec2zMyp1ThhHWou0eFCfNOJ
    Wc7bAEk3yXqH/IcapNAz6/HCxAXVkyDBnv2bxK0qarizMMrgcUCjPSwb/3leL1njfbD1Ci
    vTE8IQ87Wp4owwfpKtXWJsFm5knFdTxg2iUlsax5VTPHkayD/8M/8mQ7SuFw
X-ME-Proxy: <xmx:EHABa2kI7Zsdhiu2E4cXuDbS5m5CR8NWFJIEbpMKmRmP6V7p1QG2dg>
    <xmx:EHABa5Q43XZH4f0LvF7HUR6HpF0yvIELAGODtlkCiXDLIjN9RPfqlA>
    <xmx:EHABa4IiYWXPf0HkZlFT3RmFG53KxwYBUX0505Lofe7QmIO5lGb_MA>
    <xmx:EHABa_BjYRbOL_pmQvkkwuao3Nd_duzLEYpdJXiwDiZgv6sEOEfKLw>
    <xmx:E3ABay3QAbmaubFSzmZGh3TXKWz9mB_G3agfN74VvaeZjWHHv4YVEcKa>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 274F232A009C; Sat, 21 Nov 2026 05:18:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: A7YRnwEcAcgN
Date: Sat, 21 Nov 2026 11:18:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "Vineet Gupta" <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Message-Id: <5d49465f-8584-4e75-8973-9fbf326bce58@app.fastmail.com>
In-Reply-To: <awDriH64LFbN0dkI@rli9-mobl>
References: <awDriH64LFbN0dkI@rli9-mobl>
Subject: Re: [linux-next:master 8956/10560] main.c:undefined reference to
 `__st_r13_to_r15'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_021905_957912_0246E578 
X-CRM114-Status: GOOD (  16.57  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026, at 01:53, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   909ef7a9a30fa139e69e555e3606680f5cca7726
> commit: 86a4eab2bd8313fec6e54742e3ea187b65b86b07 [8956/10560] ARC: stop 
> linking libgcc
> config: arc-randconfig-2000-20261120 
> (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/20261121004452.TskH9STt-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arc-linux-ld: init/main.o: in function `__traceiter_initcall_finish':
>>> main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>> arc-linux-ld: main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'

I've managed to reproduce this, but only with gcc-12 and older,
not gcc-13 and up. I also found a workaround, but I'm not sure if this
is a good idea or not:

--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
 CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux- arc-linux-gnu-)
 endif
 
-cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -D__linux__
+cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -mno-millicode -D__linux__
 
 tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)  := -mcpu=arc700
 tune-mcpu-def-$(CONFIG_ISA_ARCV2)      := -mcpu=hs38

The alternative of course is to include the libgcc file that includes the
millicode helpers.

I also came across the "-fno-builtin", which seems like a bad idea because
it prevents a number of optimizations. I could get it to build without the
argument using two oneline changes, but that doesn't mean this is correct
or complete:

--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -143,7 +143,7 @@ static inline __attribute__ ((const)) unsigned long __fls(unsigned long x)
  * ffs = Find First Set in word (LSB to MSB)
  * @result: [1-32], 0 if all 0's
  */
-static inline __attribute__ ((const)) int ffs(unsigned int x)
+static inline __attribute__ ((const)) int ffs(int x)
 {
        int n;
 
a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -156,4 +156,5 @@ void do_insterror_or_kprobe(unsigned long address, struct pt_regs *regs)
 void abort(void)
 {
        __asm__ __volatile__("trap_s  5\n");
+       unreachable();
 }

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
