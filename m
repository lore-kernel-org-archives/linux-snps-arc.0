Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5D6C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 18:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922F92078B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 18:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koTHJatK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="csh1rWSc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="v4GUQ98k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 922F92078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mhCfXvAtn7BsgkSIhzQS0meh5ZjKLuTdGIYcfM6tH7A=; b=koTHJatKAwk5Y+tuzofwQ/9Dn
	hcOY3vXeLxAi4bU9b11ot61FHDups+IgAGGZiY1/d7Q0A9dXi4QxKvzRNuGQGfWCHbkavhBpjo30r
	lpRHb4gX0xyrZYbPPq9mXCYXTTssqYWTBEt3S5l3xjU6mVnZGF0OEyfrk0dxhPUYaW6JePa06cglj
	F055t/v24iHVwwiogYzIBlNT2+oH3SwE5qBTtxN/o/QNFw1U9yhjM4o9iA2t349OQiOHDXldXiG8i
	1kfIjzWhfVHyW6lQviggaB8xLytIHZ5Jmhpb2WULt30qTOEpgEpACN5552wc1gdW86Bni/DqwOyzP
	oXg8hT8hA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDB56-0006Cs-Oh; Tue, 01 Sep 2020 18:32:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDB53-0006Bl-VU
 for linux-snps-arc@lists.infradead.org; Tue, 01 Sep 2020 18:32:31 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C04A040122;
 Tue,  1 Sep 2020 18:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598985146; bh=cjZVIFpGE3M28JHhN917Qp/6auNhqB++Z+Azs78hsIE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=csh1rWScPyWVcD4A17f+qqjbUOccmsJMkZSFtJ4o7Mz1EFmVJyeAKjjxqIevWOW/v
 ITGchiG8NFofjW3jEw/llKa9HPdGsOklZzmkvAp54MrVyRijyavGmBsLMgxAlELxye
 Tx+lTjmkdCJ3jk93nc2D806RxxlMK8ySZyMEoksG7Pj3nctf91vcYnI7+vMmNoMsI1
 8jFbmFGYFl7+W9xABSt9oS6agKqahU5XJj6cVAuBalqnzbuuK/1s6ujOwqpUDZHbU4
 c+ndLvpdNgtXebtSvHho4RoJ3nA2fo/FJ23HPcE3udRAdgiiXpVTXGFE/SMl7EUto5
 hpPPR1I+GeSaw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 076ACA0062;
 Tue,  1 Sep 2020 18:32:22 +0000 (UTC)
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2053.outbound.protection.outlook.com [104.47.44.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C44D980002;
 Tue,  1 Sep 2020 18:32:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="v4GUQ98k";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVyQTTpmG8CEptNnBKMbXDlSnBcsk4DDRiMFfbRveTpCOnoO5B7cneeXH8ZKJRlXyn9vxTFIpYa/tg2Dug2o/4s+l4JLFOpv3slUI42Hl0XffY7OqwMUkxwXy1YHGgJI220PZTWdohCo4OvNnn6dkXhSv1BqQ93/PbQlzGUU1vvR7s5Nn4QpGB78oIK+wmgplJ5Gh/VmidUzq8GLFOEXU5ExQl3m3pgZftzVlE/HFGqwp1P/eWZRfUAMCHIM8ytyn0qcL8GmkVPFmz/aCdEg/76dIXNANADAKChEzxSaUDC2QvJ9ybjCxv2XcwhJlyvPIuQVqnkvVde/j90JQfhCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjZVIFpGE3M28JHhN917Qp/6auNhqB++Z+Azs78hsIE=;
 b=oaQCZGON1fWu1RqubvYdroNeC8x8HKzijUEsAgMAf6u3cSkNkhVocLV7vkVGzLQfM2Gl8Rg+Z4UylUjrt7cNkQ1WIgzsl7BwLBTUCLv5ZYl57HM+eBwnW+Z39jjhUHoux/2WOLFV9owQ6itB10/903PfZx6lOSp8OaQkwroV6YekqpQqtEu1qJ0IWYMBMM+aVzO3VHye8SW4Rb3sHL4T2fZxzqoCZxhc5a5GtvfcAd6VBc7TssxL5HD+HwGX1i3hEw/m1TWZrfHrk99KMpIMRnMuDL2l620rFH4ijVaOVEwJYqtRZjT4ibRdXUK/CzHvNaaBqha6+k/I6JkaWILIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjZVIFpGE3M28JHhN917Qp/6auNhqB++Z+Azs78hsIE=;
 b=v4GUQ98kiAuV3TtA1YEW7Fs9GjETK/r8gtZ+u3qy7GOP1flQI49VJ6tDoJoZYbSlXNvYxswCsuPrnIIeihAPE+2AovAAD3UJ1k+YEzLCtuXPGiR2f5cExeZ16e/hPr+v7v1XsosSFEd4EVxzWg/NzjG6BRHbaq016nDsUTHCC3o=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2950.namprd12.prod.outlook.com (2603:10b6:a03:131::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 18:32:15 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 18:32:15 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Nicholas Piggin <npiggin@gmail.com>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v3 03/23] arc: use asm-generic/mmu_context.h for no-op
 implementations
Thread-Topic: [PATCH v3 03/23] arc: use asm-generic/mmu_context.h for no-op
 implementations
Thread-Index: AQHWgGptsa+/2AtHFk2qGtGyl0DqlalUG5cA
Date: Tue, 1 Sep 2020 18:32:15 +0000
Message-ID: <d6d24a21-dd08-73ad-9707-0ee341ecda7b@synopsys.com>
References: <20200901141539.1757549-1-npiggin@gmail.com>
 <20200901141539.1757549-4-npiggin@gmail.com>
In-Reply-To: <20200901141539.1757549-4-npiggin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:b9:9593:5cb1:ebc3:8ee9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cab67210-6b7b-43a1-1ded-08d84ea559b2
x-ms-traffictypediagnostic: BYAPR12MB2950:
x-microsoft-antispam-prvs: <BYAPR12MB295006ECF4B796F5ECFBEEC6B62E0@BYAPR12MB2950.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9u3cyod/36AYHWdt/bfh3PnXnccZo1PtFgTVoFnnWp+KiS0BKfhv7IsGEywmHA5tkowXPQpl7UEhtEXOv/rj8vFlbXUBqQtK14sRwK9ln5CBbkytnMHkp2Xd07T7AB7BUvifTsCVbTT9daGSu1H+ERqDxTxrNEHWd0ouOhiaI51YLnw2++esj+y9v9xcBdSq4yz/hiMzvoOTNyVC/CxQYqXTUl4SIo/usEl5hpEepEHr9MWFSAvlwvBE6IhK8Ql+m/QPZR20r81IwyiC/Opyuy1S9v3IxLpAG0HU3NLX4exDvveQG/qy+xsFEFnSYI8N2VN+Zf4KqsMhFgpsnC1eQcJcnK1hMnS9ox6V71xDufd8pjhDTjiYe+VXoklAqgCgXxIIiuvmArA/QWF8gkZyBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(66946007)(66476007)(66556008)(64756008)(83380400001)(6486002)(478600001)(8676002)(76116006)(66446008)(8936002)(110136005)(5660300002)(71200400001)(6512007)(4326008)(2616005)(86362001)(2906002)(31686004)(186003)(6506007)(53546011)(54906003)(316002)(31696002)(36756003)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ppzIP7AFm7VYlIRbH9iJSUlN199bda6JtBGBSmr3o/Z4R5JNtthEqtVe+dE8cNpNh8WTQ6sWwWEbFFq9UbcDwdxtcGiNX2tZ4RnBtznmEXgb0YMdEfhyIQvzdb9i1HYIOcW95Qm7kseEKMcyibSrQsjHVOczBLAkTQA7ccJx5HZApJ+clJTLXQQuVGeePWYMW0NmcDjw4gU8VxJGXQ/rHhUwbkwSDl/rkU5cf/FmIew6V4ajjEdg7JbVlHY0LqLBguFY3YUkT3xbse6nKa8X81A3S9+/PwWVaQCj6KAYlZ8ikBdq8iqSCuGC312vEPHZM9z+fVm7WQh6sHY1Vr4P3qFsQICruG73jfLhqaTu9AwFBH32Amv1wG9n9/WiRoyV4cTwEicX1GHTZo9SFwumA4WawrNEKtsfWHXacl18AUFJLMqOkBliahjxd4fZM/Iu0PfO7bcW8LUSW22z/iQjvEFKeadl1gWAYUuOPOdMtSe9ex1ulCCZD+mWEUR9YFHXKY/gBI8xHs38juZrna/dRj4O7BG0/exNPxbzQ3wUM4fYt2bBVyU2Vv5owPWCZYhK7N2/GedoVp9WWLWt+sAYjDVZE7aBm6ZOyPNFgcOBvgGxo4knObQvET7A4rYFQ009azHOfTBeuDvq/BlqMd4iSxsEL8wLs9XSgt+VEcK2SljZMVqWwWiM84QT3v4WzUkQdA41gyQhieOi+b2wnFo+1A==
x-ms-exchange-transport-forked: True
Content-ID: <09D99B04AA97B24484D08876FD111B8F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab67210-6b7b-43a1-1ded-08d84ea559b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 18:32:15.2681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVvaGp6SKKdEfOYz5UcEQrk3k28cKbtaMKFZ6KXldoPT+q+lOEmwuHMp+JSj8gCNOaO8BZ3gpsMXpffgfqAJ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_143230_161602_9D8F416D 
X-CRM114-Status: GOOD (  25.35  )
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/1/20 7:15 AM, Nicholas Piggin wrote:
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Vineet Gupta <vgupta@synopsys.com>   #arch/arc

Thx,
-Vineet

> ---
> 
> Please ack or nack if you object to this being mered via
> Arnd's tree.
> 
>  arch/arc/include/asm/mmu_context.h | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/include/asm/mmu_context.h b/arch/arc/include/asm/mmu_context.h
> index 3a5e6a5b9ed6..df164066e172 100644
> --- a/arch/arc/include/asm/mmu_context.h
> +++ b/arch/arc/include/asm/mmu_context.h
> @@ -102,6 +102,7 @@ static inline void get_new_mmu_context(struct mm_struct *mm)
>   * Initialize the context related info for a new mm_struct
>   * instance.
>   */
> +#define init_new_context init_new_context
>  static inline int
>  init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  {
> @@ -113,6 +114,7 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
>  	return 0;
>  }
>  
> +#define destroy_context destroy_context
>  static inline void destroy_context(struct mm_struct *mm)
>  {
>  	unsigned long flags;
> @@ -153,13 +155,13 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  }
>  
>  /*
> - * Called at the time of execve() to get a new ASID
> - * Note the subtlety here: get_new_mmu_context() behaves differently here
> - * vs. in switch_mm(). Here it always returns a new ASID, because mm has
> - * an unallocated "initial" value, while in latter, it moves to a new ASID,
> - * only if it was unallocated
> + * activate_mm defaults (in asm-generic) to switch_mm and is called at the
> + * time of execve() to get a new ASID Note the subtlety here:
> + * get_new_mmu_context() behaves differently here vs. in switch_mm(). Here
> + * it always returns a new ASID, because mm has an unallocated "initial"
> + * value, while in latter, it moves to a new ASID, only if it was
> + * unallocated
>   */
> -#define activate_mm(prev, next)		switch_mm(prev, next, NULL)
>  
>  /* it seemed that deactivate_mm( ) is a reasonable place to do book-keeping
>   * for retiring-mm. However destroy_context( ) still needs to do that because
> @@ -168,8 +170,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>   * there is a good chance that task gets sched-out/in, making it's ASID valid
>   * again (this teased me for a whole day).
>   */
> -#define deactivate_mm(tsk, mm)   do { } while (0)
>  
> -#define enter_lazy_tlb(mm, tsk)
> +#include <asm-generic/mmu_context.h>
>  
>  #endif /* __ASM_ARC_MMU_CONTEXT_H */
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
