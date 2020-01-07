Return-Path: <SRS0=s6v2=24=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91377C282DD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 18:26:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A8E52072A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 18:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="np57hgLZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RVuRlnsB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="hqFYZ/nk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A8E52072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNHArfCILOBW4YwBqD4V/K/0gIIo+8+yEfA5waB0Rjk=; b=np57hgLZ+5quIt
	CBTjdtmiN0qD48v85RdMhVqlzmzDDFVB1nkCiVWbSWC8psyVNgr2su1OKsB4y6WAKghMIP+a18IUf
	oBenNQ36vWhOPSqeWXKfHjBiBYehWpu1hIIXFCx7O9/oW+pKHUHu7AK6l6Gl1TGe4zIZrGe22KlgE
	tqe6Ru12J5aiKh6dyyltbQS7WkTrlVQAgb/xiBpYD1l8w1AKh7VV9wIUBigf1cOniWxPa4fhaMIzT
	xPb8lOBcTbTu3cJ9EfuzesKj5VdD8yay6jqRUa8qp2OkmbssKk0uwJBN205GJUVTeACsq2rhGGH7j
	4ikXL4SIbkv19nIsbp4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iotYS-0000Pb-2J; Tue, 07 Jan 2020 18:26:12 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iotYP-0000Ox-8S
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jan 2020 18:26:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C8D93405A7;
 Tue,  7 Jan 2020 18:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578421567; bh=l7ak5lpTxNseUMoUZlW0lhqnhAZWSqUSQrgCdp4z67s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=RVuRlnsBBHBJSmibENDCD/sPJLBuIKHEvOiF+ItxUXsuBLZdrCfe+ZyY13uhlowTx
 nVrtiSZKhEws4/k11sM51WFe4TBYGQCZIvjRrv1MWGtMqAQH1lZ5/XOIcMdOb5/TxI
 jgmNVxCq6U42nP167ifHcq8LA+WjCHEXNJQxIGkAyBiW+f2e6xDaHWKVQn3maRnDPE
 fcl3gc6DVMdD2nr+TL24WutheQBt5a0uxDGwzX8NNZ+lgbdfLl+vb3GKHF2uVlyzEl
 26Dv80buHn1b/DP98xvj6OtoSc9v/TQZJMCJcP0aAh99NdnqGRcPaebHPHXg+o71M+
 qCr2Pai9A3YLA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4D4DCA006A;
 Tue,  7 Jan 2020 18:26:02 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 7 Jan 2020 10:25:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 7 Jan 2020 10:25:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEjBqRPxCNsbUwRPsDRl/9g4MuS0ZLuPb/u6zE3Uauehsq54TDzNorvc5VTggQrwWAMGxrdu91xV/P3s+PdRi0osRvstNwpSqUUc23a9uycjBvkBTzsprEfwxN7ZpLZmlxPKq1w8ewneovY39sCwIGywSdZR5NBPhzjqlvf3mz13dssTok2K1mxxttkg6gsNrqfd0dB/bQolXHPCYM9KSeLhPz4GIkZcrvsEY/zvglnh/vA5RyJhKd/w75y5FPcaV4++KyDTQL4JPnHGircfzo/1LQfVVOO9DrGJnnKbZQcaSZtqvONVNLLitZcAa3Z/caDbrEIceOhi6xTx3i81BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7ak5lpTxNseUMoUZlW0lhqnhAZWSqUSQrgCdp4z67s=;
 b=IHnqVSHt4eYxWRkyMfmgSX8Uxjdg3TwvPj73VsRkp+kyM+4GukvWJNf3GQb2QItTbyoYkqvd+QXRU8klRAjsJsvm7OKHwx8MirujjbiT1TzQ2+ulRZiT/rnUoylqHhFNeY0Zrqvd3PBYlIwu1xWxFK6swi0lygWDjLLZNb2L4IPzSw192EMeETaaS6s2j+d5j7/0U3NsF1HMR+tAQBCoGAJufUZHLBOfL2IoS1K2/hH1VYdSzK6ZC7CjwhowmZZ4UgtPFUBDjATsAwnp8BNZhJWI5i7ZwdV2Kueb2kpix1JteLbMmfnZvIKHjt7+QB04F2O1u1n8otjjmOAn9dsEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7ak5lpTxNseUMoUZlW0lhqnhAZWSqUSQrgCdp4z67s=;
 b=hqFYZ/nkt4+QAcAnVDiUPPkZjwl0LWMbwEMvi1LSxWrXVZEyCr1h5nDhxyRy89WnCCu513K2RsK5/uj6f9KQXXvWxWBestcc4HzAKvnh04d6GkdaPwxKw4bNBTIoccUvr8aJTOvfoeG9CH+E2g41QTj1P9/xTBK1acYU8a9LUIU=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3240.namprd12.prod.outlook.com (20.179.93.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Tue, 7 Jan 2020 18:25:57 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.008; Tue, 7 Jan 2020
 18:25:57 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 4/5] ARC: add support for DSP-enabled userspace
 applications
