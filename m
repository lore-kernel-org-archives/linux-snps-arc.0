Return-Path: <SRS0=Cy1g=CU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506E6C43461
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Sep 2020 19:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2D9D22228
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Sep 2020 19:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lu/MxGYc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CadCJIcI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sipp6Q4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2D9D22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=grz6jRapbHioowbgw68e+MdeTS2sBtTudpYnp9CYfZc=; b=lu/MxGYcporR6xcU6CrUsWjUd
	lFXDtz4RFG6ejfQMxJJ55T0Ffk57RHvtjcICi3Vx+2n/77x73/0oGd4Isq88CgEeuUH0o2iSHKh4i
	cYUi4puPhVRHsVP3UFDLbMsJq7piPxoyUOy5ciZ8WP+x7SETKOhESEc9he2k1L/+qxELesRKJfXDx
	+wA/shbQ6MS6SP9OoYbju1YfQ1tLY2zptqPMKrw1m7tRCZA7E5fQJ7tefGVmiAuOHO0aQxJfDzf8+
	Ln3hm28aojeS168GsXvVsNpWZeWv0YhKP8JREPVN8y7SD0AjF4zYaC5LetgXstr7eam6zahMHdiYf
	JpOrbOoiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGorQ-0003YJ-P2; Fri, 11 Sep 2020 19:37:28 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGorP-0003Xx-3z
 for linux-snps-arc@lists.infradead.org; Fri, 11 Sep 2020 19:37:28 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE43E402DC;
 Fri, 11 Sep 2020 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1599853045; bh=d1nA6W2yKtuN9P6MY2MY0nosJ6duzbftofGk5wtaPzA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=CadCJIcIe9qyBujpUtyIn3z/x8jtZgPR+F7FC/Z8d2GZNB33OFxSKmL/0TABYOTql
 n2Kk1WnQE79TqMRkmxrdTswi7/Z6zwnQAHgAr0CC5JnFJyiEm0HuVfpC/uqfc3EleL
 auJhghDdJVrM1s0Mef/jDpsOOERoWwoX+kYylhG9/9qKnlCBnl1G7/mmPcalUI48UZ
 HcAskGqloWfDjCJAs9hmr3SZqMswCwOnjJXpXRvoESGVEzqIIrhBCIcSfwTkoCBdGc
 iD0fIJLw2nHfqh6gjBCWPmz1oai7v+TdHCHnmps0Fo2oY33dy9jwFI/hcvOPcgn7fO
 FUrffvh2DJ/xw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8BF10A01F4;
 Fri, 11 Sep 2020 19:37:21 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2059.outbound.protection.outlook.com [104.47.36.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E411E8000A;
 Fri, 11 Sep 2020 19:37:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Sipp6Q4z";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fj00HvoX1+e0AXpsj2EmYCuUwUCcmRfTRvetMSZYK5NkWMWz+wBhrcZbX9qfAnBN16MRRSWODGs3fOBGxLALwXoIz2fSljVE3C8TqccLwmjgWXC8klQx5TThnfZjJqSwmNcI+dSCjXJpjpBk7anTPOJBT1FO1QbHm0wjzrXz+yvPqiWM/Kn9xIeWNcuMb8MOVfZNscNjYwCo+Gr2n7fNRuFVA57gn/fs2oO8wOwKbIF5ZqcWE5SO+cKQEJOceT3sdj+lHZHLz9qDA2K4p/pC4S2lYcFuQ76kWzgeDiRrThGuUFnznMWWIgicVDdLPU7ctqay88ugCSwB50mMfNj5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1nA6W2yKtuN9P6MY2MY0nosJ6duzbftofGk5wtaPzA=;
 b=eYZRew0u/T0MpnRL7v0EdD1nSFSRHecxAdv2Qm9pgfMYvxw6rsnXxCxfGQmH6UDVh2aXwglDjH4mcWeTPBlXTZOZljenKm19A+YcWYNFdVUcUWLHdxbBIEHZUx61Yj25Y5LmRJc45AIYenqPyRR5JMf5p4m7dNBOhvd/oJ/ZTrGQf8AqewQK4d6gjzsrDgZnsciAtCq/5mHco+vwm8MxkeCFCkhvbj5i9hX63xQLSa/fdbN29REKEoetMwOv/HDFwy4shGPBMY3v9Rl8eTi0qQG43SvBQR+w8UVObZD4ZF1IlGZicvcYeOfxCd0W07Tv3rHv2/qXR94jofsSOrpOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1nA6W2yKtuN9P6MY2MY0nosJ6duzbftofGk5wtaPzA=;
 b=Sipp6Q4zGuK98M5kxQQA+3ztHIKu9/CDYdC9y1jDwWx7fMwZG6/mzE5TZ/EF+UrNmZcGCXnl4y+xemkdAueHPpy75QDi6TkfNVmrvK+lypmYvtZtxHbp3uTxttesuZ2gXRD2/mRfXzAp2xrSki4XVJmXhN29MKOkig6aQ/NM+2o=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3045.namprd12.prod.outlook.com (2603:10b6:a03:ac::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 19:37:16 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 19:37:15 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] binutils/ARC: cleanup
Thread-Topic: [PATCH v2] binutils/ARC: cleanup
Thread-Index: AQHWh8kkJWaDP3nzjEqSzXbfxCchqaljKXIAgACs4IA=
Date: Fri, 11 Sep 2020 19:37:15 +0000
Message-ID: <afd5edc5-93b8-e838-d79c-9f14d7a60943@synopsys.com>
References: <20191206221918.1c05e316@windsurf.home>
 <20191217213253.12446-1-vgupta@synopsys.com>
 <20191222224144.38603994@windsurf>
 <3b18564e-be2e-91b3-def1-6c3591288ecc@synopsys.com>
 <20200911111828.5c9ea5d5@windsurf.hq.k.grp>
In-Reply-To: <20200911111828.5c9ea5d5@windsurf.hq.k.grp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [107.3.145.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9eaf13eb-149b-4767-3aa6-08d8568a16b6
x-ms-traffictypediagnostic: BYAPR12MB3045:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3045254A59F14DB47A3B46D8B6240@BYAPR12MB3045.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FEycQlx1UU6FYga+5s9uM7saYoamiMO0ZJow8mY5o1P04a3Lc2WlYNSctyHkot8/ntTnvF8wDNYs0rDvkkB2Uzq3crkRFxEenv+y82bSMNxq0QHdG6nO4D1Ge86BT6np8T7DHDS/gQwoj28YTcKwHNIQrZQSti6f58sKu9cVCNfgRlP1ikxbbqY25AFz1oT8LsV11tyTbZH3yI8WJNUDJtkZ3ctcNRzsZ7jutxQstgh6APUV9eoSKhADiKqM/Tj7tbWzCzdZ//8A2S5tRi7Dxtr+to2l16GN2mAox8Jniu1VUCWkRWsAMpIfRxHVMF7JIJtvHIWPPlVNXGJPwmfUkA5bXzNsMNScgTov5cRMRJfrlpGt2lBVUMTuNl9AOFgV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(346002)(376002)(136003)(76116006)(107886003)(6486002)(2616005)(316002)(83380400001)(26005)(186003)(66476007)(64756008)(71200400001)(54906003)(66556008)(66446008)(36756003)(478600001)(8676002)(6916009)(4326008)(31686004)(66946007)(8936002)(6506007)(5660300002)(86362001)(2906002)(31696002)(53546011)(6512007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bcUt2SnuToly5H0+jNIbqUiGlo5GO5G6/o1RiTGUV06jnFabJ+O8PrUdlkyIa6W/UgN1fW33J1y2V/sOEgDDXcyE8nXnRTV1t2kR4k8JdRJwmXC/hzRbU/fIe2jlHZdZozSrkhpLNI+P0BsBwxmgPxeUOxyaqHbLqdC+/GG/mCh8aw+T+M8EuHXyJo7g90vzBiNudQl/zWNs3NLRD2ToSmZj0cQUMWU2+Avk0H4Bd/iI4KLCwrJx1OsUpyNWHtdODNMcT64YtWi4eWMwzKr6NJHJ4wINFHDXPwoggOREDKvwUMA7kYJ9P4e+MocUkvpPtSnKsU31nSH2/Soyhq5UXTTd3vb4axLJEr0xdsCv+RscYL1xS2FMnVSWPDmex1O8WFLTXafFV87iBbH/iNDOZMrsKxfOp7pwYuLsc8buNYRdYU49+oTI7v4snMOd+OfyKCA8BUtIjeq3o/0qIe5q2xIU5SqnQ7TksM4fEstaT2OtxOADxoH8IDbFlpYwDD/IxXzzbDaivoaUMtOzEe2EYQVAO6aD2QrDyfLB232qMFk9Fj2YJ3GAF2vYHJwZK0ZjUCPVLsBBL1IQl4JwdZSDj2x3Up7ppBF/MI6U4gdzWAEu4ZQ8zrvUoKBysbZY6EwC2vEtxuOfkQr02gtkJUyehA==
Content-ID: <5D70BDF200FCB342854C93969EC8B440@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaf13eb-149b-4767-3aa6-08d8568a16b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 19:37:15.7623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9lbZ5JA6WJ/PzNQofot7GtWRE3PPHR0IVID8uw6p1NT5N7clogjVaDRka2ZBs8ZwEndbI3yWjrSkvJ6d7eoYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_153727_541822_8B0BA05D 
X-CRM114-Status: GOOD (  25.26  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/11/20 2:18 AM, Thomas Petazzoni wrote:
> Hello Vineet,
>
> On Thu, 10 Sep 2020 23:21:43 +0000
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
>>>> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
>>>> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)  
>> Looks like we need this specific thunk anyways. When I select pristine upstream
>> binutils (not ARC fork @ github), the above forces it to download from github
>> which it should not and will not if the tag/branch has not been mirrored there.
> So I guess you're talking about the situation where a host-binutils is
> not enabled, and only a target binutils is used. 

No sorry, I was not. I was trying to build a host binutils off upstream 2.34 and
must have some local change to make it download 2.34 off of github ARC fork. I
can't reproduce it now.

> In this case, indeed:
>
> ifeq ($(BINUTILS_VERSION),)
> ifeq ($(BR2_arc),y)
> BINUTILS_VERSION = arc-2020.03-release
> else
> BINUTILS_VERSION = 2.33.1
> endif
> endif # BINUTILS_VERSION
>
> will kick in and set BINUTILS_VERSION to arc-2020.03-release, which
> will lead to:
>
> ifeq ($(BINUTILS_VERSION),arc-2020.03-release)
> BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
> BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
> BINUTILS_FROM_GIT = y
> endif

The use of a single release string to decide where to download off of seems a bit
fragile. But given we are moving away from fork gradually it seems OK.

> being taken into account.
>
> What happens with target binutils is:
>
>  (1) If a host-binutils is built (because Buildroot is building the
>      toolchain), then we're using the same version as the
>      host-binutils, which is defined by the choice in
>      package/binutils/Config.in.host.
>
>  (2) If not host-binutils is built (because we're using an external
>      toolchain), then there is no version selection: we unconditionally
>      use 2.33.1, except on ARC where we use the special ARC fork.
>
> So I guess the decision to take is: do we want to switch to using the
> upstream binutils, even for ARC, when no host-binutils is built ?

I suppose so. upstream binutils is perhaps an odd commit or two behind the fork,
if at all.
I'll pester Alexey to just ditch binutils fork for upstream buildroot.

>
> Best regards,
>
> Thomas

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
