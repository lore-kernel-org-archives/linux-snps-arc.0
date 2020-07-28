Return-Path: <SRS0=gnwN=BH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C351C433E4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jul 2020 04:14:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC5220729
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jul 2020 04:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0uFd8HtO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="isOrGDkG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MEL4Wf4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC5220729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=to1D3GrWBovhR2B8gEFsUtL47nm7Lq5GHeZmB12Hc3c=; b=0uFd8HtOurRQh63ZRqf47yiel
	nd4DFpNaQUNbqsHTPQKeNGWY1zwtP4Mtq/JxHfMYltGwTo2u0sWdGucGGOSpu3lNcgWP79Pb6ITir
	xQgDTAr1Of/woped6LF2AkNnHA3MYlTvOC2ZvooTGykI8U1/dy9XeM5WMyPQPcVtwJpljIGcFkMiY
	mGyGQQWvn2pZCSxOGvkzsNR5lIsAvN/HfCzlKb/kLXouphgux9CnDgpGBrQcJBY/Ujr5mGmxmhfXF
	33Hal9jHWgx1uSfWhdaqKwJMiiYidfgNxDkkdjk9+OXmXjzvXcw499Ym2VXEuQOBKRT3R35C+OVfD
	md8aNBNYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0H0a-0007eP-Bc; Tue, 28 Jul 2020 04:14:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0H0W-0007d9-D0; Tue, 28 Jul 2020 04:14:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 780A140121;
 Tue, 28 Jul 2020 04:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1595909666; bh=pB5MqliBswYzDwRUMHxjSwH/e2+/99t61ohwOfuFQyY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=isOrGDkGDjeXK+2UMmRTBY05qG2x14m74tgTC6Am2VrZh6J+5x1xBnRxNjyXsWoeW
 d4X/v4dfYDF3KYaWYT+wvOhzoZugqNXlnSGJtAHE8sCuU0v/hMngxAYzM9AGF+q+9f
 vIQpLHwsX0IePHfu5ybzeQ4E/RXYBZ/8m69WVyFG+qhiE9x9U6PaG9t8YhU0hlQs1O
 gm+rgfrWhe3/agT/Hng9BvcHMVOGTQ7mt/9tOIU5VjYPyrox4YG6/hgqcFes6UxbnM
 xra0CebPI4x/vIWhKXGCf5gHWwI0YxVF4cPl8RvVPPsMQw0DkKwN24x7Vn/0XiMfZM
 r9KgkLA4nh08A==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6A821A0079;
 Tue, 28 Jul 2020 04:14:22 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4A9A780FB6;
 Tue, 28 Jul 2020 04:14:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MEL4Wf4u";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KckpeMv6AcPZXXWUUkJXmWOEl9CWM/J3sj5mOkasSmZL67NDRgu9KNcUVysfTn5v0EvwJKk7KCcnmVUoCbMkrcAz95vBK4HIjl/zMbf9/fenRIAOpMyKkL6tFaiuMg9e9eeUPhYLpbp7nCju0k9nbhh159pKFWrkZT2e19FYQYSgAnh7j9wnM88VS9mqTpNjVV65eq13qjMnGNXtozsqXSrSWoaT9uA0XIGP74WaBNuXee8udtsoyrPArIwHJatc30x7xJKBEM9zxFCoaNcyE45bFW1R9sKvCWQkm4/GXp+lVBKwx+e135v3pB8g5bs23WRMlKegFtDN8DXCZBhBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB5MqliBswYzDwRUMHxjSwH/e2+/99t61ohwOfuFQyY=;
 b=VC8EbaNg3S5jn5/tNa9T5qiRbA4AY3KSH8Sh9FB9KovkHNALGOrXeDPQr1E+fedGvDn3Dx/960w70wPOuOWW4wh4YfKRciU8LcwD+AK1n2FjoQiCZzV0GyVD2W92LoPg5V8IpsrzqNuNu3tIF9dE9GJRqMSuU1vte6I4juuJtOok5GMoxr5fPd9UPAd7N5DjBGtqGgIAwQAxDlZ/UgpWXVaE9/+fA8HNdiyGzOSVqHp7pgEmOXN+ov/OU6HEL3apHr6cVjK+YlqcnrOZ2o94Q9XUfP2l69uFCtZDXxNq19qN1Y+4qekO4uVhkd+HGMzJbGQe6ePxq4gx37C+AKsupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB5MqliBswYzDwRUMHxjSwH/e2+/99t61ohwOfuFQyY=;
 b=MEL4Wf4u0FWXHTGDJfrZYTKSMhhb2uDp1HQxQ9fIlC5foUGOFE4mkcKxGJON2fatN50pf+xgwnNBVjxFm7ej1NhKC6B+3fgOq+c/ERZBvD1WjSIfWKcJ5OxPjhvMxsbyA1SssZ8ln68y/fTko0KnB0iJewn/x3cNlt3s03ym47I=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3480.namprd12.prod.outlook.com (2603:10b6:a03:aa::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 04:14:18 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 04:14:18 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Nicholas Piggin <npiggin@gmail.com>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 04/24] arm: use asm-generic/mmu_context.h for no-op
 implementations