Thread-Topic: [PATCH 4/5] ARC: add support for DSP-enabled userspace
 applications
Thread-Index: AQHVvOAMSI6VRGHN00GBtEUk/fXvJafflg0A
Date: Tue, 7 Jan 2020 18:25:57 +0000
Message-ID: <a3890ccb-e948-6ad6-c2ea-5b77b9d3a289@synopsys.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
 <20191227180347.3579-5-Eugeniy.Paltsev@synopsys.com>
In-Reply-To: <20191227180347.3579-5-Eugeniy.Paltsev@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19a2a052-fd00-4c21-2a7d-08d7939f0a30
x-ms-traffictypediagnostic: BYAPR12MB3240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3240EB9C1C35E1F8FAA178DFB63F0@BYAPR12MB3240.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(186003)(110136005)(26005)(316002)(5660300002)(2616005)(478600001)(6506007)(53546011)(54906003)(64756008)(66556008)(66476007)(76116006)(2906002)(66946007)(66446008)(31686004)(8936002)(71200400001)(6486002)(81166006)(81156014)(86362001)(8676002)(31696002)(4326008)(36756003)(107886003)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3240;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PbZHgRo5GVk6mmkhaFZ2cU1svyqO1t2xIbRa5VD0mJuEDg0EAXibJx4Rap2G6QDSSJGmFM1JpV7iUvzxZWvMysMjruR3m6Zqx10vC9SQ0KT3gEzQYHJymgDb9k/HSLNDt578/0Cqfu0MwZ6Q3dpcFzXEMKAiEiPIUbKyu9I7heSiC9i5CGiJOTROzV1JCfIdO53tn3ry+YrM/t8P7m27EAA24j+yI/3kGaGR62oGUnGQcJhdIvLoq67wcj7JJeV5aqEVC2AD23Lejz/m1M7oDBQeFEJq/SlPPjnX2+NaEv+BVET8ZqAG46HLwV7kkMCT5akI3SZfuWWDOMUuuUU5lAH+xGWL5dzZ1PtVZFxIcWNTaHN7KR9xlAiZ+YD1TYYLgO6DqU+eLNifEZlh2um40h05UB95sxsP9o9ZHsmRq5yh0lQQeX6N6bEM6N/g46rM
Content-ID: <99F0AE71FD7F8F4D966F73EBF37E17BC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a2a052-fd00-4c21-2a7d-08d7939f0a30
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 18:25:57.4787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4zCdihzFHnuA4sZ1pwSYRk08uXswY4tHApuYRgJB+Pojd642yC3WSI25h5p+G0NI0QxI38ziFYeS6MRLNJLRmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3240
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_102609_371589_EBE757A4 
X-CRM114-Status: GOOD (  24.55  )
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
Cc: Alexey  Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/27/19 10:03 AM, Eugeniy Paltsev wrote:
> To be able to run DSP-enabled userspace applications we need to
> save and restore following DSP-related registers:
> At IRQ/exception entry/exit:
>  * ACC0_GLO, ACC0_GHI, DSP_CTRL
>  * ACC0_LO, ACC0_HI (we already save them as r58, r59 pair)
> At context switch:
>  * DSP_BFLY0, DSP_FFT_CTRL

