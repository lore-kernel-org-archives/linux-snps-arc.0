Return-Path: <SRS0=Y6oE=DO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8A1C3279D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 03:05:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1FB20782
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 03:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GRiH0+m2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VgJqY7cN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sLkmUiHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1FB20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/aMDXUUo4YpIj/4J/EgWKlcbsNMyR060vB2aohR/FLk=; b=GRiH0+m24soZ9cR73eEU9bhWG
	JKVd7ISrCoj45NoPVkrzpNe5/gDYDe609gPJnCWztgTmEXR5kY0RxBhRvSNn57brKK6h3jJf1RzRK
	bKEbWK2WuOhzXF2R90sDd4/eJjbzftUEVWZhde+cD/g1ffAhv5f54L0XyKkvFcH58zGI95T2blUHI
	dgMyS7UVpWdPjMdzCX1EuCWRGNd+2tktJ0vvFKqCpZGpNIDvo+jh7fWpjrcFp5l0Kd/TxCe9pmzxP
	Ifl2iArKigl9s5ppA+INY/M2AQr/LkhsCgsKWTfzwOKYSZ3GFK2lo0jdWVHcsUcBWHfDJjYXGqos9
	iTMc/u55Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPzlz-0006o7-EQ; Wed, 07 Oct 2020 03:05:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPzlv-0006nD-ST
 for linux-snps-arc@lists.infradead.org; Wed, 07 Oct 2020 03:05:45 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E0E3C401AD;
 Wed,  7 Oct 2020 03:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1602039942; bh=/4HxqTAHds4AYkNcJ1J7nTbokUvcJuKwy3KJ95VN1cQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VgJqY7cN4Tr7nUxikVAk0v6byXsBSr6WC5bEwq3bXXmBvmQSIrtY3rOj3/u8iPQ+3
 2sHIOHUCZO8uFi3UOOd7dy+mPRctx6/X+XLwVJpaWvXbznUvBhYvW6jAiyRaUzG9Me
 ZsNYDstuJQmoNl3q/GQ55rb4LDLS4gsnwpBmiVL5PzP2H1Gublj0/TGAmDVvsmliw4
 kmsc/aCQrHEl0D3K/KuftDwwQFbsSUWUW+Dge9NDS/2a9CoKFlcqZFQxqXPZq1Kyrb
 ZJLwM+NU2KcPYw7JFgh9vzyWjHzzHi4aJxsMtv47NP6arGsLRyxMJJmLIH6lxFAWVU
 XgVTNH2EzEjEw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2C72EA0072;
 Wed,  7 Oct 2020 03:05:40 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E7706400A0;
 Wed,  7 Oct 2020 03:05:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sLkmUiHu";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkbdO2pVjmqVE2dnWNKuC2tBDFDmiR6Mara0FbJrE/u+O2s9DtaDi7JHHqlY2m05uqLiVR6cB/RakLfr0/9Pacu7vWyngkH5StuZoH61IwrK67NOKDQheXZCR4051Noi79AGxXYuvKew+tiwsmPEu0S7Bdyqve7mgdgz7Q/iBUcGDBFD24oqbWL+IJcK0KncDY4NPXcMon2RfaNJd8f5y1zGqEHbLg4fafQk9y2Yn3lfpDZcYXM3T9hvKv2KdcALgTeia/NdL27bTPVK1Iks3NwJ7P7vanYjLD5t99uwDE30+F/HXxyVd8TOv6+eiIRtLQVj1D7oWajlMY0jzNpE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4HxqTAHds4AYkNcJ1J7nTbokUvcJuKwy3KJ95VN1cQ=;
 b=dhj+9qck2I4+EOupwT7V3oF/JEat5QwTyr7dVLe1b7WepA+f3fJTU8a8lH2JP+Rn8m82EGGs+7HgWpKXy5B9pTaU3FbQ2WmKpveIYxjTJ2wve+WcUGeT29G4/FGjR22hqrlvqYmr4AuM9Zz/MItLyngWQYXaAJ368Ve5SexqGw95ims1l+NnPs7eiR9VsKYBKZilvQVSqBtazAhb10fC6LCOtvWjHDtC68quSwhCjzLwHWVuyZjUfFDJp91MBckeN8VBaep5DKg/5Ceugx6PcHJcvg1RPJ975lW0lr/EEAOoK6UX8wyfrr8fq8C798bAQ/RZyVTnl7ce9GQb0tx7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4HxqTAHds4AYkNcJ1J7nTbokUvcJuKwy3KJ95VN1cQ=;
 b=sLkmUiHuBe2ucCKU1IgTNicqrAdQg9IxmwaDaMpJQ2IYeeq4J4YLLwriwnOHbyTgLEtKuHVcmc98YVchmeLR6nJY5W4yHxLx3fvbxjJWsvX7D7+FFUhRftl/DKye6d/AIRo1oTg9OA0TJvteOqIU9KUTE77pTwZoZ6mIBehkThs=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2902.namprd12.prod.outlook.com (2603:10b6:a03:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 03:05:36 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c962:6a42:6a0b:24e8]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c962:6a42:6a0b:24e8%5]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 03:05:36 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] fs: dax: fix build error on ARC
