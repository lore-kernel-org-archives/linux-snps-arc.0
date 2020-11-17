Return-Path: <SRS0=EQnS=EX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94091C63697
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Nov 2020 06:40:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE5BD2467B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Nov 2020 06:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0BFJVJ/8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sv0DeyuF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YDQvpG0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE5BD2467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vk8tauTEkJUAkrRTfaMBFCMO+lIV3nRWwXLV3ogz51w=; b=0BFJVJ/81klitgvP6ozl98MNj
	Terj4+DFmO9J49Rw2DjOZA4yCtjddZBg/yKAvVJ2ltXClSLLWiB4oCYHTIQxqwUv63OwK8IIVHFRg
	JDB2wJYeyJm+MLaOPi/phTMh1A7InC96L7StnKOYVZ+Cj/SzphGh3mshlFgJrH4ic7z88zdtM5wye
	dyXmV0v9nenKkCFrwOV95OUFLgEX0ZOfgwLHGdPLLtEcOyyQpElkTOnfhVQ8IZyETWMQVBn10wH9G
	/s+6nXcxsX7777vao85GyL3Jz2PGon4FuVo7Ju7bTXSi4OPtVkqWERJb4Gdw5I+sv2zO4Ph8X2F1l
	9fHUZ/8TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keufS-0007f0-TU; Tue, 17 Nov 2020 06:40:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keufL-0007dZ-R1; Tue, 17 Nov 2020 06:40:38 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 233244006E;
 Tue, 17 Nov 2020 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1605595232; bh=DjC3VM+e0vFZdkuSyPYlT8niQ45mjgGo6uM1KBWIRPs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Sv0DeyuFjNZgIFf7Dwr62Fxlw/5cC/f5gtxjbGx12nTsX6DLNKgTYWbkLKII6Gbj0
 0d11JJVfxRvTXebJKIhHCygJWkp1gsKeuPG7pflcXQTQwlGVbG660BMptd0Zyz4eEd
 5dhdc3VI/c4vMAaNa6cCU5BmSonrn4mfCtLRvPnfRQe3lJlKCTZsw4ih0oqIJtgCec
 1XFUunXvW+QveQWlCEMfhLi+WDKGxUcUHWBOkDJ0UNmn3syIyvgwlN/2JcBiHjaJwG
 XIVc3yF8F1PBMsSOKwubEytdimUPbTA5Eaue3xDdjnX70SAQGZjFKRqp9PT2uGDXtP
 mmwpijJTOaVFA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 50E6DA009C;
 Tue, 17 Nov 2020 06:40:25 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EBD8580216;
 Tue, 17 Nov 2020 06:40:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YDQvpG0j";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGvJhM35HmrpQ1NaQNy6qZM8yKyn6qXYGYj64csyYryTFn7OwLSKnebRkrh2KN9pHVikKM79+zNefB8++D7auLd1YspIUZFghe98ippKNw7qal/ij16YqwankdKjRAg/L6S0Meg7RTMuAVvpmaVD+A7YJoR1mgoIqexg8uqt8sxtEFM5ZGnOSNmtUPi5uz1CQz9Tzz9IS7nhPn5dTmmOnk7GHO1kVMfZ4Btvk4SL82BBkPGZN1ULpXc/Ny7LSO6P76yLi3xJxxpopN/DzMa0+xbv0cQqf2EeN7mXcds5opm4hv2Y0VbYRmEBZDI5DVbcSmkBy4QsaaolPbdfKOSd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjC3VM+e0vFZdkuSyPYlT8niQ45mjgGo6uM1KBWIRPs=;
 b=iuqwF0PBzxZkDPyFiOPttrk8uIloL058PXfCD7zB0VI+FbvgHVqEexVD9vS+8gqkTf7SclbybgOfH2ZiqcMYeF5E15iAvc7r/ZEbJB0qepv8ia2kg6BSVzeSdefvLa6Bnro+c/qGRVy87MjxNi1sSTn4NbDO+Eig/Al3hJNFWDADh0I3AxTSZVTTGmURRR7rCgADSPPIwcumtcG09I0feZ8wMQV6AqEm3KiIboHlvfE0DJJbzWn9VVqaEzs/O1toC5L/ezsbVlso7IJtLhi8NjxEw9Z9VtNmKqKpzqCqIZAoTLs1Dt8xaNI7AfggbagmBgzJGMiPtpEiTZbs/9sI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjC3VM+e0vFZdkuSyPYlT8niQ45mjgGo6uM1KBWIRPs=;
 b=YDQvpG0j9s4117nPXgwImVAWUGaZyyzCeTMP0gTE0rHCCTU/A2ybfj4VEJrHjNPfpG02GZ0+6c52hpeBSIf/nGvGAlroKheUPoalvoMr6SgRkM/71n83EfVvNGkIGfyBBwoJcm0cz63AqKtYiO8DtjAZv65JaqeVBX3nxKddxCw=
