Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7285BC33C9E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 00:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3AD24673
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 00:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lsfatNWl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EGgvnzcP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="hzGfp4yP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3AD24673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJRAFzw9OIBOCglf9A6UQab0v5GMsmudPorYkLjk8U0=; b=lsfatNWlD8CX25
	EK6RVybFAQY1GrdQYjrlNM1T9yNuItJKuob7xdCD3SddEHrC2Fxy13HkuHsAVAel/MjXQ+bb1J/MN
	CX+6gcSLVWNWXgwhKqk+ewXNNPpd7gqAm2a/0kf5DctA8FDfTcX7azJcuFLn4Rkvy8GZA7vJYiMJN
	oqzdeyzfDOm0Et9l7/WUIjPeJYknbi6p+yKCA1pOcySCzH1+QowEebUAAQtmq/W7H2igZknhEAZKI
	kc/QePyDlsD0AfYIsxxuDBhZknvZI3ysPLV5KIJ6rZSffUdjoz4vUS7eZv2d8AlvkqOmfocQ292Fe
	S2v0f1EpaUD5Gx7+D7yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irWCs-0004gE-Q7; Wed, 15 Jan 2020 00:06:46 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irWCp-0004fl-6F
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 00:06:45 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 775E2C00BC;
 Wed, 15 Jan 2020 00:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579046801; bh=dyiog+Qk07/7q7dzzHPVd5yMiUTDJ0S3CRzica7KXNM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=EGgvnzcPw/pdtJMPw9Z3J77e7MRN7cnQzx/ptYUuE4h9Tf5jP1NZBH4btseRX0T/Y
 M3hgJ+ba45huQWWZixh9tHReYmpmRV0HrFcPkpWsuJHFnACDeqE6tkKWY/TXlrZORb
 nnyuRdTKGqfF0U+8vUeSvPbVRXIOiiwF+TatTs0h9p4FL2V69pBTpaKKkQpsHb83ly
 FW0O8GOLqAIpcHBe1goWh6p0eLcIPdIZJbY2coH6FFD9rimh/PoN75zq3BwUqBmeCm
 US2oXqVRtQjtDatrC9bWUB3yfEoMZmldzW4a+czfzepw9POwvb0gVNxO+Wb8L+GyvQ
 WuZ6boEO29Daw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1F919A0079;
 Wed, 15 Jan 2020 00:06:39 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Jan 2020 16:06:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Jan 2020 16:06:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngtboYs8jFpwh6utuxBvxn5ubtCWzpf6RUFvopsI9EmbFb1NZSB8Hj5dbI7OSJF+uI8M9fVvcacUhtCU2+GKf4H/CNYVP1zWUCB53wNNLz4CrQd1/2bfWLQL+kqlndG3pU90TLkkrUKtOZ/8KolG+9e5KavTb3sYS+dj9ujm0fM1ggV/LiLVHoFbIruh7M+ncWZI/YJMtpHdVyE5UI+qHu4QVhYwFXOUrnKjYDkYWCcPBArjZDJazXiCSQ+GthHwVbrjXcto9GA4BEli1EKVBIWzV0DJHZ56Goc8ShAV6wdI1c4jgoR3gd7V3Y+qkXzuCsphghpZDvZ+HWovRm29Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyiog+Qk07/7q7dzzHPVd5yMiUTDJ0S3CRzica7KXNM=;
 b=DOiDzfvVaLlt8sT5vZdLdXSS12DULuwAqVa2775tWAlBlP+qTpEPBziNc6A1dC9V3CJ6JTYmuzjtUFLdOtWum92lHKA7wtkCixfjRsHLT+cjSfJS1dJlGWHf2O3uoKlzlakZb5FLfo8b+BPL1z9sGq1BDeH2ws6hmhTnZwUztLxXH5kYk6P/siHH2GnUmrh5MAf03yGU3DV5Vvo7ikEaj73s1gSN1IOVWggVS1ZHplfzLD2UaVoJ1hEaHjHkw0OolLOfz9HrT/JfLRylSBK0ygQQ8iPVoRPF6HR4/8GvfzjCWyqLJuUxHMGDcrIeWyHOkSseEN0zjkDcoz6j0fOBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyiog+Qk07/7q7dzzHPVd5yMiUTDJ0S3CRzica7KXNM=;
 b=hzGfp4yPdr9PD9Cu5alZLxwpZpfhBhpuoMel3hYBrAQnYkl1/Ip0CfIL0d6lcAQu6ItzMGeC6Qh8It2CrLbB3RA6ajme7m/uCoh4mwdj97T4MJgDymoKZEkXwFQ5eahWlkMK5JMeTWNdbq6hBQ8I8Z8+yODiQPtKOpFomk2L48M=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2696.namprd12.prod.outlook.com (20.177.124.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.16; Wed, 15 Jan 2020 00:06:19 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 00:06:19 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>
Subject: Re: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Topic: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Index: AQHVrsNTrzsWmijS+E6tvVh7KNVZ4KfrDRaAgAAEmoA=
Date: Wed, 15 Jan 2020 00:06:19 +0000
Message-ID: <9cf97741-d201-e196-fb9b-6c1d13ceb49e@synopsys.com>
References: <20191209190218.20544-1-vgupta@synopsys.com>
 <7264f71a-9a6b-54aa-495f-04cc8702facb@synopsys.com>
In-Reply-To: <7264f71a-9a6b-54aa-495f-04cc8702facb@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ba992cb-ed34-4f24-0b51-08d7994ebf8b
x-ms-traffictypediagnostic: BYAPR12MB2696:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB26963D213D07AB6790AA3B53B6370@BYAPR12MB2696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(366004)(39860400002)(136003)(189003)(199004)(5660300002)(66556008)(4326008)(66946007)(66446008)(36756003)(66476007)(53546011)(6506007)(478600001)(54906003)(8936002)(6486002)(86362001)(76116006)(81166006)(4744005)(2906002)(31696002)(6916009)(26005)(71200400001)(316002)(31686004)(107886003)(64756008)(2616005)(186003)(6512007)(8676002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2696;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBTAK+29hOY94F+bKKcSkIu0Ph/1+YJVYM7kD9qvIny4xStfUxjERch4dbVWNFYzjhhn6/pHHuVHCtD/kj/mHMc0qWOIVZbxPwVxc9bD8SmzOSWtNIrZdimkW6uwqyVc89cusIkDLT8kCA5PYZzJvNg5rfBXv9Eh9DF93TYV/lXxSTlf/IhY0ii61X1LoDXAOCLyTO3mzA0s5HYVo4vsp+3b3odv5Zo6eZmMzLH2oa7+CPwGEPKFC8lk0SKZE6tEgcu1RNGpN4VZIFA/w2fAk+5IGA2IZkanxy1BY2stoMdEopqAYEHpROMtzME9W/F0e6ZEj9gxXGuDTDQyNlRmQanUbaPqGQL/D44XleLlG4QxmLW3GXFx9CXe5JxvkbtTefxaoGygmYi8HGDDPesQtqcyf0tefq4ieM+WkWO1UPrFseMdQwm+BpHyeUtfDWkp
Content-ID: <147C1C1485F7694D88713C7577495F47@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba992cb-ed34-4f24-0b51-08d7994ebf8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 00:06:19.5254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nn416lONHxHRoo5Ra4+DgOsbT4Od3emhfponGoU1iPeiYhkoGGXVSzQmIOUWbvh4rUhhjGT0i72Muiqz3Z6WwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2696
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_160643_346342_2730A200 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "andrew.burgess@embecosm.com" <andrew.burgess@embecosm.com>,
 Claudiu  Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/14/20 3:49 PM, Vineet Gupta wrote:
> On 12/9/19 11:02 AM, Vineet Gupta wrote:
>> ARC gcc generates FDCMP instructions which raises Invalid operation for
>> signaling NaN only. This causes glibc iseqsig() primitives to fail (in
>> the current ongoing glibc port to ARC)
>>
>> So split up the hard float compares into two categories and for unordered
>> compares generate the FDCMPF instruction (vs. FDCMP) which raises exception
>> for either NaNs.
>>
>> With this fix testsuite/gcc.dg/torture/pr52451.c passes for ARC.
>>
>> Also passes 6 additional tests in glibc testsuite (test*iseqsig) and no
>> regressions
> Can this be backported to gcc-9 please ?
> glibc testing uses gcc-9

Never mind, I see that it is present in upstream/releases/gcc-9 !

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
