Return-Path: <SRS0=a/ML=AU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41CDC433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 21:13:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A5020672
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2020 21:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sj7JdmDQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JtP/+G8y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YxY6GlNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A5020672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1NgY7oGxjb94W6B2pddijTa9CE0Lac5sKaGIXJU8aoY=; b=Sj7JdmDQ14Q1MBU7D527q0GDv
	hxx21aqErz7o4vecORpP1aDU+FuBQvjHyz+SP6nMJUd8NBls1IJUtkxX/BDUnTUgTWVf6EEmeltER
	eodwVjcVceGyKCbRvNGh9jC4qBQl6uy+40ziGpDndKwnS9ddGi9FroQ5+2+Dqr+BIRYO8Jr4zRdiG
	z3jvqi4h2ZSyAQoFkcYWtCvuyZhW43IRTmakFk8QegDMGevJ6m9pIbsJmKksyZpwLgN9E29X7jXOy
	zILAXRidmOz0MoU1hDyGMn1oM8PowqXEGPSekSrx+RpsCD+0l55iJQQa2vX5VKeYyvei5c17I+Bty
	j7m/POSeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdre-0002SW-SG; Thu, 09 Jul 2020 21:13:54 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdrc-0002Ru-F7
 for linux-snps-arc@lists.infradead.org; Thu, 09 Jul 2020 21:13:53 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E14E040122;
 Thu,  9 Jul 2020 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594329230; bh=PedMWOTUkwL5WfpWKCw/An4sDGz9K72/WLAvTWGlGwk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JtP/+G8yMCuLLnuFzbDD78voFhnKef9GU9/ZqHd9RRf5HQ7x6vns3gpzxpdlyRZok
 F9r3eFaah2UBLVa34JZzvHbqVZ4z6u+qRLqhV0x2QZBA6tpGsiFKhPlmqv1FeLOvtY
 V7YCVVKKXG6P1ANrSGUfid83ah9pvBOt9nh/yvD+jiFiiMCYnY02WrytOX7EIg8ujj
 qKv+tGw2Z3yq/YXdAjwGw9XoyH7ZrW7Kq6BIWEhp05QjdSd8N/GbrZTJuLSiiGwif3
 QF8pskWWBMWkNA9s3lrPT5ofFhIyvwLn75PKnV9ZyqQwWToWl8mTR9Tt0OcUE3oL5A
 nSGfV4nCTEbTg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D9C25A005A;
 Thu,  9 Jul 2020 21:13:47 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3EFBF800DE;
 Thu,  9 Jul 2020 21:13:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YxY6GlNh";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUJhXdInyUXF3zwyVnVNM2NKwQ5GZb43II0RoJ1zrWqcaQuJi8Dk+4CuU69uEb4NaEUFT39HlvlORtQqGVcpsJNpULy5HJ/ldNDaj8xsd2RJLtlOSTx839A0q1mu6vzGoevQL72ju/ISdpx6RODycVEpobBclb3hvvMBKCCfcjrD1IqeuaPIBqsQvsxb7h7Xf99Iz/aOA8N6Hjr+3rg7gDzKDGc5jmze+MByat8EgWuOHGHkWbaSugwdGoz7dK37XeBr0NYLf3WV/DBReqYTJoEwcW9WNg7RtWc8Pj+sgPiEoB0WM0hTq8s4wDZJAGkFyix+fJqgHrXFHHtQIynkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PedMWOTUkwL5WfpWKCw/An4sDGz9K72/WLAvTWGlGwk=;
 b=i1ankbPcHYhIO0wIob8ODx9Y0Obb2A9x1rPnaALH3yqONBQY4VubM50ATfXNXEnAmbdaaljTmqHUTUVv/7uJN8xA5p2OY7J7hpQ5yNJUcMX2YiB16YjAExa0B8xWHRTylGASnSBWrqGYaIUTxRKvANaX69v/JXACF78XTMWEs2Mjy/tmGMf2srhrpBf4s4OrIYn4NHcuud57v4ziPiJ/n3mFZvb1c0ap4OTJjDRIeUhiUTtqfvf6kZysTSIBF92Fd4jiN6TPy6/yC2t9K56/YgrZVNmED8nkYM8uojVvnypoSW64ATpTPGxSz9R9iGDMMIyvI36KL7f4cpVtueyEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PedMWOTUkwL5WfpWKCw/An4sDGz9K72/WLAvTWGlGwk=;
 b=YxY6GlNhSIPsh/Sai5iRgoRoZCM9CyRKid//PSkzeqAuvyBpraWupeU9W3J7LWUqrNj3keyGBkYAPkbQ1JiFeeJJC4ZmroY3g+PK62gjKs2yT3slUA9oS9RCzblgpiAHlDq7HuQxmHsGG6YWTv8+urd3EuBKoPsytK8lsCC2Ttg=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3207.namprd12.prod.outlook.com (2603:10b6:a03:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 21:13:43 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 21:13:43 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