Received: from BN8PR12MB3474.namprd12.prod.outlook.com (2603:10b6:408:46::14)
 by BN6PR12MB1570.namprd12.prod.outlook.com (2603:10b6:405:5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 17 Nov
 2020 06:40:17 +0000
Received: from BN8PR12MB3474.namprd12.prod.outlook.com
 ([fe80::cd57:13d:10e4:671a]) by BN8PR12MB3474.namprd12.prod.outlook.com
 ([fe80::cd57:13d:10e4:671a%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 06:40:16 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 10/13] arc: use FLATMEM with freeing of unused memory
 map instead of DISCONTIGMEM
Thread-Topic: [PATCH v2 10/13] arc: use FLATMEM with freeing of unused memory
 map instead of DISCONTIGMEM
Thread-Index: AQHWsHFMd8nsSVmCb0aJAIj0V26/qqnL+B8A
Date: Tue, 17 Nov 2020 06:40:16 +0000
Message-ID: <3a1ef201-611b-3eb0-1a8a-4fcb05634b85@synopsys.com>
References: <20201101170454.9567-1-rppt@kernel.org>
 <20201101170454.9567-11-rppt@kernel.org>
In-Reply-To: <20201101170454.9567-11-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87e12fa8-d7e0-4295-9a17-08d88ac3a53c
x-ms-traffictypediagnostic: BN6PR12MB1570:
x-microsoft-antispam-prvs: <BN6PR12MB1570434DDD777F21D5458847B6E20@BN6PR12MB1570.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t1ewO5Xepeb5LpunZColuhPzzL33joH242We2YOPa1+ekbpmE8IM3w6+N/ksOkAXgwQ1w9n8YDty0GV/52XMqZm/lcTLa2LLI1K3Lcjjc4fld4uGkT3fxK2SEnaDFbRmjadGeYB9ZMrQi69Wt4JKrnvPROd0xzayNMmLLn7t1ijFIMMLqygWDwgs4aQt7lvjBbc1Ho3XraySS3O6raL364ZtE5mhaFTrsWUXSkARCvXZLyYyxVGO2LK5ceIhFCr+TGc9oEWvwldZ+MEXB9tqY5Nt0yM8K2hdeXZGpVxY9Dq8pwszekT5muUB2ncMKhikq7u3drVLLUH7+LWkf0xgI1RD8MPSAGBVFgx2enpgYz4VxHedjqMaoo+NQO9+M38R
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3474.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(316002)(478600001)(36756003)(2616005)(5660300002)(76116006)(53546011)(66946007)(186003)(26005)(64756008)(66446008)(91956017)(66476007)(6506007)(4326008)(66556008)(86362001)(31686004)(2906002)(31696002)(7416002)(8676002)(71200400001)(54906003)(110136005)(83380400001)(6486002)(6512007)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JYagcnJnxSAGF8Xuh7EkD3zqE6Y4m7dX+11ZoqFimvtPwxUPlSC8oS419nFfMqCJLsGzov7D79Kq3s+Mn1/hzFHwQFsnC31bT4Ni4EtIr/2wjYCrWqm8/vxDnKupoiyB842Ob3zFUvLKitBAkXdxCMg6ej5G/dFImilROL2OEoKFnMEdhmQAN049+LXtL4IG7QgfBiHE+ENaSzGu2jgj19bbyGIc08u729WCIvgQ8ELkBCi/3oQVMz+/QyKGB2dhpsAXD5M1lYQ1tyX+eXSPBqfmQcLGllN7y9fmUTLBg2XmNgw91TFoLhtUHJQct9wYtMtGnPfLrol78jKBRJ5MV9LdkYd2IQDR84ahHsshmtMOrwv7+k5JathRC/WMVKa2AXdO+u01dX4inR0XNjofX8dB56PNAtzq6tPZ+XdjmIM3MFIlHBxlroTgmNjCB2mYyX+89fiB8F+9QbkOQylAF6blXu03IXCFeCZvQgua8VtBTWqHQw5Cw4txAMEp8HFWX0E3rXfC6600866GNg2pJRtSv/XPiTBnqNzKdGU1V4BAC6X7HgtoqsPirtrkIWFxmZHr+GqVjAtIpzL/BZNWQXY2Z4A7hA3LDYsv8uLlImgPChZOeeG+q9gbk054g8bXAoL/aiygzpsJjxpFvZNrWQ==
x-ms-exchange-transport-forked: True
Content-ID: <CA72F6642E098D4F9498E63F11094E1C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e12fa8-d7e0-4295-9a17-08d88ac3a53c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 06:40:16.7753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fDaDwzLIfGvCMFwPanGEbeV8vVP7S2uc97GZmiXpdoVWmkjpVXa5oo3tlqyGShnyjq5FyrxYisv8OJmGuNGTcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_014036_340850_93DED731 
X-CRM114-Status: GOOD (  33.50  )
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike,

On 11/1/20 9:04 AM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Currently ARC uses DISCONTIGMEM to cope with sparse physical memory address
> space on systems with 2 memory banks. While DISCONTIGMEM avoids wasting
> memory on unpopulated memory map, it adds both memory and CPU overhead
> relatively to FLATMEM. Moreover, DISCONTINGMEM is generally considered
> deprecated.
>
> The obvious replacement for DISCONTIGMEM would be SPARSEMEM, but it is also
> less efficient than FLATMEM in pfn_to_page() and page_to_pfn() conversions.
> Besides it requires tuning of SECTION_SIZE which is not trivial for
> possible ARC memory configuration.
>
> Since the memory map for both banks is always allocated from the "lowmem"
> bank, it is possible to use FLATMEM for two-bank configuration and simply
> free the unused hole in the memory map. All is required for that is to
> provide ARC-specific pfn_valid() that will take into account actual
> physical memory configuration and define HAVE_ARCH_PFN_VALID.
>
> The resulting kernel image configured with defconfig + HIGHMEM=y is
> smaller:
>
> $ size a/vmlinux b/vmlinux
>     text    data     bss     dec     hex filename
> 4673503 1245456  279756 6198715  5e95bb a/vmlinux
> 4658706 1246864  279756 6185326  5e616e b/vmlinux
>
> $ ./scripts/bloat-o-meter a/vmlinux b/vmlinux
> add/remove: 28/30 grow/shrink: 42/399 up/down: 10986/-29025 (-18039)
> ...
> Total: Before=4709315, After=4691276, chg -0.38%
>
> Booting nSIM with haps_ns.dts results in the following memory usage
> reports:
>
> a:
> Memory: 1559104K/1572864K available (3531K kernel code, 595K rwdata, 752K rodata, 136K init, 275K bss, 13760K reserved, 0K cma-reserved, 1048576K highmem)
>
> b:
> Memory: 1559112K/1572864K available (3519K kernel code, 594K rwdata, 752K rodata, 136K init, 280K bss, 13752K reserved, 0K cma-reserved, 1048576K highmem)
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Sorry this fell through the cracks. Do you have a branch I can checkout 
and do a quick test.

Thx,
-Vineet

> ---
>   arch/arc/Kconfig            |  3 ++-
>   arch/arc/include/asm/page.h | 20 +++++++++++++++++---
>   arch/arc/mm/init.c          | 29 ++++++++++++++++++++++-------
>   3 files changed, 41 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 0a89cc9def65..c874f8ab0341 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -67,6 +67,7 @@ config GENERIC_CSUM
>   
>   config ARCH_DISCONTIGMEM_ENABLE
>   	def_bool n
> +	depends on BROKEN
>   
>   config ARCH_FLATMEM_ENABLE
>   	def_bool y
> @@ -506,7 +507,7 @@ config LINUX_RAM_BASE
>   
>   config HIGHMEM
>   	bool "High Memory Support"
> -	select ARCH_DISCONTIGMEM_ENABLE
> +	select HAVE_ARCH_PFN_VALID
>   	help
>   	  With ARC 2G:2G address split, only upper 2G is directly addressable by
>   	  kernel. Enable this to potentially allow access to rest of 2G and PAE
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index b0dfed0f12be..23e41e890eda 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -82,11 +82,25 @@ typedef pte_t * pgtable_t;
>    */
>   #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
>   
> -#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
> +/*
> + * When HIGHMEM is enabled we have holes in the memory map so we need
> + * pfn_valid() that takes into account the actual extents of the physical
> + * memory
> + */
> +#ifdef CONFIG_HIGHMEM
> +
> +extern unsigned long arch_pfn_offset;
> +#define ARCH_PFN_OFFSET		arch_pfn_offset
> +
> +extern int pfn_valid(unsigned long pfn);
> +#define pfn_valid		pfn_valid
>   
> -#ifdef CONFIG_FLATMEM
> +#else /* CONFIG_HIGHMEM */
> +
> +#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
>   #define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> -#endif
> +
> +#endif /* CONFIG_HIGHMEM */
>   
>   /*
>    * __pa, __va, virt_to_page (ALERT: deprecated, don't use them)
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index 3a35b82a718e..ce07e697916c 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -28,6 +28,8 @@ static unsigned long low_mem_sz;
>   static unsigned long min_high_pfn, max_high_pfn;
>   static phys_addr_t high_mem_start;
>   static phys_addr_t high_mem_sz;
> +unsigned long arch_pfn_offset;
> +EXPORT_SYMBOL(arch_pfn_offset);
>   #endif
>   
>   #ifdef CONFIG_DISCONTIGMEM
> @@ -98,16 +100,11 @@ void __init setup_arch_memory(void)
>   	init_mm.brk = (unsigned long)_end;
>   
>   	/* first page of system - kernel .vector starts here */
> -	min_low_pfn = ARCH_PFN_OFFSET;
> +	min_low_pfn = virt_to_pfn(CONFIG_LINUX_RAM_BASE);
>   
>   	/* Last usable page of low mem */
>   	max_low_pfn = max_pfn = PFN_DOWN(low_mem_start + low_mem_sz);
>   
> -#ifdef CONFIG_FLATMEM
> -	/* pfn_valid() uses this */
> -	max_mapnr = max_low_pfn - min_low_pfn;
> -#endif
> -
>   	/*------------- bootmem allocator setup -----------------------*/
>   
>   	/*
> @@ -153,7 +150,9 @@ void __init setup_arch_memory(void)
>   	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
>   	 * populated with normal memory zone while node 1 only has highmem
>   	 */
> +#ifdef CONFIG_DISCONTIGMEM
>   	node_set_online(1);
> +#endif
>   
>   	min_high_pfn = PFN_DOWN(high_mem_start);
>   	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
> @@ -161,8 +160,15 @@ void __init setup_arch_memory(void)
>   	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
>   
>   	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
> +
> +	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
>   	kmap_init();
> -#endif
> +
> +#else /* CONFIG_HIGHMEM */
> +	/* pfn_valid() uses this when FLATMEM=y and HIGHMEM=n */
> +	max_mapnr = max_low_pfn - min_low_pfn;
> +
> +#endif /* CONFIG_HIGHMEM */
>   
>   	free_area_init(max_zone_pfn);
>   }
> @@ -190,3 +196,12 @@ void __init mem_init(void)
>   	highmem_init();
>   	mem_init_print_info(NULL);
>   }
> +
> +#ifdef CONFIG_HIGHMEM
> +int pfn_valid(unsigned long pfn)
> +{
> +	return (pfn >= min_high_pfn && pfn <= max_high_pfn) ||
> +		(pfn >= min_low_pfn && pfn <= max_low_pfn);
> +}
> +EXPORT_SYMBOL(pfn_valid);
> +#endif

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
