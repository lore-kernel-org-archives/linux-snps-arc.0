Return-Path: <SRS0=9HNX=2J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5D4C43603
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2019 14:58:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E3820684
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2019 14:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qErnmapP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hOqgLogc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="T5cTHyt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E3820684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtRXJt9A2HrtBTjcJY6avbK9vg9fE0o5ZsfUFbAVdSI=; b=qErnmapP3UE/fJ
	TqZn6OD9aG4e2t5cpGgjOqj2tXGRqVOmwS2jBEfJfFRUPLTHeS82BuUUUHVkJwCgFor/2AcRNUYSk
	0DCLNb/lDwSDpxT0G1GZOVZRdb9yjwqVEKmauvtXKe4l1Ej3hKWtHNSOSbi6UJgeia5vI4UWWESDH
	GOFjhpLEoOVcUkhZ0VHDKWzDG6ihcexnKaQ4x+k67qycVPUmiNxquoSKUTiDQp2HP85oy8k82De8Q
	wCecwDHAwoGXVJBgKE3qdO1jtCWpBnPmwFPCeqKmQ1/Nkt93mVcvzUbVDk0eT+SbrmUhksidKy0DV
	oQ9BVVXXZ6+1O9FegDwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihxG5-0006Xj-H3; Thu, 19 Dec 2019 14:58:33 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihxG1-0006XB-C5
 for linux-snps-arc@lists.infradead.org; Thu, 19 Dec 2019 14:58:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2633DC00E2;
 Thu, 19 Dec 2019 14:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576767507; bh=REXuGA04+wXNWEvW8BNujXiwYqxTVIgwvrGpFxgiOjQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hOqgLogc+3FLLBov0grvqczm4wBZ6/R4NKKzMrlCV2JXMvXnEFzdycgGk+FtUVc0E
 2pQ0zG2qWvlJ9L0SnKajIJjGH05uWU2GlZRY4hKLOcSzEh+DoN9LVDs6+8w5KFwrD/
 zk8/172I7zvegIFLWRyU3xjzRMmoGj6ZJnOrAmEuL/aWmVWAa3Vq6x8pw6QxrchZUW
 B0WPVvQOciCGkXGRWK73XbZx7qf427Tm3k/zB9ha3rjA8+Ep+DT1ydiXGf51r2VM3w
 zczrr2uc8763np8B7vkEPQDktovywvLdOiytfUNnt03NKmns0yQW549syxKUVa+z8e
 DIZs3SJY6QhOw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 84680A0079;
 Thu, 19 Dec 2019 14:58:26 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 19 Dec 2019 06:57:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 19 Dec 2019 06:57:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ge82HlF7WSQ8DUACviU9SfffolI2HzS/eI/er3z3REpa/4kUyeMBFyEVlV/FKesZktZL9Tooi1LoCTsE7mC9QsqZRWsv+4HbWM683qiA0/jT5tZev7V3pTIgIQxk4W7p5CpBY7lovC488Ec9xvDzlvnNoxu+OUg2gDYAf2IPysuDLfxqeSMpwJLMUvIHYGkvtCNheFy7KGBevgU4KZiWF3qZZN4su7qTPaJ5U+ZIayn45oMIZMzmBA0dMdUJKRkImEcmm/OjqVdm3Yz5wrWuwcIArCweP64rcpFuZrqbVWljor7g6Uo64jG8SVtUDAQKmWjr3tEKbCq4osYB5AyNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQMC95Zgdj+r//KR+oVwkTO1o54RUkjuoaMmWkTIZE0=;
 b=CvAtBy5/koK4ZO+BHgQqqosxcTq66hDxhzdTjB8G0M0cpWBXGZY3PYCwbT5m0VNqFzXfz9YY8xGIAqlsIHT7WTkS8zhP4smeA0PKOMlOxe2Z1jFijOPPJDnOKLNJsjQUgBkpkD9/bkfHkCWBqLtXzRQJBrjUS5ubZQV3jmzjyJZG/E94le3hWoNG2QJh+shZ8u6TyjaC0zZEqQz0FJXowf+lB8nIhQToe46kD2iiE8/fYIF/L8LTWfh6yqvgoehHxuTODIEfCKa9I2GCB2wNe1iyl7XxIVo9K6nYBCHQzwQY96quU6c+9CphpPyLOmaeTQXICrYMQVQ1iJ8SimZG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQMC95Zgdj+r//KR+oVwkTO1o54RUkjuoaMmWkTIZE0=;
 b=T5cTHyt1aS28f7v32xx2+kFVW8Ax6TQ58GBfG8W+oBpBIxgtwbb7PDmmb5L0u0dkJWHuvLAUmVpmgU3/YuXk+9gV+BoEdRL/R/rzF9WiSoEIRXLUD0dTVoeRC5rgwseD9PptMVttIu1YbGP4vwt4Lh0UupIJU6SZX0gjYJ1M8yI=
