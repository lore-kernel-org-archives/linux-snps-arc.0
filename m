Return-Path: <SRS0=uiT2=7A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64097C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 21:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB2C205CB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 21:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6VT6b7n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="L1suG6yg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB2C205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pupRgrAMz8SFXg7VIqj+S2xLFeNg3r738H1LvekNj9k=; b=m6VT6b7nPgnOrv9yzYB0Rz/ma
	2yWmzGBjj0w2qsm6G+xtryg5n23EYTW1nuHLOVJBmOIXseN1Fk9yrBbQQlBT2UX01+67u6PgcJwrz
	3uDB0v1dGQ+wI49I73X3+/rT+XS9/rtRIpRT0waWjUjhMYrQoZ4uFvr81BP3lWZAdI31zcRMMTTu5
	sxY5fqe70Jvb0+vRzrSAk9B4raiLgsm/luWp4fofzgr3xpSf9bq71G10r/PkK/lkXiRPju6BbZIkH
	nvMMJOpkuf86YYTpSBAAl3bqZBiofrAO81KWseEUWcLAh+4mE2soqD0Ys2BmTQ4nzvYEo+9CFmS1H
	ef2YV/pog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1janTi-0004Zu-OI; Mon, 18 May 2020 21:39:18 +0000
Received: from mail-bn8nam11on2134.outbound.protection.outlook.com
 ([40.107.236.134] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1janTd-0004UP-0q; Mon, 18 May 2020 21:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM7oyBqSK8RwYLPoLbUCgdgREU450FWTuin4vgFVEVZIgUUAq1zV7PRGxAgKPyk4Ec8Wzz8zjduotEWqMWwPy5KQi7233A7hHdQSvOEDV7v4eB1yggROrBb8zrFIsUL9FPthYhnIgMF73PN9sCIux+X+RZn46ciFevLvVov2Ugr4NeLhX/BWsgOMpESRqcKsWs0lysnKuXBW61E+AXwoswfEIKK8KS6ZAjsPkDH21H0rbg07zSZS8SNF8Ix9p3IyQs0wFFIrIesRNZmcoQeFULATzqMb2q5GqeYnyBpf1Qlz0YlcgAjXwijTshhaJc8UiSBblhFdv+XQE3XhQCt7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzT8HcCmD0Xp9iJHM3Uy2tk2M3NOXSrnwHBwmtYoMrs=;
 b=Gh+Rk9h10nIbUuTt6cvFwhh63yAAM6kerO+lnvrS0+p0q3dHOk67SCYM6XWf8u4oetqjry8vswxgaWoQL8xeSVHH3vVU0J7KMgLElWUz4bFFB/DhzUpB4do8oYB4SckI9o/x4zRWO2iJbGzA7VHJyK/aWNAaeMnQuy0ggj4BGCg0ogDdKgWqbiltWaRn+A8gBpJi9rQ9GWDM05nbHIOeDyOff6hxL3Dkz56L5KLezLPZOjX6k5l8TkUrYMxlh99aZ1LMyWjtMwcjeWeM4ZO5iwwB42H39e6WOoZuqbp/F/nETq6Y4u8n0c2DFyb1RgxpjJ3e5FrSmTCaPRbQSez3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzT8HcCmD0Xp9iJHM3Uy2tk2M3NOXSrnwHBwmtYoMrs=;
 b=L1suG6yg2K9AQUSP1ddSpQ0hr7pkCmqAyZKF+0YTJd3OlXvU2IWb7Q4ARr4rz3hr59B9UJ6oshXxLkjz3k2yKN/MI+wV2Eoj9O7D5WKkoDpUi1lo0P/6aUmDe7+TwjYd8bqdMltkzILj1Efgeo/18zA8WgfYoERIVOGYbGxuD7M=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB5494.prod.exchangelabs.com (2603:10b6:a03:127::30) by
 BYAPR01MB5398.prod.exchangelabs.com (2603:10b6:a03:124::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24; Mon, 18 May 2020 21:39:08 +0000
Received: from BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::f5d6:2057:2508:fbd8]) by BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::f5d6:2057:2508:fbd8%3]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 21:39:07 +0000
Subject: Re: [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
To: Baoquan He <bhe@redhat.com>, Mike Rapoport <rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
 <20200423011312.GY4247@MiWiFi-R3L-srv>
From: Hoan Tran <hoan@os.amperecomputing.com>
Message-ID: <84f572b2-9e61-f9d1-008d-47ac978f5ccc@os.amperecomputing.com>
Date: Mon, 18 May 2020 14:38:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
In-Reply-To: <20200423011312.GY4247@MiWiFi-R3L-srv>
Content-Language: en-US
X-ClientProxiedBy: CY4PR22CA0095.namprd22.prod.outlook.com
 (2603:10b6:903:ad::33) To BYAPR01MB5494.prod.exchangelabs.com
 (2603:10b6:a03:127::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.138] (67.161.31.237) by
 CY4PR22CA0095.namprd22.prod.outlook.com (2603:10b6:903:ad::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 21:38:54 +0000
X-Originating-IP: [67.161.31.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072a96ea-83bd-44ed-0900-08d7fb73e492
X-MS-TrafficTypeDiagnostic: BYAPR01MB5398:
X-Microsoft-Antispam-PRVS: <BYAPR01MB5398388EA4C80407F8CA1B2DF1B80@BYAPR01MB5398.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wW8KfoS04y9O4OsqvSRvqE4Q4hSURo2QRNkkFwyHcOGw++GpgkG/YjHI88b2lajNH/AYNklRRvBajYeoIVzd3TiR7aEntGuLRPjVMk5+IZEZVK+qQ+ANe7jbaf1cA3IbC59Y4GyrOM04zvVfGsYrFEdCq+hrR4/vHGpRZPgGON24obOS9qVdxGWy+Tb6BLRSnn/6wYI28mfU45tb5ZSP3tajByx2D3PD/om4bB34VG/U+aAsJtlfVu16KBJpPSjReLa6VcC4nGAxMBV9ve+3SkLkqJ36Xp+ewi+LId3cv3wmhOQbLtZqsrKqE5Qz89iCnHGlUZnFc7bGMz074+TuMgDD301BG8FuBtkDpEa6D87uUOATJ8aFG3Uj4MKjBwvgcmHD1AHCN+lkH7tQGD5NFjvlxyn6w/suhXCbLsVqNqTs1nOPPFhfcu6RARij/EPBUbr92wRtTauWE2Wv5d+mpBHYFcFHBl8HUJosFtENArXJoDX3UkZyg3ljT2dCeTPb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB5494.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(54906003)(110136005)(478600001)(316002)(16576012)(86362001)(2906002)(7406005)(7416002)(16526019)(31696002)(7366002)(6666004)(6486002)(186003)(4326008)(66946007)(52116002)(8676002)(66476007)(66556008)(26005)(31686004)(8936002)(956004)(2616005)(53546011)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Cw1D1iWlSiM5bAzZp73gwYtfOFCq6lsvpjrtNXgLW2xN13EH2PZ/LpWpXtR8CfE042IzcSKhwZC3Hvst1BNnRanDssCmsWcFKh3wspWQaEOnJYkdBA6KVL4oTupOppKD0hX+ZOAzgzfkj/wWMq0DevpDdKb7cvUdzDb+58ka3W1KjCAXSZ05zsJvjwx0MQcAlt5QEjgboynrK2cDSz+hojyoCI03k+1G7s2NvFj70l2dupF0W4zEota6E+7SajSqJ7j8t0l9u17/ZnSgkpjMVA/IIz90IhlNvRGAl7dTTFdv9KbTk2zsIFO41fAbxOCBeY5wjjHPM0sNck8x8k9rZ0vbUQ0GLmNtlwhEalMq+t56zRptVlySNeDionROkg1WfkZRGVixhSBR9Sw/g4VlNCjEDqdEHJuqtR6B3DicGhA9uSEWMobycZWngRE+unIeamPutj+yrrAkSXlYKo74RyFlrrMCCLFXam8EMA5lfmI=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072a96ea-83bd-44ed-0900-08d7fb73e492
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 21:39:07.5548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfg3VUK+MC4HQYCJWhf2lM45ELIl1ue3+m68wQN+sOFb8JhTDnanF3Y5wMTvkJ0AwTKv7ZEjbWKz07uEqAtBdTgp8WO2XxN0XFduZ7oaOmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_143913_113511_B9AB1F64 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike and Baoquan,

On 4/22/20 6:13 PM, Baoquan He wrote:
> On 04/12/20 at 10:48pm, Mike Rapoport wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>
>> The commit f47ac088c406 ("mm: memmap_init: iterate over memblock regions
> 
> This commit id should be a temporary one, will be changed when merged
> into maintainer's tree and linus's tree. Only saying last patch plus the
> patch subject is OK?
> 
>> rather that check each PFN") made early_pfn_in_nid() obsolete and since
>> CONFIG_NODES_SPAN_OTHER_NODES is only used to pick a stub or a real
>> implementation of early_pfn_in_nid() it is also not needed anymore.
>>
>> Remove both early_pfn_in_nid() and the CONFIG_NODES_SPAN_OTHER_NODES.
>>
>> Co-developed-by: Hoan Tran <Hoan@os.amperecomputing.com>
>> Signed-off-by: Hoan Tran <Hoan@os.amperecomputing.com>
>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig |  9 ---------
>>   arch/sparc/Kconfig   |  9 ---------
>>   arch/x86/Kconfig     |  9 ---------
>>   mm/page_alloc.c      | 20 --------------------
>>   4 files changed, 47 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 5f86b22b7d2c..74f316deeae1 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -685,15 +685,6 @@ config ARCH_MEMORY_PROBE
>>   	def_bool y
>>   	depends on MEMORY_HOTPLUG
>>   
>> -# Some NUMA nodes have memory ranges that span
>> -# other nodes.  Even though a pfn is valid and
>> -# between a node's start and end pfns, it may not
>> -# reside on that node.  See memmap_init_zone()
>> -# for details.
>> -config NODES_SPAN_OTHER_NODES
>> -	def_bool y
>> -	depends on NEED_MULTIPLE_NODES
>> -
>>   config STDBINUTILS
>>   	bool "Using standard binutils settings"
>>   	depends on 44x
>> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
>> index 795206b7b552..0e4f3891b904 100644
>> --- a/arch/sparc/Kconfig
>> +++ b/arch/sparc/Kconfig
>> @@ -286,15 +286,6 @@ config NODES_SHIFT
>>   	  Specify the maximum number of NUMA Nodes available on the target
>>   	  system.  Increases memory reserved to accommodate various tables.
>>   
>> -# Some NUMA nodes have memory ranges that span
>> -# other nodes.  Even though a pfn is valid and
>> -# between a node's start and end pfns, it may not
>> -# reside on that node.  See memmap_init_zone()
>> -# for details.
>> -config NODES_SPAN_OTHER_NODES
>> -	def_bool y
>> -	depends on NEED_MULTIPLE_NODES
>> -
>>   config ARCH_SPARSEMEM_ENABLE
>>   	def_bool y if SPARC64
>>   	select SPARSEMEM_VMEMMAP_ENABLE
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 9d3e95b4fb85..37dac095659e 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1581,15 +1581,6 @@ config X86_64_ACPI_NUMA
>>   	---help---
>>   	  Enable ACPI SRAT based node topology detection.
>>   
>> -# Some NUMA nodes have memory ranges that span
>> -# other nodes.  Even though a pfn is valid and
>> -# between a node's start and end pfns, it may not
>> -# reside on that node.  See memmap_init_zone()
>> -# for details.
>> -config NODES_SPAN_OTHER_NODES
>> -	def_bool y
>> -	depends on X86_64_ACPI_NUMA
>> -
>>   config NUMA_EMU
>>   	bool "NUMA emulation"
>>   	depends on NUMA
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index c43ce8709457..343d87b8697d 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -1541,26 +1541,6 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
>>   }
>>   #endif /* CONFIG_NEED_MULTIPLE_NODES */
>>   
>> -#ifdef CONFIG_NODES_SPAN_OTHER_NODES
>> -/* Only safe to use early in boot when initialisation is single-threaded */
>> -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
>> -{
>> -	int nid;
>> -
>> -	nid = __early_pfn_to_nid(pfn, &early_pfnnid_cache);
>> -	if (nid >= 0 && nid != node)
>> -		return false;
>> -	return true;
>> -}
>> -
>> -#else
>> -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
>> -{
>> -	return true;
>> -}
>> -#endif
> 
> And macro early_pfn_valid() is not needed either, we may need remove it
> too.
> 
> Otherwise, removing NODES_SPAN_OTHER_NODES in this patch looks good.
> 
> Reviewed-by: Baoquan He <bhe@redhat.com>

I have tested this patch set on Arm64, and it worked as expected with 
the case where the node memory spans to other nodes or the old 
NODES_SPAN_OTHER_NODES config.

Hope to the whole patch set will be upstream soon.

Thanks and Regards
Hoan

> 
>> -
>> -
>>   void __init memblock_free_pages(struct page *page, unsigned long pfn,
>>   							unsigned int order)
>>   {
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
