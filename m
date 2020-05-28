Return-Path: <SRS0=radI=7K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7999FC433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 01:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B1820DD4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 01:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MU4moCsP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="btxAfVpB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vFNeIfJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25B1820DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZftMy6by/brkEXw+quJNzRtEC7Oz2dggLQB5UbeOhE=; b=MU4moCsPvW+NPx
	HRrR33ywdeeh8UGA4+W3Vw6e0A4ZhlEEhusy4RZkndUniivcs3EaveSbmus15jyFG8/xYdCDFbgWx
	VQhFHaDkj8lD8S+XXKAVetCoLgdKPXUSZHwR8QJwUSmEHrKenq45mlgTXhfkaCV3+abBFdu+FrJ8x
	Q/RGc9K3EJjvVLNzhT2TUJCj71aT0Kcu8xKUwA6RVTPOgjxqYytbggmkXD2difBcw1MlA/g/H0BBp
	2pctp3DVlLHKQXHX3gHNW/V89ydYKSntjZapT4P1JDyghSGk7FyOOeFXnhT/Ve8XOJeckiiXjwLoN
	ddRjR++ahMJ6qBaPnvCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je78O-0008Ar-4J; Thu, 28 May 2020 01:15:00 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je78L-0008AK-IO
 for linux-snps-arc@lists.infradead.org; Thu, 28 May 2020 01:14:59 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 44E73C00A3;
 Thu, 28 May 2020 01:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590628496; bh=cZL5rScSMCaMyt2Z3rZYqjyuwArOKqAuqWRltrwPwbQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=btxAfVpBAo7cVcW9h+WZzA8QFMY7y/eY+pDcJxHdvLPcFVbo2V/QWr4DocAW2a+xl
 lwEuJ9Fq4KDLUdlvCsDgsymAuoDpe5wSpGyX2Z1rYQ2wPHkNScf095hNgyYehbj3Ok
 j4PfXrRPnFmc356wBAhoQrwAcDlcFlLzHQnF64XLqqzT8MkEO5zikRDsX4PjicvBYw
 nZmCelahN7its0cUvowTBod18U8024vxYNaWJ90OPZ55XAQnNLQrFOZ5DGFLdkrmiL
 dG0Kux21abM+6s3WaI9pFwhEg0/SL0/JD+OO8jjDyubZ3U6VREkui5fPp0tE6ySmYW
 ecMIHzGN3Qb5w==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id DD74AA0079;
 Thu, 28 May 2020 01:14:55 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 May 2020 18:14:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 27 May 2020 18:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCfWnfZ1Ry+5AwtyghGMzX5epKOIQDa3IyW1uYlaAB+w9hKb2G5+scAbru3CLCqrjDcTAh/iiMNwlRXk+xo5Czp7Kp0mwGBtp53PCAfcCTyzYwN4Sxms+gbUJYjgciM4KaOSkECFCx4/sv2A5GhKqhs2im+vKINXt51JJszGA8st+McZj1TEphY2TDhSRIsetj6cUuFL3zQ3YfFDW/pByQY1TOVyKx92/JnYylaV0Cav7wCSu6OKaFvdhbXKxRp0m+WN8DImKnFDE0vjLqap1m2uwLw9az3DY4jG+RJy4myUgytMCQZihJYEcuM0dK09ntuzwBnYuMHNkzyHgay6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZL5rScSMCaMyt2Z3rZYqjyuwArOKqAuqWRltrwPwbQ=;
 b=YcpizweRoX0tkk3oercxFfFRj/cXSfs3glPPi6fIpLOWA4QpF7uwOeDpJ0X+gWGvlEZ0IMKzrfhpgxK3UWqFvRmx+yOoA+I2QuM6lU7tBAfxoN1KvghlR6RThE66AMNl1bje0FZkdYFqN42hk3ThJhT+DZQ+Cx9cvT1aWQGbRrzWzaMJ6Ka+ceIQY1zGJQnWmqraX+rd3DSh4/17wKGhWGktZszcAe/1f1TYhLW/QRfwyaqm6bAvOnB6L5KcvW4UQDG9dKMP3MAoMUIEQNySiX2jLR7uq2yoZEppvLtyH3ItI5Cpoj3RUAd4yIf/B7K3MzMfOUON6z46y77EP4qy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZL5rScSMCaMyt2Z3rZYqjyuwArOKqAuqWRltrwPwbQ=;
 b=vFNeIfJcH6OUCXdHJLmvssnTTibKeKADBmcSd96DEkrJYnm5NpgeIZJsAjXLNUjzN9otjLLRmSVH8p1Ep8Yg30lTXH850/YrKvLSYoDrGAPNGR5Lb09IGIW44S/aonEkKtLUjodem6KFv6hH9sHAAwGuDs2+6OnPZrLQ5tIjv9g=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3430.namprd12.prod.outlook.com (2603:10b6:a03:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 01:14:54 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 01:14:54 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 02/13] ARC: startup and dynamic linking code
Thread-Topic: [PATCH v6 02/13] ARC: startup and dynamic linking code
Thread-Index: AQHWNI1k8jeiy6bxSUC6q/y49ea8pw==
Date: Thu, 28 May 2020 01:14:53 +0000
Message-ID: <944ad055-d2c3-f0cc-3f07-7aa5a3ea163b@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-3-vgupta@synopsys.com>
 <17957ee6-2bc1-f43b-f184-f0703ba2765f@linaro.org>