Thread-Topic: [PATCH] fs: dax: fix build error on ARC
Thread-Index: AQHWnFU7PzDuJSEnVE6qtcjj9Ag3XamLdMiA
Date: Wed, 7 Oct 2020 03:05:36 +0000
Message-ID: <b54c3124-5052-269e-cc03-8f0d6588fada@synopsys.com>
References: <6b5c6090-331d-7485-da4a-45e9c7f13be1@infradead.org>
In-Reply-To: <6b5c6090-331d-7485-da4a-45e9c7f13be1@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d82e588-dd2d-4371-2d27-08d86a6ddd35
x-ms-traffictypediagnostic: BYAPR12MB2902:
x-microsoft-antispam-prvs: <BYAPR12MB290237EF4BD7DCB6C51255D9B60A0@BYAPR12MB2902.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7JV7rgNa6T2KC5CotcuFBHi4dTEppkYTfQuzG/dQ+ysUdLQW0+NKFUkljbEwv8UDnLXGQQNU0i+NEUOgK2ouqIBmhjvd5w9lM/cj6NFzMhxaxekY1+/At7wKXAkwvDRr4+OJU/tlfSPmt/OX4KWKJyzBQfew461rAwuP+K92VWto0m4Vlwg2n2u0RU53JMlY2MPL7xuPvl9SAaoetchaj+9UEa/nv0cTfE+ZoPojjMbxY2qyQcxH3aQanyYmvhUA4Hg6mH+gH1qj7b+sXiuYqyxpR5m12ptByjmOvdiu2ATxkaUxK+H/P1qTktP8CtuOYtaIL/AQn/WvlHwyqXO0P4mGjeERy2om4x2NR//1htkOqoXpyRAUDESnyyqdvflf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(26005)(2906002)(71200400001)(8936002)(31686004)(6486002)(83380400001)(110136005)(8676002)(4326008)(36756003)(76116006)(66446008)(6506007)(316002)(6512007)(64756008)(66556008)(66476007)(2616005)(31696002)(66946007)(186003)(53546011)(478600001)(86362001)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: J0ZidKyPW6ZNI5PivyWid6zwvsU3y8WTHRokKj3tAkGiqG6syNN1YglUhFkHRUrtYeAHOyxo7zQxogUfQ9+4MIxX1uTNzNAsWtij9zTMTGYSzimmsBvzFFAgNds7S80RbjoKAG2BpnhJvVBFUsv/jlAZzQyO344kQF29TKMQl0K6TwAli1j3bF956FnATzRH+ZGiGatbRYkJUz7oVmLUPIywOUlkRM01h10GRvK50OiSTs+XuVTn7kj0MXm2iQxt75L9q7DlV4A47i9ZcTpAgPiBeYq3oX7A+MCJFOoZU63vAA7FNkDvy6al5HMcfulsFay+miTMt/CH8m71UljTq4hoz462gMrhVDoO5d9x7a7/3urerQnBRoHltGvq2n/oY6W/G62Y7ldYiivQQrpB9uXy1+iYErlsihdzqte4STnrxEKEZw1zbl94Fnc6tMWELKvVzm9gCprXluSuUvPKaiYvmR0ecDWocrn9XgMMPPiLlMOJRpkTqoZHAdL6v6TQrJhaxxwseDL7zh88sPuQV4L5IogPEP9tr129s9RLD3pcaMp8DndcWJuQb1JFBcdzqe+lFnTZYgLcC1ldNQLnrAAFC3vt/6QTD/6gkdiDyeCSHTuua8Mi596pzMMDoqdyP+xc9Rl8wN0GjVeOGI0zJA==
x-ms-exchange-transport-forked: True
Content-ID: <AD4E279430298D4A8F639273E3ADEBF4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d82e588-dd2d-4371-2d27-08d86a6ddd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 03:05:36.6605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KJdUSTpGFWbm79XwcL3rCygHlXrgLfazOJZFvo770vze03ZUJbtHaR5whs3wdxl8AiGEO+hz1zkqlPIE+puzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_230544_349524_FB27492A 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/6/20 7:54 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> fs/dax.c uses copy_user_page() but ARC does not provide that interface,
> resulting in a build error.
> 
> Provide copy_user_page() in <asm/page.h> (beside copy_page()) and
> add <asm/page.h> to fs/dax.c to fix the build error.
> 
> ../fs/dax.c: In function 'copy_cow_page_dax':
> ../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]
> 
> Fixes: cccbce671582 ("filesystem-dax: convert to dax_direct_access()")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> ---
> Vineet, This patch fixes the build error but is it correct for ARC?

Yep this looks good. Nothing special needs to be done for user pages on ARC.

Acked-by: Vineet Gupta <vgupts@synopsys.com>

Thx,
-Vineet

> 
>  arch/arc/include/asm/page.h |    1 +
>  fs/dax.c                    |    1 +
>  2 files changed, 2 insertions(+)
> 
> --- lnx-59-rc7.orig/fs/dax.c
> +++ lnx-59-rc7/fs/dax.c
> @@ -25,6 +25,7 @@
>  #include <linux/sizes.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/iomap.h>
> +#include <asm/page.h>
>  #include <asm/pgalloc.h>
>  
>  #define CREATE_TRACE_POINTS
> --- lnx-59-rc7.orig/arch/arc/include/asm/page.h
> +++ lnx-59-rc7/arch/arc/include/asm/page.h
> @@ -10,6 +10,7 @@
>  #ifndef __ASSEMBLY__
>  
>  #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
> +#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
>  #define copy_page(to, from)		memcpy((to), (from), PAGE_SIZE)
>  
>  struct vm_area_struct;
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
