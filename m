Return-Path: <SRS0=PcqJ=ZB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5D6C17440
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Nov 2019 00:17:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0EE207FA
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Nov 2019 00:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uTZiuJYr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="euJE2dOZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="WjoKB5tS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC0EE207FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4FCBj7FlQcbv3faGM1hjRFJ3O+eceK64UpC9FEGiWw=; b=uTZiuJYrfh8Kz6
	0J3UcnR2lRqb9HvC7hMkmTd0bpZlCxgOqIFaWLC804pLUyM+gM0fYD37LO6DiONMRDCSwurnF8XwZ
	MWZ7rovYJ6c1CigVKgOCDqMbGorPPpWjYivPjKDI4fC6EYbOltIh+WFmk04/jRuiMPamp4Bq0Xe/j
	u+qjZ8FggQrVT6lo83EAPYkLLKKKbT+OFRv4Mla58CV9q/TjhV+CImtjl0/YRFGn8s2KQh4GDvtTZ
	wuA2QFiS10fk9glEXhkAtBw8RU6hVrBs+or6woYbo/o2nNxwOqDux02U0pAGR8cI5DtWCNYlaWQcb
	3oaRwjOkcgEXKhkDuCYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTERR-000094-9O; Sat, 09 Nov 2019 00:17:25 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTERM-00007z-8u
 for linux-snps-arc@lists.infradead.org; Sat, 09 Nov 2019 00:17:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B088DC0DFC;
 Sat,  9 Nov 2019 00:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573258636; bh=/A59nrYjZxB9Nv+X7TF0xMF0+58qDb6lQS5tDFc6EwM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=euJE2dOZnEnEJT15oRvwfXRZ3hBCTpQ5cmmB69wU/1ebWtBqm9j2PfQyPxVKv9nze
 j6Wli3hPgVw5sqEu1cjjoiZDH641GmGvGKKWISuKwRlCh6NeCv/skrSLORd8JiEHcm
 EUmouu5wlyc9YjpWVhM/ukvv+6i10D4knSrxkp3Zmq/UDGaVP6j2h0dRrpeKkvlLPA
 MXPF5oQp7Wtr5mPdL1nsfpC0nA+ILOCjl+XgFo42uC6JvjdytIXNa5lL9E8oXQlzkD
 mrIZUpXXzP7su5qnxgCyMhf6qwFgQ+7tbkQakA24BEplvieqbpeQRyylVX9wakZl/n
 q9yUU+MgL0CPw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 625BFA006B;
 Sat,  9 Nov 2019 00:17:14 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 8 Nov 2019 16:17:04 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 8 Nov 2019 16:17:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kop/EaamPPmw63JPgSSHgP/1gf/3gZWbRgATvgKu6g8f3xVdC0lIEmp6hW+rV2CN3QaK5ggVlpkxC37xnk/Ty8bvu9vkNDKUpAPLGT9S8dweKjIabWFRl10Rbxvi2INigA8HcN2WucaCfmDmUGhRB/XvSG+uL79yXLSV2SnA9GP+5H/GRKAbgZowqECP1UI4/NAzQNksVOMD4bL5eaktr1BsN2eTktaKsxouh+NszkKEAOM542/JDolJTXMwgQFGSnNoYpuzH4oQc184bWKaWQJiISpUAowCbmZ7tX61cbMKw021Y17kwfPcMXd0aVGgI54sCwuO9h0pNR0K/23MeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A59nrYjZxB9Nv+X7TF0xMF0+58qDb6lQS5tDFc6EwM=;
 b=lra6FU/uk2XaN7YgzaMvupXV0sGEGY+b16jRYDUn3t2orQnXTBz6ig5+k1pYvnE4uG2MHRXR/49swOVjzY0nq+2B75EHl/EB1RsgY9c0U77lqdU2ugyogaWbFN5b/yds07HMAZquoXmu/Ks3GJvd/8Kz/dhTaedrNZAOu4U2EvuCQRKH6yL0qGtJw0SMe27pOIcsqB6ix7bhLF8EqFStgTrFwUqrBbWnQo+qkSmmMomfamFwMDhmq86fcdwvXJiNBG0DSaP6c8KgAnUg7DS5Glnf5fnkXn+e8y9vf2dcuWJr5MVols4WskCPm6M2wL3R3tM42H9ThLG99H+Z1SZ88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A59nrYjZxB9Nv+X7TF0xMF0+58qDb6lQS5tDFc6EwM=;
 b=WjoKB5tSKgcqHlFsXJewSuuYoNRcHJ2+9G7GUzww2LL6ulpwh1HUvT3OaQFux0mEMzryCSV5Ry2DcUmP//0HHHHuPwZzPz6KC2/OiAkO3wvqEND/7rczMKq8pjS6DoZxl0Z2jOV0Bj//ok5unVQYxBIXwdCslCuD6kqnTmOwWgM=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB4156.namprd12.prod.outlook.com (10.141.186.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Sat, 9 Nov 2019 00:17:02 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.023; Sat, 9 Nov 2019
 00:17:02 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v3] ARC: ARCv2: jump label: implement jump label patching