In-Reply-To: <17957ee6-2bc1-f43b-f184-f0703ba2765f@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd74160b-9ec9-4015-8ebf-08d802a48742
x-ms-traffictypediagnostic: BYAPR12MB3430:
x-microsoft-antispam-prvs: <BYAPR12MB34301AD486D853A40C893E4DB68E0@BYAPR12MB3430.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MgHA2Xuw5eKc0sOq8CyiZKrmioiGomcB8LGcMLcC8Ay7B+hNNKtTwsg4z+LMlrLvvr44YGwEfnnx/hd9/v9ktZBmjp+lEWkjNiU3lJGywmFKaXjLlEkW89mVV4wPxEMY4YxO+fWc2ZQqJ5aD3VcxdBifeVzKYXu11OPn+5bZYfCC5idCayLmIn9rx8Mfd0WHqNPCXnMh5mvSZ0qDhFsAXKGnk4jYZNH+vhCW1nRfCeC7DsP7B0Ba3kZPulM6PLgBwFECy4lFPbPcz9tqTbubxr4Y1bVUiQL4/+VRfUab5m2t7jXkppQuGFd/x8Hxi4VS3y+N9gLIn8hXfWMkabOBYjGddUBQ4HT01Vt36P0/tRjx8sIF5GCp5abHWqOaqcK7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(396003)(346002)(366004)(39860400002)(186003)(71200400001)(36756003)(5660300002)(8936002)(110136005)(64756008)(66946007)(478600001)(53546011)(66476007)(66446008)(6506007)(66556008)(2616005)(76116006)(6512007)(31686004)(6486002)(316002)(2906002)(31696002)(8676002)(86362001)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5YFOMGwOCAiStYKiScKLUR3Z2sE7QfAnkFizqUGlS63iZpnMMHySDgW3ZJxd6jndm3xicmKkFGT6G9xIqxNbhd6OEc0kjB2LZsqhWpMX/UroZCCy1xMMZx64cZs37dZucbaLUuTjCksJYU5pdJJ9CD5Rv1uH+q47h0fXtUk9Z4SqLw3IRnI49LKT0SmFYeZGg9UMRr/YO8/UUF/XNjri7bunsgOpRF2KZ9YRbijTQ7aFBZRKI7xODROMTmwVS4LZYyNA71MaohJ3Ar1ZMm+CclM3g95wRfoxxJRx8xc0QJizEjrSCMgxQmTbCKkNN2X/zGC1vWr8L9/YiZ7xfqG1xrTWgFTRSSYhoPpZ/p/DIBYRUQJDWwyeF2iVLsRPJx1xV+cN1mcfrpOZeOCFqRNUpZGwJS5qSL60pKX0CZHlpDQk1tB9ENcsdF0H/aBFElVAymO82Yia78NeI2m4/GagkJIrvA3FAVWINxZjwoxJeLMaMkU0KSOXTJju1yP11FhzQi5QzP82cM7GP/nXuEkP1fDQBudkDPBsKMXp6ZN/p9i5UxqkoFlsuI+J7PfsyV4E
x-ms-exchange-transport-forked: True
Content-ID: <CF6904860D0A9A44B9036A08F08CF5EB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd74160b-9ec9-4015-8ebf-08d802a48742
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 01:14:53.8694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvIdIle/fstuhANUJ3oB3u+anADVCxl3BD2VdL9+7WKFyZSmCDg5S6ssoWYL3hkTEm2GG/xVZ/gGa7fQUvcPhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3430
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_181457_747514_1E1B5815 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/27/20 12:05 PM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>> Code for C runtime startup and dynamic loading including PLT layout.
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> 
> As prior patch we do not use DCO, but rather copyright assignment.
> 
> Looks ok in general, with some comments below.
> 
> 

>> +
>> +
>> +/* Return the run-time load address of the shared object.  */
>> +static inline ElfW(Addr)
>> +elf_machine_load_address (void)
>> +{
>> +  ElfW(Addr) build_addr, run_addr;
>> +
>> +  /* For build address, below generates
>> +     ld  r0, [pcl, _GLOBAL_OFFSET_TABLE_@pcl].  */
>> +  build_addr = elf_machine_dynamic ();
>> +  __asm__ ("add %0, pcl, _DYNAMIC@pcl	\n" : "=r" (run_addr));
>> +
>> +  return run_addr - build_addr;
>> +}
> 
> Why does it need an inline asm here?

PCL is a pseudo register and we use the @pcl assembler syntax to get runtime
address of DYNAMIC section. Last I checked the aarch64 style reference to _DYNAMIC
in "C" was not generating the right code.

>> +auto inline void
> 
> Do we still need to use 'auto' keyword here? Same for other uses.
Copy-paste thinko, I'll remove it.


>> diff --git a/sysdeps/arc/entry.h b/sysdeps/arc/entry.h
>> new file mode 100644
>> index 000000000000..adb01d981afd
>> --- /dev/null
>> +++ b/sysdeps/arc/entry.h
>> @@ -0,0 +1,5 @@
>> +#ifndef __ASSEMBLY__
>> +extern void __start (void) attribute_hidden;
>> +#endif
>> +
>> +#define ENTRY_POINT __start
> 
> Ok.  Why ARC has decided to use double underscore start btw?

Historically the linker scripts have had __start as entry point. Do note that we
use the same linker scripts for other libs etc so changing them would be very painful.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