Good summary: but the question is this more than needed.
For kernel proper, you've disabled guard bits, saturation etc already. AFAIKS gcc
won't generate complex/fractional math for kernel so your bullet #1 can likely be
considered user space only hence can go to bullet #3. Do you have reasons to
believe otherwise ?

> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  arch/arc/Kconfig                   |  7 +++
>  arch/arc/include/asm/arcregs.h     |  2 +
>  arch/arc/include/asm/dsp-impl.h    | 75 +++++++++++++++++++++++++++++-
>  arch/arc/include/asm/dsp.h         | 42 +++++++++++++++++
>  arch/arc/include/asm/entry-arcv2.h |  3 ++
>  arch/arc/include/asm/processor.h   |  4 ++
>  arch/arc/include/asm/ptrace.h      |  4 ++
>  arch/arc/include/asm/switch_to.h   |  2 +
>  arch/arc/kernel/asm-offsets.c      |  7 +++
>  arch/arc/kernel/setup.c            |  2 +-
>  10 files changed, 146 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arc/include/asm/dsp.h
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index b9cd7ce3f878..c3210754a3d2 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -432,6 +432,13 @@ config ARC_DSP_KERNEL
>  	  DSP extension presence in HW, no support for DSP-enabled userspace
>  	  applications. We don't save / restore DSP registers and only do
>  	  some minimal preparations so userspace won't be able to break kernel
> +
> +config ARC_DSP_USERSPACE
> +	bool "Support DSP for userspace apps"
> +	select ARC_HAS_ACCL_REGS
> +	help
> +	  DSP extension presence in HW, support save / restore DSP registers to
> +	  run DSP-enabled userspace applications
>  endchoice
>  
>  config ARC_IRQ_NO_AUTOSAVE
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index 0004b1e9b325..a713819cab3c 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h
> @@ -118,6 +118,8 @@
>  
>  /*
>   * DSP-related registers
> + * Registers names must correspond to dsp_callee_regs structure fields names
> + * for automatic offset calculation in DSP_AUX_SAVE_RESTORE macros.

good idea for preventing carbon errors.

>   */
>  #define ARC_AUX_DSP_BUILD	0x7A
>  #define ARC_AUX_ACC0_LO		0x580
> diff --git a/arch/arc/include/asm/dsp-impl.h b/arch/arc/include/asm/dsp-impl.h
> index 788093cbe689..7b640a680dfc 100644
> --- a/arch/arc/include/asm/dsp-impl.h
> +++ b/arch/arc/include/asm/dsp-impl.h
> @@ -7,6 +7,8 @@
>  #ifndef __ASM_ARC_DSP_IMPL_H
>  #define __ASM_ARC_DSP_IMPL_H
>  
> +#include <asm/dsp.h>
> +
>  #define DSP_CTRL_DISABLED_ALL		0
>  
>  #ifdef __ASSEMBLY__
> @@ -28,11 +30,82 @@
>  	 * able to break kernel */
>  	mov	r58, DSP_CTRL_DISABLED_ALL
>  	sr	r58, [ARC_AUX_DSP_CTRL]
> -#endif /* ARC_DSP_KERNEL */
> +
> +#elif defined(ARC_DSP_SAVE_RESTORE_REGS)
> +	lr	r58, [ARC_AUX_ACC0_GLO]
> +	lr	r59, [ARC_AUX_ACC0_GHI]
> +	ST2	r58, r59, PT_ACC0_GLO
> +
> +	lr	r58, [ARC_AUX_DSP_CTRL]
> +	st	r58, [sp, PT_DSP_CTRL]
> +
> +#endif
> +.endm
> +
> +/* clobbers r58, r59 registers pair */
> +.macro DSP_RESTORE_REGFILE_IRQ
> +#if defined(ARC_DSP_SAVE_RESTORE_REGS)
> +	LD2	r58, r59, PT_ACC0_GLO
> +	sr	r58, [ARC_AUX_ACC0_GLO]
> +	sr	r59, [ARC_AUX_ACC0_GHI]
> +
> +	ld	r58, [sp, PT_DSP_CTRL]
> +	sr	r58, [ARC_AUX_DSP_CTRL]
> +
> +#endif