Received: from DM6PR12MB4044.namprd12.prod.outlook.com (10.141.187.81) by
 DM6PR12MB3771.namprd12.prod.outlook.com (10.255.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Thu, 19 Dec 2019 14:57:46 +0000
Received: from DM6PR12MB4044.namprd12.prod.outlook.com
 ([fe80::1c55:fa96:6e5d:47af]) by DM6PR12MB4044.namprd12.prod.outlook.com
 ([fe80::1c55:fa96:6e5d:47af%7]) with mapi id 15.20.2559.012; Thu, 19 Dec 2019
 14:57:46 +0000
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [RFC/RFT WIP PATCH] arc: add sparsemem support
Thread-Topic: [RFC/RFT WIP PATCH] arc: add sparsemem support
Thread-Index: AQHVE9kgervK3FPeGU++Rwml/5TbtKfC0KG5
Date: Thu, 19 Dec 2019 14:57:46 +0000
Message-ID: <DM6PR12MB4044A24346C2252684596421DE520@DM6PR12MB4044.namprd12.prod.outlook.com>
References: <1558885095-21540-1-git-send-email-rppt@linux.ibm.com>,
 <1558885095-21540-2-git-send-email-rppt@linux.ibm.com>
In-Reply-To: <1558885095-21540-2-git-send-email-rppt@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfbf94c0-3b71-4eb2-a997-08d78493cf39
x-ms-traffictypediagnostic: DM6PR12MB3771:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB37716228304BAA83FCAE7C6BDE520@DM6PR12MB3771.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39850400004)(136003)(346002)(376002)(199004)(189003)(52536014)(478600001)(966005)(64756008)(91956017)(66556008)(66446008)(76116006)(33656002)(66476007)(186003)(66946007)(26005)(7696005)(2906002)(4326008)(316002)(6506007)(8936002)(53546011)(107886003)(55016002)(5660300002)(71200400001)(8676002)(54906003)(30864003)(81156014)(6916009)(81166006)(86362001)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3771;
 H:DM6PR12MB4044.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWtWYRrl4e4EFyoaqAeOV2FFKc1Tef9z+D+DEvrfmK0eM2WagMz8ZSMH7Xciklrre9MQ+s9MYdi2ve13MYtw2kQFKxpKSMVqvqgc5N39OoRMfOcIUoyq73pT6w5prCU9iEeayugHYA418+usOuNwp3x9qAQuIvE+sWuveUolF7esifOhEc6+HRsYUA4RjtrvWxF5zeeGhGjlKZyF0jpBDB8ai4HAVlSKPW9JjBLJZyF2ZuM0CP3dMtJR0ZlbdL3QRIyGwtx41eh/6EIHFctjwJHLFyZJY37egBqyiEBgeHFc9222qvlpGqIbyg4wIRN6Ec9wmLxwKVY4SfPEoKEe3Q3h60zCqUhp0/CpI+uGBHMuqX0vCjvmfgSd9yKLx6gKvNvLt7zapj7qVI5XDmeFJVs4FGrAsRCqrIfzNrGH9vKOM16TTpQJFHBXx6VNj5Z4G30Hg7fZ6HRq6evSsY3hSpGcW91qbpWqwdxBVMxn+Ec=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbf94c0-3b71-4eb2-a997-08d78493cf39
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 14:57:46.6592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3bSNnfoGBkQvOiZksLN0C8XnGsrLWswj0fvfKcOCT1Jfs5ci33/eFPmcNTc6QHiBkQO7EoIs5CsI2TMo460hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3771
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_065829_543085_E6CB4790 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike,

Sorry for late respond.
I've tested this patches but the kernel crashes in the memory initialization code.
Here is bootlog:

