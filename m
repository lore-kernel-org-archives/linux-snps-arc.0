Return-Path: <SRS0=5IfC=AN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ED4C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 01:00:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 878DB207F5
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jul 2020 01:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="23DsNFpV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BgSUn+Fd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HfTidA5/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 878DB207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3c4A1FNe7aqXjmtEX+76mHjWdHfN8Toc1WSPnbv0nBI=; b=23DsNFpVXhZaFSPhU9rPcqtmy
	gdfZkB9D7zdIERoE3138wXmUKTY4I5DdbKwf0AcvlRHy5guz1/pfw6fIe+0JgxE9agA3XJs/falon
	tTNtrRDO8bDFAPdOfre7IbY4utKVoJM0u/thZrn0BNVO4nNDYgJHMaaeK6jHGMt+0pNtN/1iSZCzJ
	KV9DUpEHtZ793CBaareR3hwF0BpoCF/vBwSYrB5l/Xmae32maCF8Vx0phMp7a6BPo4P4g1jRz6QX7
	S46/odd9T8lwvfBmLd/3lLbrH0Qy38nv78HVECBXewxc6x8ZHjj/PKEcrvLX0ebLepRm2dINPViwW
	sLXPIml1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqnab-0005f9-JE; Thu, 02 Jul 2020 01:00:33 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqnaY-0005ek-L1
 for linux-snps-arc@lists.infradead.org; Thu, 02 Jul 2020 01:00:31 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 05802C03C2;
 Thu,  2 Jul 2020 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593651626; bh=iBnJN/Qxpvlhm4E2Lr2z0PzGKHMkJHXdeCbZ5l1CtDQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BgSUn+FdRPB5RI3Pse6K65z8CR+NYSuttN6efqxlmNxBhBApKaT3bAYej9Xxlv60b
 xV6o97U0a6SwC0DM83HtCCzIH7Zl27KFN+qOiNuQY3tRtzcMYrgzLPf+1OT/592pwW
 26DZ9dEUmhgAll3Ld4V40asGNIVhlGDBfRvXwvHwzsssy3mJqgnCnHw+X7AyVeZ0e3
 dcQ66ZHm2rfLqxPveSlgFjY9M5gGPrxdetUWQxq4cm/spumW8PuWp+iy+1d0FzgWNf
 JUdRmGTmxlUO5jDpy5GZVo3t9pmgPUV+k+KC0MmlAs3UiEvhVOX8xJVJONb44zuGy9
 R1Cf60dSTb/IQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 96168A006F;
 Thu,  2 Jul 2020 01:00:23 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 923CB80056;
 Thu,  2 Jul 2020 01:00:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="HfTidA5/";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgs3UdZlQiPy++68/29xX+G6i1DRuuQniFeYVODaltNK6GRY8JLHCkhR+Mg9z/aYjOwGXCU5ASMvDgWiQMVacd1CtFvjziKuj7L9VPk8Qtqp45UToq2/Yery99aOkxFvRPTEOm7BvBVrQnOBUsFr8InXdZ72v61bu2wzdXRlaI7jRAvMaYVszAJURnDnScSsfqde+fJ3g8SEIDMJ2ezxcVPyvqhE9D8SGejUu8Ctl/bbQohekzFdTcSKGFOLt8hLueFk0fdvbF5MQzu5EdbagwEmRa9grIW2xgUtQzWPRjqBE4g91zdlrn7s/eLaUBzWUDiSw1TQbsM2JwyXC6ZgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBnJN/Qxpvlhm4E2Lr2z0PzGKHMkJHXdeCbZ5l1CtDQ=;
 b=BBYmqJXPUSf0sI+C7oVZWFvf4CzzcvXa1tC17xbNRNKE45k6hjuSCjBs8l4f/U20JwKK7vmYhB/PLyMHPDBAK3kLGObNZPCmjQJmIw3a50LA+Vm41YlbY2AJhz40EJO1ln2gcTnu2AxH1zocfieBTygBVMIoPgMGJc5ULdRjAJvJjRajatef0+lDa64U8rgA3PvbpOz99jM4BS8yeaLak6Jk85Qt8Hp09hCM3wwL86yy3LAQJyqyIYl5vuYjqL/p9qMfTMtW8E4oPKHBmr1MHrFTsIheG4vpKZrQ4e9c+afeJuWIzKG0hge9RqnOse0NR/+yRGthfhWcNpo2qy3TrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBnJN/Qxpvlhm4E2Lr2z0PzGKHMkJHXdeCbZ5l1CtDQ=;
 b=HfTidA5/QPgA9e+F0UtVn/XiP518dBoDAdmWz0nKQyoR3YpELyGWa+G2avSlsv8jJAfd/fXi/CQYzxrsrpE2m3h8l4vD7OMLcG8ImLMv00DA1Co4QWyfzUfWgkRPKRFO+Kyyj/X3loggIW+o1LPKq4RCN+SEXwVqE6FY/WX83IQ=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2808.namprd12.prod.outlook.com (2603:10b6:a03:69::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 01:00:19 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Thu, 2 Jul 2020
 01:00:19 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: ARC math test regressions (was Re: [PATCH v7 00/13] glibc port to ARC
 processors)
Thread-Topic: ARC math test regressions (was Re: [PATCH v7 00/13] glibc port
 to ARC processors)
Thread-Index: AQHWUAwnJO6kctxg1ECtSGYXjTKDiA==
Date: Thu, 2 Jul 2020 01:00:19 +0000
Message-ID: <4a04f8dc-c888-1411-0add-8603822d5ee4@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
 <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
 <e88bc836-ff16-d32b-cc06-fa473c4c6744@synopsys.com>
In-Reply-To: <e88bc836-ff16-d32b-cc06-fa473c4c6744@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 70444859-416e-42ce-88af-08d81e234a5e
x-ms-traffictypediagnostic: BYAPR12MB2808:
x-microsoft-antispam-prvs: <BYAPR12MB2808FFB22C465426C7F47176B66D0@BYAPR12MB2808.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6b2Hvbo3rILACBqsPDP7k8kgBVcjyRrYCwruzvGnwZGIEdGyjSEatAHJ5SNwCsQvdkFWnQxk3615PH8vTtpV+Vxr7gT0E10n0gWp5o5Q+2uJWyONk38HQDkYdN2PpjN7eTWtYctbWvMG2bvpsKQcJU+erOyKcDPaUibu5Ntpjbib6x6mQhLjNr3+dSEZyxdXCqFKqk0fGvCpaFjhzKsW/x8Ph4r/f1AfpZXIB9oSZlAXPyAENFrdWkCHww5rF1n3skNRB34tL9AjZBENGjZEQRR6lVPCs1wpy9Q+sHUj83wLjCChX+OfWxO06lA3W95TmjyzmCfL3ddk8L80zRj0WI3mIVUhqust4Zo0tX3fLIsYWs8D1AElF5sNXNlM1Lo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(39860400002)(136003)(346002)(376002)(478600001)(66556008)(8676002)(66946007)(316002)(110136005)(2906002)(31686004)(8936002)(83380400001)(71200400001)(76116006)(64756008)(66476007)(66446008)(5660300002)(2616005)(36756003)(4326008)(31696002)(86362001)(53546011)(6512007)(6486002)(6506007)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1TCAZhGM6Ml4MJPJwLeScsDQCmuPP/HfJ06cEa/MIq66gkkLYkkilCYegP7akOFi7wuASK+6qu65+PCsZiwW0qTPDBhZD2jo2fxLbIFJRJ7zJaE6FhwgDwWIioSg47/ye3bs8EhhqipVa5tUdZFABpbukajVhn3y1kxRXscklprzmRLvd9aoljXXgwVECh68AuMV60DUeQjRp84PD/rHKwFMbjg+BWZZVTeOdJezkBO36rvZS2kUGWnEECjpeEYGUxogFsL9kQwbFiNl3SIXtCtUsJ+JAjVcigDSRsnn80NADo0ZyXfMrxRuvt6Yoo8gUqpbdnYa18SlTbJO+q2m7NUpH8jmivLcjuSK2t743wSFIe1bezq4CbXEvlImxkp2IB0qQOmIAhBBcoVgZ5+JCsttUtqRCJ5ScShZEJ/rbb5DUmqU1s7t3AOaQFQOYro5/MMExmzkTxzE23anHtbgKMAALheRBlMDjRU0vCTFH0pkbwuK9oo2ffbtTTPy8osaq06Uo+J/YsU+d1OaCFxKyQuAivvMm1ETv0Gv8kRuWJDMUNUxC2MQMZmvyj8y+yGL
x-ms-exchange-transport-forked: True
Content-ID: <E2475F186BBA64499C0BB00E0A6D8BA5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70444859-416e-42ce-88af-08d81e234a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 01:00:19.1254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qS4+MuXs59XKi5rhrFzJXRPDKU6RRjfO7s+67OLw1a8bQoGLVeeJiazkk3Dhk20pJ6NsWxYqnd/dHGEAu6xc0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_210031_111251_63A8D278 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/1/20 12:13 PM, Vineet Gupta via Libc-alpha wrote:
> On 6/30/20 6:44 PM, Adhemerval Zanella via Libc-alpha wrote:


> FAIL: math/test-float-exp10
> FAIL: math/test-float32-exp10

The exp10 tests needed regen-ulps and now fixed.

> FAIL: math/test-float32x-acos
> FAIL: math/test-float32x-asin
> FAIL: math/test-float64-acos
> FAIL: math/test-float64-asin
> FAIL: math/test-ldouble-acos
> FAIL: math/test-ldouble-asin

This is a regression, as we had no math errors before.

Here's my analysis of the issue so far (I don't have prior builds to corroborate
here).

