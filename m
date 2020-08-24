Return-Path: <SRS0=xDVn=CC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A52CC433E1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2020 09:58:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435C220639
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2020 09:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N5IPOc/w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zQK29oix";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2UjFVzZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 435C220639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wyHNLo8YR7Mh+4dFAC3IfYNgf65FwocGWZeCE5cEdB4=; b=N5IPOc/w/ATNSdj5jWiyVPf9v
	FEThtPNw9ejfHKCI9d6b40gzbOkkMdsi79E7W6vBvHCcAp4EIyVx/kq2ScjiOQ1epqPB/2ASuj/Xt
	2bSuTiz3r+jpCi77/2cyWqba4AeH34LtaNmJa7/CMlyeaYPd6qNZIue9l7RGnE9qRKzHDQy1Ls/UY
	vpdA6E9YdF/mjaYLHAR+Mf7pOsyXYyXJBJmhocO97gASxPJHLEMeIVopd811VF07PFCSGrtjjs7Cv
	nUH1nYydbaWYIA/Wd6VHjLt7B+gGpjilVd1aOXWvVrL6p0GX39IgTA1KV9YVuYu3UicVY2cINDDQ0
	NkyOhl1YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA9FT-0007Qd-Nm; Mon, 24 Aug 2020 09:58:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9FP-0007Nz-As
 for linux-snps-arc@lists.infradead.org; Mon, 24 Aug 2020 09:58:40 +0000
Date: Mon, 24 Aug 2020 11:58:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598263113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VBtkaB/urMRjE3KDZiHlShNfLKbL53xdqqZJYFhzB6U=;
 b=zQK29oix1xwa06jMXLKYr+zKUzHU699aC1Y7GbINccUZlofpr3TVjS229SPdTOywDmRmKR
 NNq9UoeBjWaX/R0F6hxFHm8jAhzoNfGfnpSw2mp7P9jQG9M97ORA3QzC/jsF8D6S6Y5e1B
 ne7B3kt63HE45NchLkJPB+UXmLbYw80+j6TftpzTPGbjGe04I5GnFsUgkLuNb64Lb3jfiQ
 HbgRSoBno6ntZfeDAc7O0Zsfs6uKaQJorFtdJjLx+iRcyW76iysPwWEn9vTdvdGWpIgLLU
 HBO8tdEm3he973k81nulL2wfvZ9fWZPsghPqTMMzRVj4qbJCkzBzl3OBROYdhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598263113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VBtkaB/urMRjE3KDZiHlShNfLKbL53xdqqZJYFhzB6U=;
 b=2UjFVzZIp1GezRNJ7apJWJOzysrfRYWMPEkSSV724oBmU7zCnuPfW2s/wjn2aPmKMOQayW
 BxglsF10dTFJCpAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Subject: Re: {standard input}:5973: Error: operand out of range (512 is not
 between -512 and 511)
Message-ID: <20200824095831.5lpkmkafelnvlpi2@linutronix.de>
References: <202008241018.RkyIlLKd%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202008241018.RkyIlLKd%lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_055839_517703_1B185E04 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2020-08-24 10:17:19 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d012a7190fc1fd72ed48911e77ca97ba4521bccd
> commit: de8f5e4f2dc1f032b46afda0a78cab5456974f89 lockdep: Introduce wait-type checks
> date:   5 months ago
> config: arc-randconfig-r004-20200824 (attached as .config)
> compiler: arc-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout de8f5e4f2dc1f032b46afda0a78cab5456974f89
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    {standard input}: Assembler messages:
> >> {standard input}:5973: Error: operand out of range (512 is not between -512 and 511)
> 

I have here gcc 10 and the output is:
|  CC      arch/arc/kernel/signal.o
|arch/arc/include/asm/bitops.h: Assembler messages:
|arch/arc/include/asm/bitops.h:236: Error: junk at end of line, first unrecognized character is `0'
|arch/arc/include/asm/bitops.h:236: Error: junk at end of line, first unrecognized character is `0'
|make[3]: *** [scripts/Makefile.build:283: arch/arc/kernel/signal.o] Error 1
|make[2]: *** [scripts/Makefile.build:500: arch/arc/kernel] Error 2
|make[1]: *** [Makefile:1788: arch/arc] Error 2

the reason is that:
| #ifndef CONFIG_ARC_PLAT_EZNPS
| BIT_OPS(set, |, bset)
| BIT_OPS(clear, & ~, bclr)
| BIT_OPS(change, ^, bxor)
| #else
| BIT_OPS(set, |, CTOP_INST_AOR_DI_R2_R2_R3)
| BIT_OPS(clear, & ~, CTOP_INST_AAND_DI_R2_R2_R3)
| BIT_OPS(change, ^, CTOP_INST_AXOR_DI_R2_R2_R3)
| #endif

and the config supplied does not accept CTOP_INST_AAND_DI_R2_R2_R3
(which is
	#define CTOP_INST_AAND_DI_R2_R2_R3              0x4A664C04
)
and the assembler does not like that.
After the removal CONFIG_ARC_PLAT_EZNPS I got to stage 2:
|drivers/irqchip/irq-eznps.c:80:16: error: 'CTOP_AUX_IACK' undeclared (first use in this function)
|   80 |  write_aux_reg(CTOP_AUX_IACK, 1 << irq);

so I removed CONFIG_EZNPS_GIC. And then I ended with:
|  LD      vmlinux.o
|arc-linux-ld: gcc-10.1.0-nolibc/arc-linux/bin/../lib/gcc/arc-linux/10.1.0/arc700/libgcc.a(_muldi3.o): compiled for a little endian system and target is big endian
|arc-linux-ld: failed to merge target specific data of file gcc-10.1.0-nolibc/arc-linux/bin/../lib/gcc/arc-linux/10.1.0/arc700/libgcc.a(_muldi3.o)

Please update CI and ARC.

Sebastian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