------------------------->8-----------------------------
Linux version 5.1.0+ (paltsev@paltsev-e7480) (gcc version 8.2.1 20180814 (ARCv2 ISA Linux uClibc toolchain 2018.09)) #1 PREEMPT Thu Oct 31 02:25:55 MSK 2019
Memory @ 80000000 [512M] 
Memory @ 100000000 [1024M] 
OF: fdt: Machine model: snps,nsim_hs
earlycon: arc_uart0 at MMIO32 0xc0fc1000 (options '115200n8')
printk: bootconsole [arc_uart0] enabled
archs-intc	: 15 priority levels (default 1)

IDENTITY	: ARCVER [0x51] ARCNUM [0xff] CHIPID [ 0x0]
processor [0]	: HS38 R2.0 (ARCv2 ISA) 
Timers		: Timer0 Timer1 RTC [UP 64-bit] 
ISA Extn	: atomic ll64 unalign mpy[opt 9] div_rem 
BPU		: partial match, cache:2048, Predict Table:16384 Return stk: 8
MMU [v4]	: 8k PAGE, 2M Super Page (not used) JTLB 512 (128x4), uDTLB 8, uITLB 4
I-Cache		: 16K, 2way/set, 64B Line, VIPT
D-Cache		: 16K, 4way/set, 64B Line, PIPT
Peripherals	: 0xc0000000
Vector Table	: 0x80000000
DEBUG		: ActionPoint 4/full
Built 1 zonelists, mobility grouping on.  Total pages: 196320
Kernel command line: earlycon=arc_uart,mmio32,0xc0fc1000,115200n8 console=ttyARC0,115200n8 print-fatal-signals=1
Dentry cache hash table entries: 65536 (order: 5, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 4, 131072 bytes)

Oops
Path: (null)
CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0+ #1

[ECR   ]: 0x00050100 => Invalid Read @ 0x01200000 by insn @ 0x800a8bc6
[EFA   ]: 0x01200000
[BLINK ]: mem_init+0x40/0x58
[ERET  ]: free_highmem_page+0x6/0x88
[STAT32]: 0x00080002 :   K     
BTA: 0x800a8bc0	 SP: 0x803ebfd8	 FP: 0x00000000
LPS: 0x802fbd3c	LPE: 0x802fbd44	LPC: 0x00000000
r00: 0x01200000	r01: 0x0000000a	r02: 0x00000000	
r03: 0x000a0000	r04: 0x00000021	r05: 0x00000000	
r06: 0x646f6e49	r07: 0x61632d65	r08: 0x20656863	
r09: 0x68736168	r10: 0x00000016	r11: 0x6520656c	
r12: 0x800066e4	

Stack Trace:
  free_highmem_page+0x6/0x88
  mem_init+0x40/0x58
------------------------->8-----------------------------

So we have invalid memory access here:
------------------------->8-----------------------------
void __init mem_init(void)
{
#ifdef CONFIG_HIGHMEM
	unsigned long tmp;

	reset_all_zones_managed_pages();
	for (tmp = min_high_pfn; tmp < max_high_pfn; tmp++)
		free_highmem_page(pfn_to_page(tmp));           // <<<<<<<<------
#endif

	memblock_free_all();
	mem_init_print_info(NULL);
}
------------------------->8-----------------------------


BTW, you can also test your future changes by yourself. For that you can use 
nSIM free simulator which provides an instruction accurate processor model for
the ARC processors. To download nSIM free you need request it via this form:
https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
You will be able to download it after the from will be approved.

You can find instructions describing how to run Linux with nSIM free here:
https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/How-to-run-ARC-Linux-kernel-and-debug-(with-MetaWare-Debugger)#standalone-nsim-also-free-nsim

If you are going to rebase you patches on v5.5 kernel (or newer) please also read this note:
https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/How-to-run-ARC-Linux-kernel-and-debug-(with-MetaWare-Debugger)#v55-linux-kernel-note

Thanks.
---
 Eugeniy Paltsev


________________________________________
From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> on behalf of Mike Rapoport <rppt@linux.ibm.com>
Sent: Sunday, May 26, 2019 18:38
To: Vineet Gupta
Cc: linux-snps-arc@lists.infradead.org; Mike Rapoport
Subject: [RFC/RFT WIP PATCH] arc: add sparsemem support

Add support for initialization of SPARSE memory model along with Kconfig
options that will allow its selection during the kernel configuration.

Certain configurations of ARC require that the memory that is not directly
mapped by the kernel (ZONE_HIGHMEM) will be below the memory that is always
mapped into the kernel page tables (ZONE_NORMAL).

For such configurations ZONE_NORMAL and ZONE_HIGHMEM were present on
different nodes.