The failures are following

| Failure: acos (inf): Exception "Invalid operation" not set
| Failure: acos (-inf): Exception "Invalid operation" not set
| Failure: acos (1.125): Exception "Invalid operation" not set
| Failure: acos (-1.125): Exception "Invalid operation" not set
| Failure: acos (max_value): Exception "Invalid operation" not set
| Failure: acos (-max_value): Exception "Invalid operation" not set
...
...
| similarly 6 for each of acos_downward(), acos_towardzero (), acos_upward ()


Simple testcase which confirms that Invalid Exception is *not* being raised

| double in = __builtin_inf ();
| acos(in);
| pass = fetestexcept(FE_INVALID);

Exception *is* raised for @in = __builtin_nans("")

Now acos can come from 2 places depending on LIBM_SVID_COMPAT
 - math/w_acos_template.c	<-- sets errno only
 - math/w_acos_compat.c	<-- raises exception FE_INVALID

For ARC, 1st variant is building, so explicit exception is NOT raised.
Is this the issue ?

Or is Invalid Exception supposed to be set by the prologue in acos (both variants)
which looks like following:

__acos (double x)
{
  if (__builtin_expect ((__builtin_isgreater(fabs (x), 1.0)), 0))

isgreater() is not unordered so it is not supposed to raise exception unless
signaling so it can't be, and fabs() doesn't seem be doing much except clipping
off some bits.

So I'm confused where the issue is
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