Assuming you still need this, consider using different scratch registers if
possible. I understand it gets tricky in restore path but there even more
registers are available to clobber as they will be restored after this code.

> +#ifdef ARC_DSP_SAVE_RESTORE_REGS
> +
> +/*
> + * As we save new and restore old AUX register value in the same place we
> + * can optimize a bit and use AEX instruction (swap contents of an auxiliary
> + * register with a core register) instead of LR + SR pair.
> + */
> +#define AUX_SAVE_RESTORE(_saveto, _readfrom, _offt, _aux, _scratch)	\
> +do {									\
> +	__asm__ __volatile__(						\
> +		"ld	%0, [%2, %4]			\n"		\
> +		"aex	%0, [%3]			\n"		\
> +		"st	%0, [%1, %4]			\n"		\
> +		:							\
> +		  "=&r" (_scratch)	/* must be early clobber */	\

Define the scratch variable locally for clarity and better liveness tracking - for
both code reader and compiler :-)
Also avoids having to initialize it.

> +		:							\
> +		   "r" (_saveto),					\
> +		   "r" (_readfrom),					\
> +		   "I" (_aux),						\
> +		   "I" (_offt)						\
> +		:							\

AEX with "I" constraint will likely be an 8 byte instructions always. Best to give
compiler wiggle room with "Ir"

> +		  "memory"						\
> +	);								\
> +} while (0)
> +
> +#define DSP_AUX_SAVE_RESTORE(_saveto, _readfrom, _aux, _scratch)	\
> +	AUX_SAVE_RESTORE(_saveto, _readfrom,				\
> +		offsetof(struct dsp_callee_regs, _aux),			\
> +		ARC_AUX_##_aux, _scratch)
> +
> +static inline void arc_dsp_save_restore(struct task_struct *prev,
> +					struct task_struct *next)
> +{
> +	long unsigned int *saveto = &prev->thread.dsp.DSP_BFLY0;
> +	long unsigned int *readfrom = &next->thread.dsp.DSP_BFLY0;
> +
> +	long unsigned int zero = 0;

See comment about pushing scratch to the relevant code block.

> +
> +	DSP_AUX_SAVE_RESTORE(saveto, readfrom, DSP_BFLY0, zero);
> +	DSP_AUX_SAVE_RESTORE(saveto, readfrom, DSP_FFT_CTRL, zero);
> +}
> +

[snip]

> +
> +#if defined(CONFIG_ARC_DSP_USERSPACE)
> +#define ARC_DSP_SAVE_RESTORE_REGS	1
> +#endif

I can see u added this for consistency with below which is a really bad idea: see
below.

> +
> +#ifndef __ASSEMBLY__
> +
> +/* some defines to simplify config sanitize in kernel/setup.c */
> +#if defined(CONFIG_ARC_DSP_KERNEL) 	|| \
> +    defined(CONFIG_ARC_DSP_USERSPACE)
> +#define ARC_DSP_HANDLED			1
> +#else
> +#define ARC_DSP_HANDLED			0
> +#endif

This is a really bad idea - u r introducing explicit include dependencies which
can change even outside of arch changes !
We've dealt with enough of these problems with current.h, so best to avoid, even
if there is some code clutter.

> +
> +#if defined(CONFIG_ARC_DSP_USERSPACE)
> +#define ARC_DSP_OPT_NAME		"CONFIG_ARC_DSP_USERSPACE"
> +#else
> +#define ARC_DSP_OPT_NAME		"CONFIG_ARC_DSP_KERNEL"
> +#endif
> +
> +/*
> + * DSP-related saved registers - need to be saved only when you are
> + * scheduled out.
> + * structure fields name must correspond to aux register defenitions for
> + * automatic offset calculation in DSP_AUX_SAVE_RESTORE macros
> + */
> +struct dsp_callee_regs {
> +	unsigned long DSP_BFLY0, DSP_FFT_CTRL;
> +};
> +
> +#endif /* !__ASSEMBLY__ */
> +
> +#endif /* __ASM_ARC_DSP_H */
> diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
> index e3f8bd3e2eba..5d079f0b6243 100644
> --- a/arch/arc/include/asm/entry-arcv2.h
> +++ b/arch/arc/include/asm/entry-arcv2.h
> @@ -192,6 +192,9 @@
>  	ld	r25, [sp, PT_user_r25]
>  #endif
>  
> +	/* clobbers r58, r59 registers pair, so must be before r58, r59 restore */
> +	DSP_RESTORE_REGFILE_IRQ
> +
>  #ifdef CONFIG_ARC_HAS_ACCL_REGS
>  	LD2	r58, r59, PT_r58
>  #endif
> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> index 706edeaa5583..1716df0f4472 100644
> --- a/arch/arc/include/asm/processor.h
> +++ b/arch/arc/include/asm/processor.h
> @@ -14,6 +14,7 @@
>  #ifndef __ASSEMBLY__
>  
>  #include <asm/ptrace.h>
> +#include <asm/dsp.h>
>  
>  #ifdef CONFIG_ARC_FPU_SAVE_RESTORE
>  /* These DPFP regs need to be saved/restored across ctx-sw */
> @@ -39,6 +40,9 @@ struct thread_struct {
>  	unsigned long ksp;	/* kernel mode stack pointer */
>  	unsigned long callee_reg;	/* pointer to callee regs */
>  	unsigned long fault_address;	/* dbls as brkpt holder as well */
> +#ifdef ARC_DSP_SAVE_RESTORE_REGS
> +	struct dsp_callee_regs dsp;
> +#endif
>  #ifdef CONFIG_ARC_FPU_SAVE_RESTORE
>  	struct arc_fpu fpu;
>  #endif
> diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
> index ba9854ef39e8..a5851ee141de 100644
> --- a/arch/arc/include/asm/ptrace.h
> +++ b/arch/arc/include/asm/ptrace.h
> @@ -8,6 +8,7 @@
>  #define __ASM_ARC_PTRACE_H
>  
>  #include <uapi/asm/ptrace.h>
> +#include <asm/dsp.h>
>  
>  #ifndef __ASSEMBLY__
>  
> @@ -91,6 +92,9 @@ struct pt_regs {
>  #ifdef CONFIG_ARC_HAS_ACCL_REGS
>  	unsigned long r58, r59;	/* ACCL/ACCH used by FPU / DSP MPY */
>  #endif
> +#ifdef ARC_DSP_SAVE_RESTORE_REGS

Use the Kconfig option name directly or !CONFIG_NO_DSP etc

> +	unsigned long ACC0_GLO, ACC0_GHI, DSP_CTRL;
> +#endif

see comments at top.

>  
>  	/*------- Below list auto saved by h/w -----------*/
>  	unsigned long r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;

[snip]

>  }
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index b3995dd673d9..30d31579c51d 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -447,7 +447,7 @@ static void arc_chk_core_config(void)
>  		CHK_OPT_STRICT(CONFIG_ARC_HAS_ACCL_REGS, present);
>  
>  		present = dsp_exist();
> -		CHK_OPT_STRICT(CONFIG_ARC_DSP_KERNEL, present);
> +		chk_opt_strict(ARC_DSP_OPT_NAME, present, ARC_DSP_HANDLED);

This needs to be reworked given the header fudge is not a good idea.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