With SPARSEMEM, there is a single node containing all the memory, but it is
initialized using dedicated free_area_init_node_exact_zones() routing that
takes the exact zone extents rather then their sizes.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/Kconfig                 |  9 +++++
 arch/arc/include/asm/sparsemem.h | 13 +++++++
 arch/arc/mm/init.c               | 84 ++++++++++++++++++++++++++++------------
 include/linux/mm.h               |  3 ++
 mm/page_alloc.c                  | 37 ++++++++++++++++++
 5 files changed, 121 insertions(+), 25 deletions(-)
 create mode 100644 arch/arc/include/asm/sparsemem.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 23e063d..9b6c31d 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -47,6 +47,7 @@ config ARC
        select OF_EARLY_FLATTREE
        select PCI_SYSCALL if PCI
        select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
+       select SPARSEMEM_STATIC if SPARSEMEM

 config ARCH_HAS_CACHE_LINE_SIZE
        def_bool y
@@ -66,9 +67,15 @@ config GENERIC_CSUM
 config ARCH_DISCONTIGMEM_ENABLE
        def_bool n

+config ARCH_SPARSEMEM_ENABLE
+       def_bool n
+
 config ARCH_FLATMEM_ENABLE
        def_bool y

+config ARCH_SELECT_MEMORY_MODEL
+       def_bool n
+
 config MMU
        def_bool y

@@ -449,6 +456,8 @@ config LINUX_RAM_BASE
 config HIGHMEM
        bool "High Memory Support"
        select ARCH_DISCONTIGMEM_ENABLE
+       select ARCH_SPARSEMEM_ENABLE
+       select ARCH_SELECT_MEMORY_MODEL
        help
          With ARC 2G:2G address split, only upper 2G is directly addressable by
          kernel. Enable this to potentially allow access to rest of 2G and PAE
diff --git a/arch/arc/include/asm/sparsemem.h b/arch/arc/include/asm/sparsemem.h
new file mode 100644
index 0000000..b23bedd
--- /dev/null
+++ b/arch/arc/include/asm/sparsemem.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARC_SPARSEMEM_H
+#define _ASM_ARC_SPARSEMEM_H
+
+#ifdef CONFIG_ARC_HAS_PAE40
+#define MAX_PHYSMEM_BITS       40
+#define SECTION_SIZE_BITS      32
+#else
+#define MAX_PHYSMEM_BITS       32
+#define SECTION_SIZE_BITS      31
+#endif
+
+#endif /* _ASM_ARC_SPARSEMEM_H */
diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 02b7a3b..ad9ba05 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -78,6 +78,62 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
                base, TO_MB(size), !in_use ? "Not used":"");
 }

+#ifdef CONFIG_SPARSEMEM
+static void setup_memory_model(void)
+{
+       unsigned long zones_size[MAX_NR_ZONES] = { 0 };
+       unsigned long zones_start[MAX_NR_ZONES] = { 0 };
+       unsigned long node_min_pfn = min_low_pfn;
+
+       memblocks_present();
+       sparse_init();
+
+       zones_start[ZONE_NORMAL] = min_low_pfn;
+       zones_size[ZONE_NORMAL] = max_low_pfn - min_low_pfn;
+
+       if (high_mem_sz) {
+               zones_start[ZONE_HIGHMEM] = min_high_pfn;
+               zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
+
+               node_min_pfn = min(min_low_pfn, min_high_pfn);
+       }
+
+       free_area_init_node_exact_zones(0,              /* node-id */
+                                       node_min_pfn,   /* first pfn of node */
+                                       zones_size,     /* num pages per zone */
+                                       zones_start);   /* firts pfn of zone */
+}
+
+#elif defined(CONFIG_DISCONTIGMEM)
+
+static void setup_memory_model(void)
+{
+       unsigned long zones_size[MAX_NR_ZONES] = { 0 };
+       unsigned long zones_holes[MAX_NR_ZONES] = { 0 };
+
+       /*
+        * Populate a new node with highmem
+        *
+        * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
+        * than addresses in normal ala low memory (0x8000_0000 based).
+        * Even with PAE, the huge peripheral space hole would waste a lot of
+        * mem with single mem_map[]. This warrants a mem_map per region design.
+        * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
+        *
+        * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
+        * populated with normal memory zone while node 1 only has highmem
+        */
+       node_set_online(1);
+
+       zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
+
+       free_area_init_node(1,                  /* node-id */
+                           zones_size,         /* num pages per zone */
+                           min_high_pfn,       /* first pfn of node */
+                           zones_holes);       /* holes */
+}
+#endif /* CONFIG_SPARSEMEM || CONFIG_DISCONTIGMEM */
+
 /*
  * First memory setup routine called from setup_arch()
  * 1. setup swapper's mm @init_mm
@@ -142,6 +198,7 @@ void __init setup_arch_memory(void)
        zones_size[ZONE_NORMAL] = max_low_pfn - min_low_pfn;
        zones_holes[ZONE_NORMAL] = 0;

+#ifdef CONFIG_FLATMEM
        /*
         * We can't use the helper free_area_init(zones[]) because it uses
         * PAGE_OFFSET to compute the @min_low_pfn which would be wrong
@@ -153,34 +210,11 @@ void __init setup_arch_memory(void)
                            min_low_pfn,        /* first pfn of node */
                            zones_holes);       /* holes */

