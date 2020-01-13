Return-Path: <SRS0=AvZA=3C=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF62BC33CA9
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jan 2020 17:48:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B77207FF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jan 2020 17:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHvD6BBD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VxCJJ1m8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Zz562H2C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B77207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyuHcadryNUK1xrTN/KyDYFpNGk7FAXL1aBo9tKZBhM=; b=aHvD6BBDKFDvag
	VBvqrO6rRaQov3Bv42+o4kf8Z1UscWzRp0ifjVMsZ1w0QH1PtG/8AAFFwEVo5PFbKp4ghEqeZzFlU
	K+krGpmuqhuuxgY4pCF/neMdc53O5LwjJs9sJPGEeIuUOa1ZTV0jLSZD8xzPW2NcCuxVjUYrqJ973
	btQs0KoHOnhmwzbeqI4hilgIriQvgv4nZBe1pnfRp7J+GWbo6uH0B2R1LNo0TBwrFglQlcYB8EH4h
	BtiElaI/7MAx/Mg3m0F4W03tJHqqGm2JwFsBym0JDy8XWN4TyPEV5mTwpQJ6IJ85JXpvHNXGOrlQM
	XIHW+dVi1dQWS4kzuubA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir3pR-0004nN-1G; Mon, 13 Jan 2020 17:48:41 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir3pO-0004mi-Rg
 for linux-snps-arc@lists.infradead.org; Mon, 13 Jan 2020 17:48:40 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC9DFC05DD;
 Mon, 13 Jan 2020 17:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578937717; bh=SgfONOjE8Fyh5NpLq6j8jNfDREZB9lckuzsakAXlDew=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VxCJJ1m88sBWx8pm0sdvj0cLpNltRFZGXnBOCsjtsYRJ8xzSItpojJwM2MbAUd6SS
 BxjhKB7r8VhcA52bS838/Gdujbpct/BolnDoXPESuHrTeUmCl9eLOGLoxfBT9KfiIH
 UwrsmGkMew5A/y351N8G/KI49as2A+0Jl1Zebj30XJZ0cDZ0dmCDtz3CCzMh6ZtgUn
 o/PrwBfLHFTyCw3vPhrvY+BTHjSYmsf5L+VtRXlzffMF1Spl7eRx6NbxspIT+XkCr5
 Nqr6x36lUhH1/fbOZKOEPpDluje2pBtzo/7bkDJzvPulLJy/y/tf8mZm7cui/wMctv
 Z86Tval1rgkcQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 16194A00B3;
 Mon, 13 Jan 2020 17:48:35 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Jan 2020 09:48:35 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Jan 2020 09:48:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ5AoaLSoBncJCx6e8FCsh1FIbQWsTTvOJp7HrIH5GfqklC2I0SgweLuXffhNYzy3O6SCUc+m/BiXoiuJKEBbqE8z/NFozXE72i7VO9vTsBy91BbNlXxxJgJ9FPjN2DLRtsRAl/Ped6IvhNTHZ0srA8m8L5ijSeX3bA8Sh6gwP2JLWFzXfspvs0YkziaFm6AYp0oVnpR1E5st/3MgwgtV7gnhQwpAKGr6nuaBkeskrbNIUWEW6m7Rtx4Sm5g3LaymfBCHUR6707ZpYTBqEZxT65rk0F5f0d8zNAT9K3QJ3JwjRnvvc5BJBH1EUkcTJf3Ra2y21Gp0P+ZYRrq9nGGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgfONOjE8Fyh5NpLq6j8jNfDREZB9lckuzsakAXlDew=;
 b=hGLVoCvdwXFHEPYVPdJzd/SkOQDOgpx+GGInnhk5GPPgdHi521vCsYN2my8uX8JWFUnFtrfBQDNdPcsKldyzYjyUJShdI7rT4d7DgoiZEJGfAtJgX65TRjnzfQYIOgCjEtFxQVg38UXUESc9PYGTgOeDu454UJyJVh3YPLWDseUJqTxlYIEdzQAKevUDnFfAyag/6aiRj3yduBRYPKdiFm9Xi2EaI91V97RXx65elf74xR9xgPSReKCIdmDFQu/T74OzaTnh7RK0p5JqKAI2Za5ep0GmIcbRBx/rAsoYcytZpxdWC1Hz2Z+pW1SGXilofxqPGtW25zL1DLsbLc3o/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgfONOjE8Fyh5NpLq6j8jNfDREZB9lckuzsakAXlDew=;
 b=Zz562H2CFpLDj57k41lW0SW/PWAs5KqZPyE8DnpgwtOqosfLAFTWPtzDVqWR8/MuttI6CFdEzuzZtOylRfBHkB+a4J0XueP5mWyUeHPm2rIkobHn57QCNALphYJb9CjWngD7tp0Sql7kmFWB2ZOUyoT9Viz1ypSuaU+pWdXmrWg=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2743.namprd12.prod.outlook.com (20.177.125.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Mon, 13 Jan 2020 17:48:34 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 17:48:34 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2] binutils/ARC: cleanup