Thread-Topic: [PATCH v7.2 07/13] ARC: Linux Syscall Interface
Thread-Index: AQHWVKDp5vld8QE1SUOqPd+g+I3Df6j/a8gAgAAFxgCAAFDVAA==
Date: Thu, 9 Jul 2020 21:13:43 +0000
Message-ID: <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
In-Reply-To: <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3556f56b-2f48-41a6-9866-08d8244cf5e2
x-ms-traffictypediagnostic: BYAPR12MB3207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3207DC81C46AD8C539D34FC8B6640@BYAPR12MB3207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O9HYRHFiKv/NTp9aeHuxGBqEN1Ns2T4ZDz12sdJUEBOFSgpgvh14MypYpyaZ9ItLKxRDNb0S6vSNGh0++hWppOM+sZRqCCN7YmJzTTfd1IUkb18nLgSwjy4nsy4WXED/q6s07mB6iX8Y3790/S9mzYfIMIDeEhGtnZh9kDj91lzJLoeXu6TVSQTV1Y15pFXb+koftz4KfLUONW1Sp8TDIjVSUfVr+6RXZLmbINprPO2INO5+LHVs4r+4N1BqhuBGVzXJQuJDIeLCzu+Nn7xRt+5SjBKTSWInb4QPCJdWV65GOQs/09p2ZU2vwJCE6l3ilxdhzcMfh/kRUqFTGUVKHQCVbj87TyVzCWbIvQvzeHERD8bWhxvYRMAuwUTGwdDg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(186003)(36756003)(6512007)(31696002)(66446008)(83380400001)(66556008)(64756008)(8936002)(66476007)(71200400001)(8676002)(478600001)(6486002)(4326008)(2906002)(86362001)(110136005)(2616005)(31686004)(5660300002)(66946007)(76116006)(316002)(6506007)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YRH+bnpWNA7q/92PZ1PBdCFesOQW3r5rz3Sixuzh6iNrDoPrsUOTkaF1coX2LqK0/42mvLVy6omnBXZE6QEkTkA76prGaww5s0fYjydTWwZ/DXS+4qM/wH57O6ju1n76SmQ4at7QR1H3GjVPaxCP2Naqlbg9lEtYJULk+CIlzBt7X4oEVaWNFdks4QP+sRSwL9k7Y/EhF/xykWLKppakkZEPAeKoW48Q85I0rctI8eHjBldX/s+kMp+FgZnl/HL9Vf8iUx9ekPnzAuQ7dZ8HTFcGSOa2IiA11UmMtlTPpT9UHUAcCtrNJX3wIouaPU8N7Qxg4gc02RyCx3SqoxPycFXNBp/S+2G32gSvt2Wo/wlBZY6ej1C0f4JcnaeLfCrciuSSvHNXgOCm5dNESj0rr6nlrFaPGq5BWfBWTHkeOpJKGnackp49R70isMN4TCmy9wleP6KtAfWSZv6DM7O4/H8mljTtToIF/xW5oydOBZS8F85i8CxQ5qxgDC9uDw1//hYCF/Xau34yccoWcKBPro8LpMIcFySRRHH/TmVpAWTJB4AEShj4SrFGXp0G3XVv
Content-ID: <01708BA761E9274F9BEDA05BF3B3B17F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3556f56b-2f48-41a6-9866-08d8244cf5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 21:13:43.3258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MyW6Bdx62WIKdVAPB1h3Hiq8InKdjTLwi84ZeXwZkDh9r5jYL/aHnA85+dJnLFx8PyqdYkq01d4+idJw/yxVmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_171352_893124_05A8CA1E 
X-CRM114-Status: GOOD (  12.83  )
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

On 7/9/20 9:24 AM, Vineet Gupta via Libc-alpha wrote:
> On 7/9/20 9:03 AM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>
>> On 08/07/2020 16:32, Vineet Gupta wrote:
>>> On 7/8/20 9:31 AM, Adhemerval Zanella via Libc-alpha wrote:
>>>>
>>>> On 07/07/2020 17:55, Vineet Gupta via Libc-alpha wrote:
>>>>> ---
>>>>>    Changes since v7.1:
>>>>>      - Added a few more 32-bit time_t syscalls to fixup-asm-unistd.h
>>>>>        and regen arch-syscall.h to remove them: __NR_timer{g,s}ettime,
>>>>>        __NR_clock_{gettime,nanosleep,settime}
>>>>>      - minimal/annotated list of 32-bit syscall aliases in ARC sysdeps.h
>>>>>        for 64-bit time_t support
>>>>>      - Open-coded SYS_ify() but retained the macro as used by common
>>>>>        code
>>>>>      - No functional changes in generated dsos.
>>>>>    Changes since v7:
>>>>>      - used long int (iso int) in sysdep.h/syscall_error for handling registers
>>>> LGTM, thanks.
>>>>
>>>> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
>>>
>>> Thx a lot. I now have Reviewed-by tags on all ARC patches so we just need the
>>> sysvipc/semctl y2038 patches to hit upstream before I can commit.
>>
>> The patches are in, if you could just to a sanity check I will
>> be grateful. 
> 
> Thx.
> 
> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
> abilist updates). Will do a full testsuite run 

No regressions in sysvipc tests !





_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