-#ifdef CONFIG_HIGHMEM
-       /*
-        * Populate a new node with highmem
-        *
-        * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
-        * than addresses in normal ala low memory (0x8000_0000 based).
-        * Even with PAE, the huge peripheral space hole would waste a lot of
-        * mem with single mem_map[]. This warrants a mem_map per region design.
-        * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
-        *
-        * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
-        * populated with normal memory zone while node 1 only has highmem
-        */
-       node_set_online(1);
-
+#else
        min_high_pfn = PFN_DOWN(high_mem_start);
        max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);

-       zones_size[ZONE_NORMAL] = 0;
-       zones_holes[ZONE_NORMAL] = 0;
-
-       zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
-       zones_holes[ZONE_HIGHMEM] = 0;
-
-       free_area_init_node(1,                  /* node-id */
-                           zones_size,         /* num pages per zone */
-                           min_high_pfn,       /* first pfn of node */
-                           zones_holes);       /* holes */
+       setup_memory_model();

        high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
        kmap_init();
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834a..5d47dee 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2107,6 +2107,9 @@ extern void __init pagecache_init(void);
 extern void free_area_init(unsigned long * zones_size);
 extern void __init free_area_init_node(int nid, unsigned long * zones_size,
                unsigned long zone_start_pfn, unsigned long *zholes_size);
+extern void __init free_area_init_node_exact_zones(int nid,
+               unsigned long node_start_pfn, unsigned long *zones_size,
+               unsigned long *zones_start);
 extern void free_initmem(void);

 /*
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 3b13d39..7a708b9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6810,6 +6810,43 @@ void __init free_area_init_node(int nid, unsigned long *zones_size,
        free_area_init_core(pgdat);
 }

+void __init free_area_init_node_exact_zones(int nid,
+                                           unsigned long node_start_pfn,
+                                           unsigned long *zones_size,
+                                           unsigned long *zones_start)
+{
+       pg_data_t *pgdat = NODE_DATA(nid);
+       unsigned long totalpages = 0;
+       enum zone_type i;
+
+       /* pg_data_t should be reset to zero when it's allocated */
+       WARN_ON(pgdat->nr_zones || pgdat->kswapd_classzone_idx);
+
+       pgdat->node_id = nid;
+       pgdat->node_start_pfn = node_start_pfn;
+       pgdat->per_cpu_nodestats = NULL;
+
+       for (i = 0; i < MAX_NR_ZONES; i++) {
+               struct zone *zone = pgdat->node_zones + i;
+               unsigned long size = zones_size[i];
+
+               zone->zone_start_pfn = zones_start[i];
+               zone->spanned_pages = zone->present_pages = size;
+
+               totalpages += size;
+       }
+
+       pgdat->node_spanned_pages = totalpages;
+       pgdat->node_present_pages = totalpages;
+       printk(KERN_DEBUG "On node %d totalpages: %lu\n", pgdat->node_id,
+                                                       totalpages);
+
+       alloc_node_mem_map(pgdat);
+       pgdat_set_deferred_range(pgdat);
+
+       free_area_init_core(pgdat);
+}
+
 #if !defined(CONFIG_FLAT_NODE_MEM_MAP)
 /*
  * Zero all valid struct pages in range [spfn, epfn), return number of struct
--
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN1MriPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=km3pqqSiGIrbaUQv0sK9eZBHx9g-rqWaJ6pwsCbiNtw&s=YjkIJuc5SRPRLmuwX90J87ghv-Ffmn98lbGQoEJDRlg&e=

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
