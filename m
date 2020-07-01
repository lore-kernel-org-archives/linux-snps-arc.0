Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F5AC433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 19:36:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F092082F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 19:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0TGhJuV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e5WsROUn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="weZeyHhq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F092082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k+eIRTd2CmKq+j+QkvOnzGZAGf5ITFYCdWMBTJyFFDw=; b=u0TGhJuVWejbqlkCW9aTQBvKI
	KHP9C7VKYZfCbXytNkxNIF5TmLAiKWd+Zbbia2QcPOvQg2n7PhK1iExHktc9+4ASR9GyZgj9Sqbj6
	oAdF35XCzwduCjU8AFbhniE4AL7ZZk+1eKhghvrVRpQlvD9JL9My2LltWFpUBH3OFvCs+q99PDjzw
	/X0NLkdeJKZgfPbIWGB7bD/g3wTJgUVb63CUZshmNzCt0ihfUsqtl8bxaJkVEwp1abGRBAYUWxpyB
	cLjlZG57pwWtpj2crzmjauZ8LiAB5UhLzMlpCnn6e0pUo6hTMVp4p7ytkuqxw51cIaWe+sTr4bpQa
	uP2+54wgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqiWq-0007Hk-45; Wed, 01 Jul 2020 19:36:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqiWn-0007GQ-Fi
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 19:36:18 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 37134C00F4;
 Wed,  1 Jul 2020 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593632176; bh=x1SBkcL2mqjG0Xg1f3moMGOIqqOD58p9AF+Xw+QNpas=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=e5WsROUnmsYHG65Xm1oLI7WtzZjCxchjvuQ0bUNyhxCBYBovt6XnHxZRuuGIAlDNE
 bHCnFSDOyCY9s9ktN8MhIy81FxvT1Amb6FLyl0v9w0ok5xgj2BO8RtpK8zYmILKguK
 ECXNBaKjRgQB9C6AqiiDE4Q+i7RBsDIaeczkAaGCY00/KNm8hPPtqqqmqBTl24EJpy
 1dxI1DL06UeawGABosPQtaP4L1p44BuAnQ51Kvwvs9dH1wtgQFB2wpieFIgL+Zr3Jm
 2T36nuyExOV+xscbgovqDW/iKrFBXx3AT2QJaJiHiN6AEDtN/d6BGRkA2zldTCzzFm
 aO43v2kC0M/8g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 06AACA0057;
 Wed,  1 Jul 2020 19:36:16 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2055.outbound.protection.outlook.com [104.47.37.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7D1F280056;
 Wed,  1 Jul 2020 19:36:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="weZeyHhq";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWe2KkMWSYsW4W1Qy+aWyvDffy8Xa7CSZaEtCuHtds0AdmzLwXFpYuHcWF2t5VzlNb6DVQ+QMR6J5KmQGevs/xeEweab/gl1EfB6ZUaiMFOk3aw1Q3GrM0e10DWNVYWjruAYSZgZDt9cTsqmxH9hg80aJINyvXzdlwE0AL2i2k+DJ6+NJxLHxtKSvjJMbXCgD1gc8rjUy0JijsYlSc2FC9Y0QdaKY1VEmvuzxWaTC24Y6Mbq+luI1JTbgqmfMPWQbh1Jldin8HknPIp9405ILHua2aEU3BzXIjT9AwiuaHuCFDKTaB8N41sFqzn8X8dGGuQe57K80ddBghOCW6LBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1SBkcL2mqjG0Xg1f3moMGOIqqOD58p9AF+Xw+QNpas=;
 b=cp4Pjc03l+D/B+FZb1WialLktupDgTjm7v2ybO8RJPoVGBIyMNE7Xdbg/DsCTkcJKg16JKj4AUsRGPcCL4ai98tvu+ZRVyUZFNctengk4ha5xXUKtUm8l8zkwGmjN0cvl6VbGkchXnvHGwQ4nt5BwfSicVoPwB3sy4EKl5nTVp8pyUdrJFs9oVXvYOioiqb6Y30pAzkthWnWFr48R9eJzgRkRmo9N2mPXk8ZnNx5IOBF5+dw3O+j2hMxWD56dxzWMMA+6zpXDvb09YXrWdoTbjXZy0zzjEe2h76uuDjJvfmch1gGc4RGiTkHmcYbw57XmKQnWaD3ZVXcBY8AiZx/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1SBkcL2mqjG0Xg1f3moMGOIqqOD58p9AF+Xw+QNpas=;
 b=weZeyHhqzKNClptIo7s/eFTjylbcKxX9O+FDdWTHiY5w/TOCGL98QGInDY6CV17+N+A4fsI9pD+XEvpof6Cmdic6hkhVdN1RTC8+wdt/pbCxGyYNEJ2GTOUdgjXEUpBGUR3NLQ+taWZnc4DGgjvO3G381uLZvwVsP5f5Es31rus=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 19:36:13 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 19:36:13 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.1 01/13] ARC: ABI Implementation