Thread-Topic: [Buildroot] [PATCH v2] binutils/ARC: cleanup
Thread-Index: AQHVtSGs38UNztCKG0uOj35vXBRGOafGtvEAgCJSJoA=
Date: Mon, 13 Jan 2020 17:48:34 +0000
Message-ID: <585b63d8-16e1-4891-fc0d-8121acb59a73@synopsys.com>
References: <20191206221918.1c05e316@windsurf.home>
 <20191217213253.12446-1-vgupta@synopsys.com>
 <20191222224144.38603994@windsurf>
In-Reply-To: <20191222224144.38603994@windsurf>
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
x-ms-office365-filtering-correlation-id: 2a08c5ec-141c-4393-9b0b-08d79850cf84
x-ms-traffictypediagnostic: BYAPR12MB2743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB274317785262314958D5B182B6350@BYAPR12MB2743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(39860400002)(376002)(396003)(199004)(189003)(8676002)(81166006)(31686004)(81156014)(316002)(478600001)(54906003)(5660300002)(4326008)(66476007)(6512007)(6486002)(107886003)(66946007)(76116006)(66556008)(64756008)(66446008)(8936002)(2616005)(36756003)(6916009)(86362001)(53546011)(2906002)(31696002)(71200400001)(186003)(26005)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2743;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M0IzSef3yrooNE76W/WvhTRBATE6N5oP6hNdOe7+yU9/yDhnr7riuUfXNi2MGaAZ8Id6nfoAVffds8DyMi27DnsCPzKUwgKTqO55H6LcUo8GIakHsZl/J6zWGOiwDkguzP8h51mXtkjO3ZCAmjYBXqOFbBFMkZkeECiNsnIcEDLMxdeGVavY/UNlI+VV/QlVt1An+rYrC6YCI97K6S3xq6nEultwRpO5LJ60hqNwL5VhCG6J8DyTw/dkUZKQSAGNAdvHUnJIG9eQaf1cOn0g7mmS5H8wv/vljZGFhC9mYPuybR/1zOfR2gDwQXaKMs29ElDulKUckQt5z6o11EdtFxbm6ExNx8PQOD7u1M0BeVs+d7JbSPwCBCiyYINp1Sh93O9KhFW3JKXIRNTYJzlA1aSCADGQzT0Pma8BWHhDqO2ehVjw4U7TanODbYbnckNg
Content-ID: <8A5ADCCC17F08941BA1AFA6F089A1789@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a08c5ec-141c-4393-9b0b-08d79850cf84
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 17:48:34.0815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vk00YTTF6DQmLbqZ2Yg7IVN7gLtReCHtrTE58Z2fxvqTQDO/2mtmKTSjHCNR2xenLWF21oUt27CPidActH1a2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2743
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_094838_966458_8415CE0E 
X-CRM114-Status: GOOD (  20.54  )
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On 12/22/19 1:41 PM, Thomas Petazzoni wrote:
> Hello Vineet,
>
> On Tue, 17 Dec 2019 13:32:53 -0800
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
>> Remove special handling for ARC - as it is not needed for cksy etc.
>>
>> A nice side benefit is that the ARC specific version now only needs to
>> be specified in single place (vs 3 currently) in binutils/Config.in.host
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>> ---
>>  package/binutils/binutils.mk | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
>> index a19d6940f7c1..3ae5561d67d3 100644
>> --- a/package/binutils/binutils.mk
>> +++ b/package/binutils/binutils.mk
>> @@ -8,14 +8,10 @@
>>  # If not, we do like other packages
>>  BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
>>  ifeq ($(BINUTILS_VERSION),)
>> -ifeq ($(BR2_arc),y)
>> -BINUTILS_VERSION = arc-2019.09-rc1
>> -else
>>  BINUTILS_VERSION = 2.32
>>  endif
>> -endif # BINUTILS_VERSION
>>  
>> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
>> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)
>>  BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>>  BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
>>  BINUTILS_FROM_GIT = y
> In fact, I was wrong, this also does not work, in the following
> situation:
>
>  - You're using a pre-compiled external toolchain, so host-binutils is
>    not selected/enabled, so the version selection in
>    package/binutils/Config.in.host is not used, and therefore
>    BR2_BINUTILS_VERSION_ARC cannot be set to 'y'.
>
>  - You have binutils enabled for the target.
>
> Then, with your patch, we will no longer select the ARC-specific fork
> of binutils.
>
> Basically, for the target binutils (just like for target gdb), we don't
> have any version selection, so we force using one specific version
> depending on the architecture.

Does that mean that other arch in that file (csky) with custom github location is
affected with the issue you mentioned above ?

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