Thread-Topic: [PATCH v3] ARC: ARCv2: jump label: implement jump label patching
Thread-Index: AQHVllCDbwPZe32oj0yJc3t4hozdS6eB+WEA
Date: Sat, 9 Nov 2019 00:17:02 +0000
Message-ID: <ebf486f1-c36b-bb5d-a52a-36a8eda01edb@synopsys.com>
References: <20191108162022.3436-1-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20191108162022.3436-1-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e215dac-e9f2-4f01-3750-08d764aa2507
x-ms-traffictypediagnostic: DM6PR12MB4156:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4156345EC56DB06048F0130DB67A0@DM6PR12MB4156.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:308;
x-forefront-prvs: 021670B4D2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(396003)(366004)(39860400002)(189003)(199004)(54534003)(66946007)(66446008)(64756008)(66556008)(66476007)(6486002)(76116006)(8676002)(7736002)(6512007)(229853002)(31686004)(14444005)(81156014)(81166006)(8936002)(4326008)(305945005)(31696002)(6246003)(76176011)(86362001)(6436002)(6506007)(2906002)(30864003)(53546011)(11346002)(110136005)(54906003)(58126008)(316002)(102836004)(36756003)(446003)(256004)(2616005)(476003)(3846002)(6116002)(71200400001)(186003)(486006)(478600001)(26005)(71190400001)(14454004)(25786009)(65806001)(65956001)(66066001)(2501003)(99286004)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB4156;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: noWgE0oyQITfLQsAhK1AaPViGQ/xOBnswoQtReELazAl0pcpV6D35AfI+cjehB3MM1HoQ6nOpX1qtpLLTxP4eq2nWjCedM6H+daX5oPBzNJJ9/t0M/4E4q3BafMqKgcNJNyyWfteje+DDDp7h6WZUBZ92IsTtCTonWvUn+6HF7FJfqq4Fam3TYWza9r9robMW8x3EVGi2PRKX2LOLXEE0mNq3UNIcbUbfbg/h/7KhaYE/nSI0sWJyT7R0tNy+iGIXhFJhn5UdMHGRy7za6vxHFt0auSSUj4lc/GvyUcsmlRnEUSVmaXYJEwUsrLto4iqKlgi88TveHglca+vX97IVqYn6xr7EVQ/NdkF+hklZOi07bQRxXH9i6nVbALirW7lKOhRSHBjGlaYXcUpAsICRuuExF1ClF+KN8XwPFeC2luXqdVsR1cG3tI+WbS6LBN9
Content-ID: <17589530032CD4429A48A0DCA2DEBD88@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e215dac-e9f2-4f01-3750-08d764aa2507
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2019 00:17:02.3278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQdMKKmd9hErkiVQv1V0W12sOqULMf975p5VbuFJFb5E5xXl0dWkXrItl8bXQvpLaNk+C1RJqpTQvcJzV8baKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_161721_983823_7605811C 
X-CRM114-Status: GOOD (  23.71  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/8/19 8:20 AM, Eugeniy Paltsev wrote:
> Implement jump label patching for ARC. Jump labels provide
> an interface to generate dynamic branches using
> self-modifying code.
>
> This allows us to implement conditional branches where
> changing branch direction is expensive but branch selection
> is basically 'free'
>
> This implementation uses 32-bit NOP and BRANCH instructions
> which forced to be aligned by 4 to guarantee that they don't
> cross L1 cache line boundary / L1 I$ cache fetch block
> boundary and can be update atomically.

As confirmed by h/w folks, for ARC cache flush, the L1 fetch block is not really
relevant.

> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>

LGTM (I've removed the fetch block mention from changelog)

Added to for-next

Thx,
-Vineet

> ---
> Changes v1->v2:
>  * Patched instruction should not cross L1 I$ fetch block boundary and
>    not only L1 I$ line. Fix comments and asserts in code.
>  * Other small comments fix and code cleanup.
> Changes v2->v3:
>  * Code cleanup.
>  * Mark testdata array as __initconst
>  * Drop check about fetch block in code.
>  * Invert ARC_DBG_JUMP_LABEL vs STATIC_KEYS_SELFTEST dependency.
>
>  arch/arc/Kconfig                  |   8 ++
>  arch/arc/include/asm/cache.h      |   2 +
>  arch/arc/include/asm/jump_label.h |  72 +++++++++++++
>  arch/arc/kernel/Makefile          |   1 +
>  arch/arc/kernel/jump_label.c      | 170 ++++++++++++++++++++++++++++++
>  5 files changed, 253 insertions(+)
>  create mode 100644 arch/arc/include/asm/jump_label.h
>  create mode 100644 arch/arc/kernel/jump_label.c
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 8383155c8c82..375f9d278139 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -46,6 +46,7 @@ config ARC
>  	select OF_EARLY_FLATTREE
>  	select PCI_SYSCALL if PCI
>  	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
> +	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
>  
>  config ARCH_HAS_CACHE_LINE_SIZE
>  	def_bool y
> @@ -525,6 +526,13 @@ config ARC_DW2_UNWIND
>  config ARC_DBG_TLB_PARANOIA
>  	bool "Paranoia Checks in Low Level TLB Handlers"
>  
> +config ARC_DBG_JUMP_LABEL
> +	bool "Paranoid checks in Static Keys (jump labels) code"
> +	depends on JUMP_LABEL
> +	default y if STATIC_KEYS_SELFTEST
> +	help
> +	  Enable paranoid checks and self-test of both ARC-specific and generic
> +	  part of static keys (jump labels) related code.
>  endif
>  
>  config ARC_BUILTIN_DTB_NAME
> diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
> index 918804c7c1a4..d8ece4292388 100644
> --- a/arch/arc/include/asm/cache.h
> +++ b/arch/arc/include/asm/cache.h
> @@ -25,6 +25,8 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <linux/build_bug.h>
> +
>  /* Uncached access macros */
>  #define arc_read_uncached_32(ptr)	\
>  ({					\
> diff --git a/arch/arc/include/asm/jump_label.h b/arch/arc/include/asm/jump_label.h
> new file mode 100644
> index 000000000000..9d9618079739
> --- /dev/null
> +++ b/arch/arc/include/asm/jump_label.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARC_JUMP_LABEL_H
> +#define _ASM_ARC_JUMP_LABEL_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/stringify.h>
> +#include <linux/types.h>
> +
> +#define JUMP_LABEL_NOP_SIZE 4
> +
> +/*
> + * NOTE about '.balign 4':
> + *
> + * To make atomic update of patched instruction available we need to guarantee
> + * that this instruction doesn't cross L1 cache line boundary.
> + *
> + * As of today we simply align instruction which can be patched by 4 byte using
> + * ".balign 4" directive. In that case patched instruction is aligned with one
> + * 16-bit NOP_S if this is required.
> + * However 'align by 4' directive is much stricter than it actually required.
> + * It's enough that our 32-bit instruction don't cross L1 cache line boundary /
> + * L1 I$ fetch block boundary which can be achieved by using
> + * ".bundle_align_mode" assembler directive. That will save us from adding
> + * useless NOP_S padding in most of the cases.
> + *
> + * TODO: switch to ".bundle_align_mode" directive using whin it will be
> + * supported by ARC toolchain.
> + */
> +
> +static __always_inline bool arch_static_branch(struct static_key *key,
> +					       bool branch)
> +{
> +	asm_volatile_goto(".balign "__stringify(JUMP_LABEL_NOP_SIZE)"	\n"
> +		 "1:							\n"
> +		 "nop							\n"
> +		 ".pushsection __jump_table, \"aw\"			\n"
> +		 ".word 1b, %l[l_yes], %c0				\n"
> +		 ".popsection						\n"
> +		 : : "i" (&((char *)key)[branch]) : : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool arch_static_branch_jump(struct static_key *key,
> +						    bool branch)
> +{
> +	asm_volatile_goto(".balign "__stringify(JUMP_LABEL_NOP_SIZE)"	\n"
> +		 "1:							\n"
> +		 "b %l[l_yes]						\n"
> +		 ".pushsection __jump_table, \"aw\"			\n"
> +		 ".word 1b, %l[l_yes], %c0				\n"
> +		 ".popsection						\n"
> +		 : : "i" (&((char *)key)[branch]) : : l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +typedef u32 jump_label_t;
> +
> +struct jump_entry {
> +	jump_label_t code;
> +	jump_label_t target;
> +	jump_label_t key;
> +};
> +
> +#endif  /* __ASSEMBLY__ */
> +#endif
> diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
> index de6251132310..e784f5396dda 100644
> --- a/arch/arc/kernel/Makefile
> +++ b/arch/arc/kernel/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_ARC_EMUL_UNALIGNED) 	+= unaligned.o
>  obj-$(CONFIG_KGDB)			+= kgdb.o
>  obj-$(CONFIG_ARC_METAWARE_HLINK)	+= arc_hostlink.o
>  obj-$(CONFIG_PERF_EVENTS)		+= perf_event.o
> +obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
>  
>  obj-$(CONFIG_ARC_FPU_SAVE_RESTORE)	+= fpu.o
>  CFLAGS_fpu.o   += -mdpfp
> diff --git a/arch/arc/kernel/jump_label.c b/arch/arc/kernel/jump_label.c
> new file mode 100644
> index 000000000000..b8600dc325b5
> --- /dev/null
> +++ b/arch/arc/kernel/jump_label.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/kernel.h>
> +#include <linux/jump_label.h>
> +
> +#include "asm/cacheflush.h"
> +
> +#define JUMPLABEL_ERR	"ARC: jump_label: ERROR: "
> +
> +/* Halt system on fatal error to make debug easier */
> +#define arc_jl_fatal(format...)						\
> +({									\
> +	pr_err(JUMPLABEL_ERR format);					\
> +	BUG();								\
> +})
> +
> +static inline u32 arc_gen_nop(void)
> +{
> +	/* 1x 32bit NOP in middle endian */
> +	return 0x7000264a;
> +}
> +
> +/*
> + * Atomic update of patched instruction is only available if this
> + * instruction doesn't cross L1 cache line boundary. You can read about
> + * the way we achieve this in arc/include/asm/jump_label.h
> + */
> +static inline void instruction_align_assert(void *addr, int len)
> +{
> +	unsigned long a = (unsigned long)addr;
> +
> +	if ((a >> L1_CACHE_SHIFT) != ((a + len - 1) >> L1_CACHE_SHIFT))
> +		arc_jl_fatal("instruction (addr %px) cross L1 cache line border",
> +			     addr);
> +}
> +
> +/*
> + * ARCv2 'Branch unconditionally' instruction:
> + * 00000ssssssssss1SSSSSSSSSSNRtttt
> + * s S[n:0] lower bits signed immediate (number is bitfield size)
> + * S S[m:n+1] upper bits signed immediate (number is bitfield size)
> + * t S[24:21] upper bits signed immediate (branch unconditionally far)
> + * N N <.d> delay slot mode
> + * R R Reserved
> + */
> +static inline u32 arc_gen_branch(jump_label_t pc, jump_label_t target)
> +{
> +	u32 instruction_l, instruction_r;
> +	u32 pcl = pc & GENMASK(31, 2);
> +	u32 u_offset = target - pcl;
> +	u32 s, S, t;
> +
> +	/*
> +	 * Offset in 32-bit branch instruction must to fit into s25.
> +	 * Something is terribly broken if we get such huge offset within one
> +	 * function.
> +	 */
> +	if ((s32)u_offset < -16777216 || (s32)u_offset > 16777214)
> +		arc_jl_fatal("gen branch with offset (%d) not fit in s25",
> +			     (s32)u_offset);
> +
> +	/*
> +	 * All instructions are aligned by 2 bytes so we should never get offset
> +	 * here which is not 2 bytes aligned.
> +	 */
> +	if (u_offset & 0x1)
> +		arc_jl_fatal("gen branch with offset (%d) unaligned to 2 bytes",
> +			     (s32)u_offset);
> +
> +	s = (u_offset >> 1)  & GENMASK(9, 0);
> +	S = (u_offset >> 11) & GENMASK(9, 0);
> +	t = (u_offset >> 21) & GENMASK(3, 0);
> +
> +	/* 00000ssssssssss1 */
> +	instruction_l = (s << 1) | 0x1;
> +	/* SSSSSSSSSSNRtttt */
> +	instruction_r = (S << 6) | t;
> +
> +	return (instruction_r << 16) | (instruction_l & GENMASK(15, 0));
> +}
> +
> +void arch_jump_label_transform(struct jump_entry *entry,
> +			       enum jump_label_type type)
> +{
> +	jump_label_t *instr_addr = (jump_label_t *)entry->code;
> +	u32 instr;
> +
> +	instruction_align_assert(instr_addr, JUMP_LABEL_NOP_SIZE);
> +
> +	if (type == JUMP_LABEL_JMP)
> +		instr = arc_gen_branch(entry->code, entry->target);
> +	else
> +		instr = arc_gen_nop();
> +
> +	WRITE_ONCE(*instr_addr, instr);
> +	flush_icache_range(entry->code, entry->code + JUMP_LABEL_NOP_SIZE);
> +}
> +
> +void arch_jump_label_transform_static(struct jump_entry *entry,
> +				      enum jump_label_type type)
> +{
> +	/*
> +	 * We use only one NOP type (1x, 4 byte) in arch_static_branch, so
> +	 * there's no need to patch an identical NOP over the top of it here.
> +	 * The generic code calls 'arch_jump_label_transform' if the NOP needs
> +	 * to be replaced by a branch, so 'arch_jump_label_transform_static' is
> +	 * never called with type other than JUMP_LABEL_NOP.
> +	 */
> +	BUG_ON(type != JUMP_LABEL_NOP);
> +}
> +
> +#ifdef CONFIG_ARC_DBG_JUMP_LABEL
> +#define SELFTEST_MSG	"ARC: instruction generation self-test: "
> +
> +struct arc_gen_branch_testdata {
> +	jump_label_t pc;
> +	jump_label_t target_address;
> +	u32 expected_instr;
> +};
> +
> +static __init int branch_gen_test(const struct arc_gen_branch_testdata *test)
> +{
> +	u32 instr_got;
> +
> +	instr_got = arc_gen_branch(test->pc, test->target_address);
> +	if (instr_got == test->expected_instr)
> +		return 0;
> +
> +	pr_err(SELFTEST_MSG "FAIL:\n arc_gen_branch(0x%08x, 0x%08x) != 0x%08x, got 0x%08x\n",
> +	       test->pc, test->target_address,
> +	       test->expected_instr, instr_got);
> +
> +	return -EFAULT;
> +}
> +
> +/*
> + * Offset field in branch instruction is not continuous. Test all
> + * available offset field and sign combinations. Test data is generated
> + * from real working code.
> + */
> +static const struct arc_gen_branch_testdata arcgenbr_test_data[] __initconst = {
> +	{0x90007548, 0x90007514, 0xffcf07cd}, /* tiny (-52) offs */
> +	{0x9000c9c0, 0x9000c782, 0xffcf05c3}, /* tiny (-574) offs */
> +	{0x9000cc1c, 0x9000c782, 0xffcf0367}, /* tiny (-1178) offs */
> +	{0x9009dce0, 0x9009d106, 0xff8f0427}, /* small (-3034) offs */
> +	{0x9000f5de, 0x90007d30, 0xfc0f0755}, /* big  (-30892) offs */
> +	{0x900a2444, 0x90035f64, 0xc9cf0321}, /* huge (-443616) offs */
> +	{0x90007514, 0x9000752c, 0x00000019}, /* tiny (+24) offs */
> +	{0x9001a578, 0x9001a77a, 0x00000203}, /* tiny (+514) offs */
> +	{0x90031ed8, 0x90032634, 0x0000075d}, /* tiny (+1884) offs */
> +	{0x9008c7f2, 0x9008d3f0, 0x00400401}, /* small (+3072) offs */
> +	{0x9000bb38, 0x9003b340, 0x17c00009}, /* big  (+194568) offs */
> +	{0x90008f44, 0x90578d80, 0xb7c2063d}  /* huge (+5701180) offs */
> +};
> +
> +static __init int instr_gen_test(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(arcgenbr_test_data); i++)
> +		if (branch_gen_test(&arcgenbr_test_data[i]))
> +			return -EFAULT;
> +
> +	pr_info(SELFTEST_MSG "OK\n");
> +
> +	return 0;
> +}
> +early_initcall(instr_gen_test);
> +
> +#endif /* CONFIG_ARC_DBG_JUMP_LABEL */

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