Thread-Topic: [PATCH 04/24] arm: use asm-generic/mmu_context.h for no-op
 implementations
Thread-Index: AQHWZJWPTsO8E3Tk50qowEQAEpCHaw==
Date: Tue, 28 Jul 2020 04:14:18 +0000
Message-ID: <86611bf1-13b2-65e5-50d5-b0701020cd3e@synopsys.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
 <20200728033405.78469-5-npiggin@gmail.com>
In-Reply-To: <20200728033405.78469-5-npiggin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 044b8976-e8d6-433b-54ba-08d832acb267
x-ms-traffictypediagnostic: BYAPR12MB3480:
x-microsoft-antispam-prvs: <BYAPR12MB34805C3C983502455EDABB01B6730@BYAPR12MB3480.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:60;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vaj7I4PuBDc5L+DPgrx6gb3FI/Q+8y9QPmLW3ukc+hufBJZCIzm/WWKOlteNFSvWTKxtAwCVcU8+yoZJRjfx2COiLsUMGu12ezokv6DOwA4jUsOZdwIm3TVHZ/ry38juQ86jyRFOTFvmAfGb/rUypOjBpuQ+bLpEgoVtFtbpdzg1ijx8I4XeOyOflS8qvJrISNsNZffQhaDIn9irrZWiryCCFqj0cMrMz4XTvGQrCXrFlsSr5toXCeEAYbSTLOzdH/fOk6S2MIFx4CdoxJJGbaAmv47vw/F+BWMcUDMsIEe/l+kCdRzyp6aVuelhplrm6rCHa70OOPX+zFfTAk42Ri5fngXfokSKzOKWiJ30BMlloxyIHDfO34l2nz3xv8gfWSOBGspqsFkKteWpUmXJeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(346002)(376002)(396003)(39860400002)(31686004)(86362001)(8936002)(6486002)(83380400001)(110136005)(54906003)(31696002)(8676002)(2616005)(36756003)(26005)(66446008)(64756008)(66476007)(4326008)(76116006)(66946007)(2906002)(478600001)(53546011)(186003)(6512007)(66556008)(316002)(5660300002)(6506007)(71200400001)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PFgVnW46YDUQZ7+MnVSYGnDy4dGYGpH431MjnBXpkmqk+RBeRKV7CrjTn/lkLVw1AQ6nVw/AED2/fx17qTZ1H3vkNC6npJM8cd61u5v1Pr+vm107Q/jdPQaXtztNgIPorXp9TXPlzuYqWkj9RC0k5wUWE8cFno0rUpb0e/Zjkms1aK5SC7CcNxDTD2cZkqI6oBrR1AQBtWMxtIjCOmXGleL4SiyKLuDHbhWXqi2F4H9MUjvi5sdE/rWJ/P4/bCWzoVW0LgV+gaRljdY2fOvoKDaX1x9UwugYbjSP7PbtE96gyXOGJ3emaIhZcHCXH3+8+uWuhSPXpXmAVEEIbE5dGfRiT6FD5dTngq/6dAB9lHOQBowVU+855OJ0QuX9DxLR+tBOWeYoVYaQ93lqnon8QYUKkYzirTxF+K6AJllMGbQX7UCDXh4XhcxsFd7npcejIpa+Y+WR3yzr1VHzpNvF5oX/gOFZ9EWkl6vzf9a1+vmj8YWTUtQXWjkTDwBAeBt8
x-ms-exchange-transport-forked: True
Content-ID: <C31602D99210B240A81A2567C2C2840E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044b8976-e8d6-433b-54ba-08d832acb267
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 04:14:18.1205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JSmi/kAQDmVya2vUJIqXFeL+toD0xfNM2Q1o5eRUp6g7aPN2FD8IfnkO1h6tTBC+jjdmSGetRVmAR7GDAqJHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_001428_581508_11762F1B 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/27/20 8:33 PM, Nicholas Piggin wrote:
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/arm/include/asm/mmu_context.h | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
> index f99ed524fe41..84e58956fcab 100644
> --- a/arch/arm/include/asm/mmu_context.h
> +++ b/arch/arm/include/asm/mmu_context.h
> @@ -26,6 +26,8 @@ void __check_vmalloc_seq(struct mm_struct *mm);
>  #ifdef CONFIG_CPU_HAS_ASID
>  
>  void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk);
> +
> +#define init_new_context init_new_context
>  static inline int
>  init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  {
> @@ -92,32 +94,10 @@ static inline void finish_arch_post_lock_switch(void)
>  
>  #endif	/* CONFIG_MMU */
>  
> -static inline int
> -init_new_context(struct task_struct *tsk, struct mm_struct *mm)
> -{
> -	return 0;
> -}
> -
> -
>  #endif	/* CONFIG_CPU_HAS_ASID */
>  
> -#define destroy_context(mm)		do { } while(0)
>  #define activate_mm(prev,next)		switch_mm(prev, next, NULL)

Actually this can also go away too.

ARM switch_mm(prev, next, tsk) -> check_and_switch_context(next, tsk) but latter
doesn't use @tsk at all. With patch below, you can remove above as well...

-------->
From 672e0f78a94892794057a5a7542d85b71c1369c4 Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Mon, 27 Jul 2020 21:12:42 -0700
Subject: [PATCH] ARM: mm: check_and_switch_context() doesn't use @tsk arg

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arm/include/asm/efi.h         | 2 +-
 arch/arm/include/asm/mmu_context.h | 5 ++---
 arch/arm/mm/context.c              | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
index 5dcf3c6011b7..0995b308149d 100644
--- a/arch/arm/include/asm/efi.h
+++ b/arch/arm/include/asm/efi.h
@@ -37,7 +37,7 @@ int efi_set_mapping_permissions(struct mm_struct *mm,
efi_memory_desc_t *md);

 static inline void efi_set_pgd(struct mm_struct *mm)
 {
-	check_and_switch_context(mm, NULL);
+	check_and_switch_context(mm);
 }

 void efi_virtmap_load(void);
diff --git a/arch/arm/include/asm/mmu_context.h b/arch/arm/include/asm/mmu_context.h
index f99ed524fe41..c96360fa3466 100644
--- a/arch/arm/include/asm/mmu_context.h
+++ b/arch/arm/include/asm/mmu_context.h
@@ -25,7 +25,7 @@ void __check_vmalloc_seq(struct mm_struct *mm);

 #ifdef CONFIG_CPU_HAS_ASID

-void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk);
+void check_and_switch_context(struct mm_struct *mm);
 static inline int
 init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 {
@@ -47,8 +47,7 @@ static inline void a15_erratum_get_cpumask(int this_cpu, struct
mm_struct *mm,

 #ifdef CONFIG_MMU

-static inline void check_and_switch_context(struct mm_struct *mm,
-					    struct task_struct *tsk)
+static inline void check_and_switch_context(struct mm_struct *mm)
 {
 	if (unlikely(mm->context.vmalloc_seq != init_mm.context.vmalloc_seq))
 		__check_vmalloc_seq(mm);
diff --git a/arch/arm/mm/context.c b/arch/arm/mm/context.c
index b7525b433f3e..86c411e1d7cb 100644
--- a/arch/arm/mm/context.c
+++ b/arch/arm/mm/context.c
@@ -234,7 +234,7 @@ static u64 new_context(struct mm_struct *mm, unsigned int cpu)
 	return asid | generation;
 }

-void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
+void check_and_switch_context(struct mm_struct *mm)
 {
 	unsigned long flags;
 	unsigned int cpu = smp_processor_id();
-- 
2.20.1

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