Thread-Topic: [PATCH v7.1 01/13] ARC: ABI Implementation
Thread-Index: AQHWT97hjARp93MS2UWDiibspweUJQ==
Date: Wed, 1 Jul 2020 19:36:13 +0000
Message-ID: <96a79297-9161-89a2-25d6-473979525367@synopsys.com>
References: <20200615201441.31820-2-vgupta@synopsys.com>
 <20200701000643.14065-1-vgupta@synopsys.com>
 <b6322150-240a-5f06-b700-83e3eb79deec@linaro.org>
In-Reply-To: <b6322150-240a-5f06-b700-83e3eb79deec@linaro.org>
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
x-ms-office365-filtering-correlation-id: 16fbde5a-e5bf-4ff1-0c0f-08d81df60401
x-ms-traffictypediagnostic: BYAPR12MB3592:
x-microsoft-antispam-prvs: <BYAPR12MB35924D2477453D2520DD2F97B66C0@BYAPR12MB3592.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pHim7rMzFHkSOB75R3jjGKPLXhftXkWJqBmOKYh3U4V1yUv62O47uo/Chs0qLqdoWX/gPEY13hnBt2KBwjEEm5UxFR9BZNt8zQEe9gmQB9YSH4zcHGAc5WCSOUv78do3JEVRl0XWWRCz6b9LUWm9LUJPk5+DlryBHeOJ0REMhJsi6AyrSVzPGLpTZ+GEg5pAzd0owWiuZkBI7sx1Q+JIuCjOn2XTW3HnMGQj+UPKdsoH4kGME40pndUgdEEE7gCViPl8KmC2XSgTd8MZP9bxTUrZikuiEq7Rm49ydnnVaDlb/tRYPpuSJv4R1NYPZhVPeDMB+THa9hc/9tpdVcqSIHOUDUozl2gPC02OfZzWuxy/lSA0wxam5vtwP8ruHUT0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(39860400002)(366004)(376002)(396003)(186003)(53546011)(36756003)(478600001)(2616005)(66446008)(6512007)(66946007)(64756008)(66476007)(66556008)(76116006)(4326008)(6486002)(31686004)(71200400001)(83380400001)(5660300002)(2906002)(31696002)(86362001)(6506007)(8936002)(110136005)(8676002)(316002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JaCd35L6Y9cZl/S2UAED+wp/1Xcq1oowvgFq/it21g/YrouFpTq9ZuKG6JDH1PXWxlweyt+VGUvbWaLzSt5dzYVCnHwhlOfIqLLUZSMuhAorQz+VCpW/8NEK4Xc6yFPmqwjADCm+CNf0ByRTpURvfpbFrTRae3PKnqTGtx9LaT5nWnw1sI37RsY6Dxt3HDCojvYIFRzijkD2C/08cYjNxnnRwt+9PydQ93Omo/TrMWfM+h6bbUTWgsxrm3QLaErqbSv5b0D+HzC85Izrqwq/G01Y9v2MsE6Czymranr6YKZG42PwwF56uP8WBurvctnkAhZy9nE+PR5A/ILvffoEz4I9EUM5MwAetibDO8wL6IT4Z87eKsnjt94vik9NaGW41Se9w4hRQGPtzEJscXU4TNGRMVyxZ3bTF0Yw2m2lUnzHfHwOUj7A3PeEvYnhWOIWjjG9GKe8w8HKqfyWLeF+/UPHGQxD1uzamHh426IBfu4bGJnhYjdOqXYifypO888O9PIQy6R+a8vKDvqGsufSmQTZFwcAtgmv7Wn+bjZOUoLJUGnxhBtZIIExCtzJFhxw
x-ms-exchange-transport-forked: True
Content-ID: <B8208F3458683B4197A979DAC3EC7E0B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fbde5a-e5bf-4ff1-0c0f-08d81df60401
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 19:36:13.8133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dE1dDQkWKSgnU7+rxurMzGyVzL85tw61uk+KqXHIs6NaayYx1N9puf24s6F9mz1cYBmlT6iPGXYt2Rt3B2kAcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_153617_817271_98263065 
X-CRM114-Status: GOOD (  17.57  )
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

On 7/1/20 9:50 AM, Adhemerval Zanella via Libc-alpha wrote:
> 
> 
> On 30/06/2020 21:06, Vineet Gupta via Libc-alpha wrote:
>> This code deals with the ARC ABI.
>> ---
>>    Changes since v7:
>>      - Used void * (iso int *) in tls-macros.h
> 
> LGTM, with just a couple of syntax nits below.
> 
> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

Thx. I suppose the process for new ports is to have a Reviewed-by on all patches,
squash them and push in 1 go (although in past I was asked to push the ARC elf
header patch).
Also do we need more than 1 Reviewed-by for this to be "push worthy" ?

>> +ENTRY (__longjmp)
>> +
>> +	LDR (blink, r0,  0)
>> +	LDR (sp,    r0,  1)
>> +	LDR (fp,    r0,  2)
>> +	LDR (gp,    r0,  3)
>> +
>> +	LDR (r13,   r0,  4)
>> +	LDR (r14,   r0,  5)
>> +	LDR (r15,   r0,  6)
>> +	LDR (r16,   r0,  7)
>> +	LDR (r17,   r0,  8)
>> +	LDR (r18,   r0,  9)
>> +	LDR (r19,   r0, 10)
>> +	LDR (r20,   r0, 11)
>> +	LDR (r21,   r0, 12)
>> +	LDR (r22,   r0, 13)
>> +	LDR (r23,   r0, 14)
>> +	LDR (r24,   r0, 15)
>> +
>> +	mov.f  r0, r1
>> +	j.d    [blink]
>> +	mov.z  r0, 1	/* don't return 0 to setjmp callsite from longjmp.  */
>> +
>> +END (__longjmp)
> 
> Ok, you have removed r25 save as pre previous discussion.

Right, and GP is being saved now.

>> diff --git a/sysdeps/arc/bits/setjmp.h b/sysdeps/arc/bits/setjmp.h
>> new file mode 100644
>> index 000000000000..6bba95fafe0f
>> --- /dev/null
>> +++ b/sysdeps/arc/bits/setjmp.h
>> @@ -0,0 +1,26 @@
>> +/* Define the machine-dependent type `jmp_buf'.  ARC version.
> 
> I think current trend is to just use apostrophe instead of the grave
> accent in such cases.

Ok changed.

>> +reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
>> +{
>> +  unsigned long int idx = pltn - plt0;
>> +
>> +  /* PLT trampoline is 16 bytes. */
> 
> Double space after period.

Fixed.

>> +#define _JMPBUF_UNWINDS_ADJ(_jmpbuf, _address, _adj) \
>> +  ((uintptr_t) (_address) - (_adj) < (uintptr_t) (_jmpbuf_sp (_jmpbuf) - (_adj)))
>> +
>> +/* We use the normal longjmp for unwinding.  */
>> +#define __libc_unwind_longjmp(buf, val) __libc_longjmp (buf, val)
> 
> Ok. As a side note teh jmpbuf-unwind.h is candidate for some consolidation
> (the same macros are replicated in each architecture).

OK.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
