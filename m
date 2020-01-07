Return-Path: <SRS0=s6v2=24=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E838C33C99
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 06:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 272E52075A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 06:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ew+ezzEM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 272E52075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+ZWDxDH/JYh7Q4DGlVUJA2vydpwO+fWL/cS7c8fDqY=; b=ew+ezzEMKzL0I4
	E/OQakkY4Jxh1k7+xPR5F9QNa/0b46GHgrJWktxRoMsr0fso/GUnn9FtnlC4MW3aE7ius6OuO2NYB
	Ruo3I575YYgWMc6+H6OjI2kteVEXprbLEie6z5gsQgnJeRyzB+Q8WO52Zvdx0IzcKZzhIfkq12VVH
	+PVk/KkLMYyBS3U6p0YyjctWuXYQvu4e6ckukyfLh8rwa74YNLi55eRnSUgCIyj1HYsqghyYOTOH1
	2b5QUozWggq77JumzB9UEt1Pjocx3DBkQA8QQoKTfvqBqY7BjxdHKkqgQ7XuJnx042GaPd//6EJhD
	XKGg3VEBS0+RI2+zhJyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioicC-0005BB-TW; Tue, 07 Jan 2020 06:45:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioiby-00049R-Ds; Tue, 07 Jan 2020 06:45:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E7731B;
 Mon,  6 Jan 2020 22:45:02 -0800 (PST)
Received: from [10.162.43.133] (p8cg001049571a15.blr.arm.com [10.162.43.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 A45EE3F703; Mon,  6 Jan 2020 22:48:16 -0800 (PST)
Subject: Re: [mm/debug] 87c4696d57: kernel_BUG_at_include/linux/mm.h
To: kernel test robot <rong.a.chen@intel.com>
References: <20191227142255.GD2760@shao2-debian>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <490e77d6-a3ef-dd70-4c29-b90234f8a13d@arm.com>
Date: Tue, 7 Jan 2020 12:16:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191227142255.GD2760@shao2-debian>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_224506_562808_3062E3D0 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, lkp@lists.01.org,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/27/2019 07:52 PM, kernel test robot wrote:
> [    9.781974] kernel BUG at include/linux/mm.h:592!
> [    9.782810] invalid opcode: 0000 [#1] PTI
> [    9.783443] CPU: 0 PID: 1 Comm: swapper Not tainted 5.5.0-rc3-00001-g87c4696d57b5e #1
> [    9.784528] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
> [    9.785756] EIP: __free_pages+0x14/0x40
> [    9.786442] Code: 0c 9c 5e fa 89 d8 e8 5b f3 ff ff 56 9d 5b 5e 5d c3 8d 74 26 00 90 8b 48 1c 55 89 e5 85 c9 75 16 ba b4 b6 84 d6 e8 ac 49 fe ff <0f> 0b 8d b4 26 00 00 00 00 8d 76 00 ff 48 1c 75 10 85 d2 75 07 e8
> [    9.789697] EAX: d68761f7 EBX: ea52f000 ECX: ea4f8520 EDX: d684b6b4
> [    9.790850] ESI: 00000000 EDI: ef45e000 EBP: ea501f08 ESP: ea501f08
> [    9.791879] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010286
> [    9.792783] CR0: 80050033 CR2: ffffffff CR3: 16d00000 CR4: 000406b0
> [    9.792783] Call Trace:
> [    9.792783]  free_pages+0x3c/0x50
> [    9.792783]  pgd_free+0x5a/0x170
> [    9.792783]  __mmdrop+0x42/0xe0
> [    9.792783]  debug_vm_pgtable+0x54f/0x567
> [    9.792783]  kernel_init_freeable+0x90/0x1e3
> [    9.792783]  ? rest_init+0xf0/0xf0
> [    9.792783]  kernel_init+0x8/0xf0
> [    9.792783]  ret_from_fork+0x19/0x24
> [    9.792783] Modules linked in:
> [    9.792803] ---[ end trace 91b7335adcf0b656 ]---
> 
> 
> To reproduce:
> 
>         # build kernel
> 	cd linux
> 	cp config-5.5.0-rc3-00001-g87c4696d57b5e .config
> 	make HOSTCC=gcc-7 CC=gcc-7 ARCH=i386 olddefconfig prepare modules_prepare bzImage
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in this email

Hello,

As the failure might be happening during boot when the test executes,
do we really need to run these LKP based QEMU environment in order to
reproduce the problem ? Could not this be recreated on a standalone
system.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
